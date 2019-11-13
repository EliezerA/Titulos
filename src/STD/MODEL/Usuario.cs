
namespace MODEL
{
    /// <summary>
    /// Modelo usuario.
    /// </summary>
    public class Usuario
    {
        public int ID { get; set; }
        public string Nombre { get; set; }
        public string Apellido1 { get; set; }
        public string Apellido2 { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }
        public string Tipo { get; set; }
        public byte Estado { get; set; }

        /// <summary>
        /// Constructor vacio.
        /// </summary>
        public Usuario() { }
        /// <summary>
        /// Constructor del modelo usuario.
        /// </summary>
        /// <param name="id"></param>
        /// <param name="nombre"></param>
        /// <param name="apellido1"></param>
        /// <param name="apellido2"></param>
        /// <param name="username"></param>
        /// <param name="password"></param>
        /// <param name="email"></param>
        /// <param name="tipo"></param>
        /// <param name="estado"></param>
        public Usuario(int id, string nombre, string apellido1, string apellido2, string username, 
                       string password, string email, string tipo, byte estado)
        {
            ID = id;
            Nombre = nombre;
            Apellido1 = apellido1;
            Apellido2 = apellido2;
            Username = username;
            Password = password;
            Email = email;
            Tipo = tipo;
            Estado = estado;
        }
    }
}
