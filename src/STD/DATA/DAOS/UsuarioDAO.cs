using System;
using System.Collections.Generic;
using System.Data;
using DATA.UTIL;
using MODEL;

namespace DATA.DAOS
{
    /// <summary>
    /// Clase para las operaciones con la base de datos relacionadas a la tabla de usuarios.
    /// </summary>
    public class UsuarioDAO
    {
        //Establece la conexión con la base de datos.
        AccesoDatos objAcceso;
        /// <summary>
        /// Inserta un usuario.
        /// </summary>
        /// <param name="usuario"></param>
        /// <returns>
        /// Retorna true si la operación transcurre con exito, si ocurre algún error devuelve false.
        /// </returns>
        public bool insert(Usuario usuario)
        {
            bool result = false;

            try
            {
                using (objAcceso = new AccesoDatos(false))
                {
                    objAcceso.StoreProcedure.Nombre = "PA_ET_USUARIOS_INSERTAR";
                    objAcceso.StoreProcedure.Parametros.Add("@nombre", usuario.Nombre);
                    objAcceso.StoreProcedure.Parametros.Add("@apellido1", usuario.Apellido1);
                    objAcceso.StoreProcedure.Parametros.Add("@apellido2", usuario.Apellido2);
                    objAcceso.StoreProcedure.Parametros.Add("@username", usuario.Username);
                    objAcceso.StoreProcedure.Parametros.Add("@pass", usuario.Password);
                    objAcceso.StoreProcedure.Parametros.Add("@email", usuario.Email);
                    objAcceso.StoreProcedure.Parametros.Add("@tipo", usuario.Tipo);
                    objAcceso.EjecutarCommand(ENUM_EXECUTECOMMAND.NONQUERY);
                    result = true;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return result;
        }
        /// <summary>
        /// Actualiza los datos de un usuario.
        /// </summary>
        /// <param name="usuario"></param>
        /// <returns>
        /// Retorna true si la operación transcurre con exito, si ocurre algun error devuelve false.
        /// </returns>
        public bool update(Usuario usuario)
        {
            bool result = false;

            try
            {
                using (objAcceso = new AccesoDatos(false))
                {
                    objAcceso.StoreProcedure.Nombre = "PA_ET_USUARIOS_ACTUALIZAR";
                    objAcceso.StoreProcedure.Parametros.Add("@id", usuario.ID);
                    objAcceso.StoreProcedure.Parametros.Add("@nombre", usuario.Nombre);
                    objAcceso.StoreProcedure.Parametros.Add("@apellido1", usuario.Apellido1);
                    objAcceso.StoreProcedure.Parametros.Add("@apellido2", usuario.Apellido2);
                    objAcceso.StoreProcedure.Parametros.Add("@email", usuario.Email);
                    objAcceso.StoreProcedure.Parametros.Add("@tipo", usuario.Tipo);
                    objAcceso.StoreProcedure.Parametros.Add("@estado", usuario.Estado);
                    objAcceso.EjecutarCommand(ENUM_EXECUTECOMMAND.NONQUERY);
                    result = true;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return result;
        }
        /// <summary>
        /// Actualiza la cotraseña actual del usuario.
        /// </summary>
        /// <param name="ID"></param>
        /// <param name="password"></param>
        /// <returns>
        /// Retorna true si la operación transcurre con exito, si ocurre algún error devuelve false.
        /// </returns>
        public bool updatePassword(int ID, string password)
        {
            bool result = false;

            try
            {
                using (objAcceso = new AccesoDatos(false))
                {
                    objAcceso.StoreProcedure.Nombre = "PA_ET_USUARIOS_ACTUALIZAR_PASSWORD";
                    objAcceso.StoreProcedure.Parametros.Add("@id", ID);
                    objAcceso.StoreProcedure.Parametros.Add("@pass", password);
                    objAcceso.EjecutarCommand(ENUM_EXECUTECOMMAND.NONQUERY);
                    result = true;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return result;
        }
        /// <summary>
        /// Elimina un usuario en especifico.
        /// </summary>
        /// <param name="ID"></param>
        /// <returns>
        /// Retorna true si la operación transcurre con exito, si ocurre algún error devuelve false.
        /// </returns>
        public bool delete(int ID)
        {
            bool result = false;

            try
            {
                using (objAcceso = new AccesoDatos(false))
                {
                    objAcceso.StoreProcedure.Nombre = "PA_ET_USUARIOS_ELIMINAR";
                    objAcceso.StoreProcedure.Parametros.Add("@id", ID);
                    objAcceso.EjecutarCommand(ENUM_EXECUTECOMMAND.NONQUERY);
                    result = true;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return result;
        }
        /// <summary>
        /// Obtiene todos los usuarios registrados.
        /// </summary>
        /// <returns>
        /// Retorna una lista de tipo Usuario, si ocurre algún error devuelve una lista nula.
        /// </returns>
        public List<Usuario> getAll()
        {
            List<Usuario> lstUsuarios = null;
            DataTable dtTabla = null;

            try
            {
                //using (AccesoDatos objAcceso = new AccesoDatos(false))
                //{
                //    objAcceso.StoreProcedure.Nombre = "PA_ET_USUARIOS_OBTENER_TODOS";
                //    dtTabla = objAcceso.CargarDatos();
                //}

                //if ((dtTabla.Rows.Count > 0))
                //{
                //    lstUsuarios = new List<Usuario>();
                //    foreach (DataRow row in dtTabla.Rows)
                //    {
                //        lstUsuarios.Add(new Usuario(
                //            (int)row["ID"],
                //            row["NOMBRE"].ToString(),
                //            row["APELLIDO1"].ToString(),
                //            row["APELLIDO2"].ToString(),
                //            row["USERNAME"].ToString(),
                //            row["PASS"].ToString(),
                //            row["EMAIL"].ToString(),
                //            row["TIPO"].ToString(),
                //            Convert.ToByte(row["ESTADO"])));
                //    }
                //}
                lstUsuarios = new List<Usuario>();
                lstUsuarios.Add(new Usuario(1,"Juan","Pérez", "Pérez","juan","","juan@gmail.com","Administrador",1));

                lstUsuarios.Add(new Usuario(2, "Ana", "Gómez", "Juárez", "ana", "", "ana@gmail.com", "Auxiliar", 1));

                lstUsuarios.Add(new Usuario(3, "Alberto", "Ramírez", "Cadena", "alberto", "", "alberto@gmail.com", "Auxiliar", 0));
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return lstUsuarios;
        }
        /// <summary>
        /// Obtiene todos los usuarios de tipo entrevistador.
        /// </summary>
        /// <returns>
        /// Retorna una lista de tipo Usuario, si ocurre algún error devuelve una lista nula.
        /// </returns>
        public List<Usuario> getAllEntrevistadores()
        {
            List<Usuario> lstUsuarios = null;
            DataTable dtTabla = null;

            try
            {
                using (AccesoDatos objAcceso = new AccesoDatos(false))
                {
                    objAcceso.StoreProcedure.Nombre = "PA_ET_USUARIOS_OBTENER_TODOS_ENTREVISTADORES";
                    dtTabla = objAcceso.CargarDatos();
                }

                if ((dtTabla.Rows.Count > 0))
                {
                    lstUsuarios = new List<Usuario>();
                    foreach (DataRow row in dtTabla.Rows)
                    {
                        lstUsuarios.Add(new Usuario(
                            (int)row["ID"],
                            row["NOMBRE"].ToString(),
                            row["APELLIDO1"].ToString(),
                            row["APELLIDO2"].ToString(),
                            row["USERNAME"].ToString(),
                            row["PASS"].ToString(),
                            row["EMAIL"].ToString(),
                            row["TIPO"].ToString(),
                            Convert.ToByte(row["ESTADO"])));
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return lstUsuarios;
        }
        /// <summary>
        /// Obtiene los datos de un usuario en especifico.
        /// </summary>
        /// <param name="ID"></param>
        /// <returns>
        /// Retorna un obbjeto de tipo Usuario, si ocurre algún error devuelve un objeto nulo.
        /// </returns>
        public Usuario getOne(int ID)
        {
            Usuario usuario = null;
            DataTable dtTabla = null;

            try
            {
                using (objAcceso = new AccesoDatos(false))
                {
                    objAcceso.StoreProcedure.Nombre = "PA_ET_USUARIOS_OBTENER_UNO";
                    objAcceso.StoreProcedure.Parametros.Add("@id", ID);
                    dtTabla = objAcceso.CargarDatos();
                }

                if ((dtTabla.Rows.Count > 0))
                {
                    DataRow row = dtTabla.Rows[0];
                    usuario = new Usuario(
                        ID,
                        row["NOMBRE"].ToString(),
                        row["APELLIDO1"].ToString(),
                        row["APELLIDO2"].ToString(),
                        row["USERNAME"].ToString(),
                        row["PASS"].ToString(),
                        row["EMAIL"].ToString(),
                        row["TIPO"].ToString(),
                        Convert.ToByte(row["ESTADO"]));
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return usuario;
        }
        /// <summary>
        /// Revisa si que no haya usuarios duplicados.
        /// </summary>
        /// <param name="user"></param>
        /// <param name="tipo"></param>
        /// <returns>
        /// Retorna true si encuentra un usuario que coincida con los parametros, retorna false si no encuentra coincidencia.
        /// </returns>
        public bool usuarioDuplicado(string user, string tipo)
        {
            bool result = false;
            DataTable dtTabla = null;

            try
            {
                using (objAcceso = new AccesoDatos(false))
                {
                    objAcceso.StoreProcedure.Nombre = "PA_ET_USUARIOS_USUARIO_DUPLICADO";
                    objAcceso.StoreProcedure.Parametros.Add("@username", user);
                    objAcceso.StoreProcedure.Parametros.Add("@tipo", tipo);
                    dtTabla = objAcceso.CargarDatos();
                }

                if ((dtTabla.Rows.Count > 0))
                {
                    result = true;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return result;
        }
        /// <summary>
        /// Revisa la coincidencia de los datos que se introducen en el login.
        /// </summary>
        /// <param name="user"></param>
        /// <param name="pass"></param>
        /// <returns>
        /// Retorna un objeto de tipo usuario si ecuentra coincidencia, si no ecuentra coincidencia devuelve un objeto nulo.
        /// </returns>
        public Usuario login(string user, string pass)
        {
            Usuario usuario = null;
            DataTable dtTabla = null;

            try
            {
                //using (objAcceso = new AccesoDatos(false))
                //{
                //    objAcceso.StoreProcedure.Nombre = "PA_ET_USUARIOS_LOGIN";
                //    objAcceso.StoreProcedure.Parametros.Add("@username", user);
                //    objAcceso.StoreProcedure.Parametros.Add("@pass", pass);
                //    dtTabla = objAcceso.CargarDatos();
                //}

                //if ((dtTabla.Rows.Count > 0))
                //{
                //    DataRow row = dtTabla.Rows[0];
                //    usuario = new Usuario(
                //        (int)row["ID"],
                //        row["NOMBRE"].ToString(),
                //        row["APELLIDO1"].ToString(),
                //        row["APELLIDO2"].ToString(),
                //        row["USERNAME"].ToString(),
                //        row["PASS"].ToString(),
                //        row["EMAIL"].ToString(),
                //        row["TIPO"].ToString(),
                //        Convert.ToByte(row["ESTADO"]));
                //}
                if (user.Equals("juan") && pass.Equals("123"))
                usuario = new Usuario(
                    1,
                    "Juan",
                    "Perez",
                    "Perez",
                    "juan",
                    "",
                    "juan@gmail.com",
                    "Administrador",
                    1);
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return usuario;
        }
    }
}
