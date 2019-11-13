using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Script.Serialization;
using System.Web.Services;
using DATA.DAOS;
using MODEL;

namespace WEB.ws
{
    /// <summary>
    /// Descripción breve de WS_ET_Usuario
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    [System.Web.Script.Services.ScriptService]
    public class WS_ET_Usuario : System.Web.Services.WebService
    {
        public WS_ET_Usuario() {
            Session["renovar"] = true;
        }

        [WebMethod(EnableSession = true)]
        public string insert(String jsonUsuario)
        {
        
            string strJSON =  ((Session["acceso"] == null) || (!(bool)Session["acceso"]))?"NO_SESSION":"";
            if (!strJSON.Equals("")) { return strJSON; }

            bool result = false;
            Usuario objUsuario = null;

            try
            {
                objUsuario = new JavaScriptSerializer().Deserialize<Usuario>(jsonUsuario);

                if (!(new UsuarioDAO().usuarioDuplicado(objUsuario.Username, objUsuario.Tipo)))
                {
                    result = new UsuarioDAO().insert(objUsuario);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return new JavaScriptSerializer().Serialize(result);
        }

        [WebMethod(EnableSession = true)]
        public string update(String jsonUsuario)
        {
            string strJSON =  ((Session["acceso"] == null) || (!(bool)Session["acceso"]))?"NO_SESSION":"";
            if (!strJSON.Equals("")) { return strJSON; }

            bool result = false;
            Usuario objUsuario = null;

            try
            {
                objUsuario = new JavaScriptSerializer().Deserialize<Usuario>(jsonUsuario);

                //if (!(new UsuarioDAO().usuarioDuplicado(objUsuario.Username, objUsuario.Tipo)))
                //{
                    result = new UsuarioDAO().update(objUsuario);

                    if (objUsuario.Password != null)
                    {
                        result = new UsuarioDAO().updatePassword(objUsuario.ID, objUsuario.Password);
                    }
                //}
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return new JavaScriptSerializer().Serialize(result);
        }

        [WebMethod(EnableSession = true)]
        public string delete(int id)
        {
            string strJSON =  ((Session["acceso"] == null) || (!(bool)Session["acceso"]))?"NO_SESSION":"";
            if (!strJSON.Equals("")) { return strJSON; }

            bool result = false;

            try
            {
                Usuario usuario = new UsuarioDAO().getOne(id);

                if (!(usuario.Username.Equals(Session["usuario"].ToString()) && usuario.Tipo.Equals(Session["tipoUsuario"].ToString())))
                {
                        
                            result = new UsuarioDAO().delete(id);
                        
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return new JavaScriptSerializer().Serialize(result);
        }

        [WebMethod(EnableSession = true)]
        public string getAll()
        {
            string strJSON =  ((Session["acceso"] == null) || (!(bool)Session["acceso"]))?"NO_SESSION":"";
            if (!strJSON.Equals("")) { return strJSON; }

            try
            {
                List<Usuario> lstLista = new UsuarioDAO().getAll();
                strJSON = new JavaScriptSerializer().Serialize(lstLista);
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return strJSON;
        }
        
        [WebMethod(EnableSession = true)]
        public string getOne(int id)
        {
            string strJSON =  ((Session["acceso"] == null) || (!(bool)Session["acceso"]))?"NO_SESSION":"";
            if (!strJSON.Equals("")) { return strJSON; }

            try
            {
                Usuario objUsuario = new UsuarioDAO().getOne(id);
                if (objUsuario != null)
                {
                    strJSON = new JavaScriptSerializer().Serialize(objUsuario);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return strJSON;
        }

        [WebMethod(EnableSession = true)]
        public string login(string user, string pass)
        {
            string strJSON = "";

            try
            {
                Usuario objUsuario = new UsuarioDAO().login(user, pass);

                if (objUsuario != null)
                {
                    if (objUsuario.Estado == 1)
                    {
                        Session["tipoUsuario"] = objUsuario.Tipo;
                        Session["nombre"] = objUsuario.Nombre + " " + objUsuario.Apellido1 + " " + objUsuario.Apellido2;
                        Session["usuario"] = objUsuario.Username;
                        Session["idUsuario"] = objUsuario.ID;
                        Session["acceso"] = true;

                        strJSON = "true";
                    }
                    else
                    {
                        strJSON = "false";
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return strJSON;
        }

        [WebMethod(EnableSession = true)]
        public void logout()
        {
            try
            {
                Session.Remove("tipoUsuario");
                Session.Remove("nombre");
                Session.Remove("usuario");
                Session.Remove("idUsuario");
                Session["acceso"] = false;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
