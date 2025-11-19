using System.ComponentModel.DataAnnotations;

namespace Sistema_SpeedZone.Models
{
    public class Modelo
    {
        [Display(Name = "Código", Description = "Código.")]
        public int Id { get; set; }

        [Display(Name = "Marca")]
        [Required(ErrorMessage = "A marca é obrigatória")]
        public string Marca { get; set; }

        [Display(Name = "Ano")]
        [Required(ErrorMessage = "O ano é obrigatório")]
        public string Ano { get; set; }

        [Display(Name = "Nome")]
        [Required(ErrorMessage = "O nome do carro é obrigatório")]
        public string Nome { get; set; }

        [Display(Name = "Categoria Carro")]
        [Required(ErrorMessage = "A categoria do carro é obrigatória")]
        public string CategoriaCarro { get; set; }

        [Display(Name = "Imagem")]
        [Required(ErrorMessage = "A imagem é obrigatória")]
        public string Imagem { get; set; }

        [Display(Name = "Descricao")]
        [EmailAddress(ErrorMessage = "A descrição não é valido")]
        public string Descricao { get; set; }

        [Display(Name = "HP")]
        [Required(ErrorMessage = "O Horse Power é obrigatório")]
        public string HP { get; set; }

        [Display(Name = "Motor")]
        [Required(ErrorMessage = "O motor é obrigatório")]
        public string Motor { get; set; }

        [Display(Name = "Torque")]
        [Required(ErrorMessage = "O torque é obrigatório")]
        public string Torque { get; set; }
    }
}
