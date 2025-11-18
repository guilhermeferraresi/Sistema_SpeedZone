using MySql.Data.MySqlClient;
using MySqlX.XDevAPI;
using Sistema_SpeedZone.Models;
using Sistema_SpeedZone.Repository.Contract;
using System.Data;


namespace Sistema_SpeedZone.Repository
{
    public class FuncionarioRepository : IFuncionarioRepository
    {
        private readonly string _conexaoMySQL;

        public FuncionarioRepository(IConfiguration conf)
        {
            _conexaoMySQL = conf.GetConnectionString("ConexaoMySQL");
        }

        public void Cadastrar(Funcionario funcionario)
        {
            using (var conexao = new MySqlConnection(_conexaoMySQL))
            {
                conexao.Open();

                MySqlCommand cmd = new MySqlCommand("insert into tbFuncionario(Nome, Nascimento, Sexo, CPF, Telefone, Email, Senha) " +
                    " values (@Nome, @Nascimento, @Sexo, @CPF, @Telefone, @Email, @Senha)", conexao); // @: PARAMETRO

                cmd.Parameters.Add("@Nome", MySqlDbType.VarChar).Value = funcionario.Nome;
                cmd.Parameters.Add("@Nascimento", MySqlDbType.DateTime).Value = funcionario.Nascimento.ToString("yyyy/MM/dd");
                cmd.Parameters.Add("@Sexo", MySqlDbType.VarChar).Value = funcionario.Sexo;
                cmd.Parameters.Add("@CPF", MySqlDbType.VarChar).Value = funcionario.CPF;
                cmd.Parameters.Add("@Telefone", MySqlDbType.VarChar).Value = funcionario.Telefone;
                cmd.Parameters.Add("@Email", MySqlDbType.VarChar).Value = funcionario.Email;
                cmd.Parameters.Add("@Senha", MySqlDbType.VarChar).Value = funcionario.Senha;

                cmd.ExecuteNonQuery();
                conexao.Close();
            }
        }

        public Funcionario Login(string Email, string Senha)
        {
            using (var conexao = new MySqlConnection(_conexaoMySQL))
            {
                conexao.Open();

                MySqlCommand cmd = new MySqlCommand("select * from tbFuncionario where Email = @Email and Senha = @Senha", conexao);

                cmd.Parameters.Add("@Email", MySqlDbType.VarChar).Value = Email;
                cmd.Parameters.Add("@Senha", MySqlDbType.VarChar).Value = Senha;

                MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                MySqlDataReader dr;

                Funcionario funcionario = new Funcionario();
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                while (dr.Read())
                {
                    funcionario.Id = Convert.ToInt32(dr["Id"]);
                    funcionario.Nome = Convert.ToString(dr["Nome"]);
                    funcionario.Nascimento = Convert.ToDateTime(dr["Nascimento"]);

                    funcionario.Sexo = Convert.ToString(dr["Sexo"]);
                    funcionario.CPF = Convert.ToString(dr["CPF"]);
                    funcionario.Telefone = Convert.ToString(dr["Telefone"]);

                    funcionario.Numero = Convert.ToInt32(dr["Numero"]);
                    funcionario.CEP = Convert.ToString(dr["CEP"]);
                    funcionario.Complemento = Convert.ToString(dr["Complemento"]);

                    funcionario.Email = Convert.ToString(dr["Email"]);
                    funcionario.Senha = Convert.ToString(dr["Senha"]);
                }

                return funcionario;
            }
        }
    }
}
