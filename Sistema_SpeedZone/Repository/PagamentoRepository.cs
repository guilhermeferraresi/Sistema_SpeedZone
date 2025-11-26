using MySql.Data.MySqlClient;
using MySqlX.XDevAPI;
using Sistema_SpeedZone.Models;
using Sistema_SpeedZone.Repository.Contract;
using System.Data;


namespace Sistema_SpeedZone.Repository
{
    public class PagamentoRepository : IPagamentoRepository
    {
        private readonly string _conexaoMySQL;
        public PagamentoRepository(IConfiguration conf)
        {
            _conexaoMySQL = conf.GetConnectionString("ConexaoMySQL");
        }


        public void InserirCartao(Cartao cartao)
        {
            using (var conexao = new MySqlConnection(_conexaoMySQL))
            {
                conexao.Open();

                try
                {
                    MySqlCommand cmd = new MySqlCommand("insert into tbCartao(NumeroCartao, Nome, Validade, Bandeira) values(@NumeroCartao, @Nome, @Validade, @Bandeira)", conexao); // @: PARAMETRO

                    cmd.Parameters.Add("@Nome", MySqlDbType.VarChar).Value = cartao.Nome;
                    cmd.Parameters.Add("@NumeroCartao", MySqlDbType.VarChar).Value = cartao.NumeroCartao;
                    cmd.Parameters.Add("@Validade", MySqlDbType.VarChar).Value = cartao.Validade;
                    cmd.Parameters.Add("@Bandeira", MySqlDbType.VarChar).Value = cartao.Bandeira;

                    cmd.ExecuteNonQuery();
                }
                catch (MySqlException ex)
                {
                    throw new Exception(ex.Message);
                }

                conexao.Close();
            }
        }
    }
}
