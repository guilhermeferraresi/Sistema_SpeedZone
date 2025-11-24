using MySql.Data.MySqlClient;
using MySqlX.XDevAPI;
using Sistema_SpeedZone.Models;
using Sistema_SpeedZone.Repository.Contract;
using System.Data;

namespace Sistema_SpeedZone.Repository
{
    public class ClienteRepository : IClienteRepository
    {

        private readonly string _conexaoMySQL;
        public ClienteRepository(IConfiguration conf) 
        {
            _conexaoMySQL = conf.GetConnectionString("ConexaoMySQL");
        }

        public void Cadastrar(Usuario usuario)
        {
            using (var conexao = new MySqlConnection(_conexaoMySQL))
            {
                conexao.Open();

                try
                {
                    MySqlCommand cmd = new MySqlCommand("call cadastrarUsuario(@Nome, @CPF, @Nascimento,  @Telefone, @Email, @Senha, @ConfSenha, @NumEnd, @CEP, @Compend, @RG)", conexao); // @: PARAMETRO

                    cmd.Parameters.Add("@Nome", MySqlDbType.VarChar).Value = usuario.Nome;
                    cmd.Parameters.Add("@Nascimento", MySqlDbType.DateTime).Value = usuario.Nascimento.ToString("yyyy/MM/dd");
                    //cmd.Parameters.Add("@Sexo", MySqlDbType.VarChar).Value = usuario.Sexo;
                    cmd.Parameters.Add("@CPF", MySqlDbType.VarChar).Value = usuario.CPF;
                    cmd.Parameters.Add("@RG", MySqlDbType.VarChar).Value = usuario.RG;
                    cmd.Parameters.Add("@Telefone", MySqlDbType.VarChar).Value = usuario.Telefone;
                    cmd.Parameters.Add("@Email", MySqlDbType.VarChar).Value = usuario.Email;
                    cmd.Parameters.Add("@Senha", MySqlDbType.VarChar).Value = usuario.Senha;
                    cmd.Parameters.Add("@ConfSenha", MySqlDbType.VarChar).Value = usuario.ConfSenha;
                    cmd.Parameters.Add("@NumEnd", MySqlDbType.VarChar).Value = usuario.Numero;
                    cmd.Parameters.Add("@CEP", MySqlDbType.VarChar).Value = usuario.CEP;
                    cmd.Parameters.Add("@Compend", MySqlDbType.VarChar).Value = usuario.Complemento;

                    cmd.ExecuteNonQuery();
                }
                catch (MySqlException ex)
                {
                    throw new Exception(ex.Message);
                }

                conexao.Close();
            }

        }

        public Usuario Login(string Email, string Senha)
        {
            using (var conexao = new MySqlConnection(_conexaoMySQL))
            {
                conexao.Open();

                MySqlCommand cmd = new MySqlCommand("select * from tbUsuario where Email = @Email and Senha = @Senha", conexao);

                cmd.Parameters.Add("@Email", MySqlDbType.VarChar).Value = Email;
                cmd.Parameters.Add("@Senha", MySqlDbType.VarChar).Value = Senha;

                MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                MySqlDataReader dr;

                Usuario usuario = new Usuario();
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                while (dr.Read())
                {
                    usuario.Id = Convert.ToInt32(dr["IdUsuario"]);
                    usuario.Nome = Convert.ToString(dr["Nome"]);
                    usuario.Nascimento = Convert.ToDateTime(dr["DataNasc"]);

                    //usuario.Sexo = Convert.ToString(dr["Sexo"]);
                    usuario.CPF = Convert.ToString(dr["CPF"]);
                    usuario.RG = Convert.ToString(dr["RG"]);
                    usuario.Telefone = Convert.ToString(dr["Telefone"]);

                    usuario.Numero = Convert.ToInt32(dr["NumEnd"]);
                    usuario.CEP = Convert.ToString(dr["CEP"]);
                    usuario.Complemento = Convert.ToString(dr["CompEnd"]);

                    usuario.Email = Convert.ToString(dr["Email"]);
                    usuario.Senha = Convert.ToString(dr["Senha"]);
                }

                return usuario;
            }

        }
    }
}
