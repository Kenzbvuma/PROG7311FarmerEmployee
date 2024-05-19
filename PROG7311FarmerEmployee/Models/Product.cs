using System;
using System.ComponentModel.DataAnnotations;

namespace PROG7311FarmerEmployee.Models
{
    public class Product
    {


        [Key]
        public int ProductId { get; set; }

        [Required]
        [MaxLength(50)]
        public string Name { get; set; }

        [Required]
        [MaxLength(50)]
        public string Category { get; set; }

        [Required]
        public DateTime ProductionDate { get; set; }
    }
}
