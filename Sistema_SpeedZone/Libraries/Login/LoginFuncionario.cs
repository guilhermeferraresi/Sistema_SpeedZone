using Newtonsoft.Json;
using Sistema_SpeedZone.Models;

namespace Sistema_SpeedZone.Libraries.Login
{
    public class LoginFuncionario
    {
        private string Key = "Login.Funcionario";
        private Sessao.Sessao _sessao;

        public LoginFuncionario(Sessao.Sessao sessao)
        {
            _sessao = sessao;
        }

        public void Login(Funcionario funcionario)
        {
            string funcionarioJSONString = JsonConvert.SerializeObject(funcionario);
            _sessao.Cadastrar(Key, funcionarioJSONString);
        }

        //Reverter o JASON para objeto Funcionario **Deserializar**
        public Funcionario GetFuncionario()
        {
            if (_sessao.Existe(Key))
            {
                string funcionarioJSONString = _sessao.Consultar(Key);
                return JsonConvert.DeserializeObject<Funcionario>(funcionarioJSONString);
            }
            else
            {
                return null;
            }
        }

        //Remove a sessao e desloga o funcionario
        public void Logout()
        {
            _sessao.RemoverTodos();
        }
    }
}
