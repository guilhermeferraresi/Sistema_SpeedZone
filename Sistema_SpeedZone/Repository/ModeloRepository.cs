using Sistema_SpeedZone.Models;
using Sistema_SpeedZone.Repository.Contract;
using Newtonsoft.Json;
using MySql.Data.MySqlClient;
using System.Data;

namespace Sistema_SpeedZone.Repository
{
        public class ModeloRepository : IModeloRepository
        {
            private readonly string _conexaoMySQL;
            public ModeloRepository(IConfiguration conf)
            {
                _conexaoMySQL = conf.GetConnectionString("ConexaoMySQL");
            }
        private const string PinturaSessionKey = "Pintura";

        public IEnumerable<Pintura> ObterTodasPinturas()
        {
            List<Pintura> pinturas = new List<Pintura>();
            using (var conexao = new MySqlConnection(_conexaoMySQL))
            {
                conexao.Open();

                MySqlCommand cmd = new MySqlCommand("select * from tbPintura", conexao);

                MySqlDataAdapter da = new MySqlDataAdapter(cmd);

                DataTable dt = new DataTable();

                da.Fill(dt);
                conexao.Close();

                foreach (DataRow dr in dt.Rows)
                {
                    pinturas.Add(
                        new Pintura
                        {
                            IdPintura = Convert.ToInt32(dr["IdCor"]),
                            Tipo = Convert.ToString(dr["TipoCor"]),
                            Codigo = Convert.ToString(dr["CodigoCor"])
                        });
                }
                return pinturas;
            }
        }

        public List<Pintura> Pinturas(ISession session)
            {
                var cartJson = session.GetString(PinturaSessionKey);
                return cartJson == null ? new List<Pintura>() : JsonConvert.DeserializeObject<List<Pintura>>(cartJson);
            }
        }
}
