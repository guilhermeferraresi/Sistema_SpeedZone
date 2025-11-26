using System.ComponentModel.DataAnnotations;


namespace Sistema_SpeedZone.Models
{
    public class Cartao
    {
        [Display(Name = "Código", Description = "Código.")]
        public int IdCartao { get; set; }

        [Display(Name = "Nome completo", Description = "Nome e Sobrenome.")]
        [Required(ErrorMessage = "O nome completo é obrigatório.")]
        public string Nome { get; set; }

        [Display(Name = "Número do cartão", Description = "Número do cartão")]
        [Required(ErrorMessage = "O numero do cartão é obrigatório.")]
        public string NumeroCartao { get; set; }

        [Display(Name = "Bandeira", Description = "Bandeira")]
        [Required(ErrorMessage = "A Bandeira é obrigatório.")]
        public string Bandeira { get; set; }

        [Display(Name = "Validade", Description = "Validade")]
        [Required(ErrorMessage = "A validade do cartão é obrigatório.")]
        public string Validade { get; set; }

        [Display(Name = "CVV", Description = "CVV.")]
        public int CVV { get; set; }
    }
}
