using System.ComponentModel.DataAnnotations;

namespace Sistema_SpeedZone.Models
{
    public class Pedido
    {
        public int IdPedido { get; set; }
        public string Modelo { get; set; }
        public string Pintura { get; set; }
        public string Teto { get; set; }
        public string Pneus { get; set; }
        public string Pincas { get; set; }
        public string Painel { get; set; }
        public string CorInter { get; set; }
        public string Banco { get; set; }
        public string Costura { get; set; }
    }
}
