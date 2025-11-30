using System.ComponentModel.DataAnnotations;

namespace Sistema_SpeedZone.Models
{
    public class Usuario
    {
        [Display(Name = "Código", Description = "Código.")]
        public int Id { get; set; }

        [Display(Name = "Nome completo", Description = "Nome e Sobrenome.")]
        [Required(ErrorMessage = "O nome completo é obrigatório.")]
        public string Nome { get; set; }

        [Display(Name = "Nascimento")]
        [Required(ErrorMessage = "A data é obrigatória")]
        public DateTime Nascimento { get; set; }

        [Display(Name = "CPF")]
        [Required(ErrorMessage = "O CPF é obrigatório")]
        public string CPF { get; set; }

        [Display(Name = "RG")]
        [Required(ErrorMessage = "O RG é obrigatório")]
        public string RG { get; set; }

        [Display(Name = "Celular")]
        [Required(ErrorMessage = "O Celular é obrigatório")]
        public string Telefone { get; set; }

        [Display(Name = "Email")]
        [EmailAddress(ErrorMessage = " O Email não é valido")]
        [RegularExpression(".+\\@.+\\..+", ErrorMessage = "Informe um e-mail válido...")]
        public string Email { get; set; }

        [Display(Name = "Senha")]
        [DataType(DataType.Password)]
        [Required(ErrorMessage = "O campo senha é obrigatório")]
        [StringLength(10, MinimumLength = 6, ErrorMessage = "A senha deve ter entre 6 e 10 caracteres")]
        public string Senha { get; set; }

        [Display(Name = "CEP")]
        [Required(ErrorMessage = "O CEP é obrigatório")]
        public string CEP { get; set; }
        [Display(Name = "Complemento")]
        [Required(ErrorMessage = "O complemento do endereço é obrigatório")]
        public string Complemento { get; set; }

        [Display(Name = "Numero")]
        [Required(ErrorMessage = "O numero do endereço é obrigatório")]
        public int Numero { get; set; }

    }
}
