using Sistema_SpeedZone.Models;
using Sistema_SpeedZone.Repository.Contract;
using Newtonsoft.Json;
using MySql.Data.MySqlClient;
using System.Data;

namespace Sistema_SpeedZone.Repository
{
    public class PedidoRepository : IPedidoRepository
    {
        private readonly string _conexaoMySQL;
        public PedidoRepository(IConfiguration conf)
        {
            _conexaoMySQL = conf.GetConnectionString("ConexaoMySQL");
        }

        public IEnumerable<Pedido> ObterTodosPedidos()
        {
            List<Pedido> pedido = new List<Pedido>();
            using (var conexao = new MySqlConnection(_conexaoMySQL))
            {
                conexao.Open();

                MySqlCommand cmd = new MySqlCommand("select * from tbPersonalizacao", conexao);

                MySqlDataAdapter da = new MySqlDataAdapter(cmd);

                DataTable dt = new DataTable();

                da.Fill(dt);
                conexao.Close();

                foreach (DataRow dr in dt.Rows)
                {
                    pedido.Add(
                        new Pedido
                        {
                            IdPedido = Convert.ToInt32(dr["IdPersonalizacao"]),
                            Modelo = Convert.ToString(dr["Modelo"]),
                            Pintura = Convert.ToString(dr["Pintura"]),
                            Teto = Convert.ToString(dr["Teto"]),
                            Pneus = Convert.ToString(dr["Pneus"]),
                            Pincas = Convert.ToString(dr["Pinca"]),
                            Painel = Convert.ToString(dr["Painel"]),
                            CorInter = Convert.ToString(dr["CorInter"]),
                            Banco = Convert.ToString(dr["Banco"]),
                            Costura = Convert.ToString(dr["Costura"])
                        });
                }
                return pedido;
            }
        }
    }
}
