using Newtonsoft.Json;
using Sistema_SpeedZone.Models;

namespace Sistema_SpeedZone.Libraries.Login
{
    public class LoginUsuario
    {
        private string Key = "Login.Usuario";
        private Sessao.Sessao _sessao;

        public LoginUsuario(Sessao.Sessao sessao)
        {
            _sessao = sessao;
        }

        public void Login(Usuario usuario)
        {
            string usuarioJSONString = JsonConvert.SerializeObject(usuario);
            _sessao.Cadastrar(Key, usuarioJSONString);
        }

        //Reverter o JASON para objeto Usuario **Deserializar**
        public Usuario GetUsuario()
        {
            if (_sessao.Existe(Key))
            {
                string usuarioJSONString = _sessao.Consultar(Key);
                return JsonConvert.DeserializeObject<Usuario>(usuarioJSONString);
            }
            else
            {
                return null;
            }
        }

        //Remove a sessao e desloga o usuario
        public void Logout()
        {
            _sessao.RemoverTodos();
        }
    }
}
