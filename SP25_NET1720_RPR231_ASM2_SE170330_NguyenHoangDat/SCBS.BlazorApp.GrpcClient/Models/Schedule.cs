﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SCBS.BlazorApp.GrpcClient.Models;

[Table("Schedule")]
public partial class Schedule
{
    [Key]
    [Column("ID")]
    public Guid Id { get; set; }

    [Column("UserID")]
    public Guid UserId { get; set; }

    [Column(TypeName = "datetime")]
    public DateTime WorkDate { get; set; }

    [Required]
    [StringLength(50)]
    public string Status { get; set; }

    [Column(TypeName = "datetime")]
    public DateTime? CreatedAt { get; set; }

    [Column(TypeName = "datetime")]
    public DateTime? UpdatedAt { get; set; }

    [StringLength(255)]
    public string Title { get; set; }

    [Column(TypeName = "text")]
    public string Description { get; set; }

    [StringLength(255)]
    public string Location { get; set; }

    [Column(TypeName = "text")]
    public string Notes { get; set; }

    [ForeignKey("UserId")]
    [InverseProperty("Schedules")]
    public virtual User User { get; set; }
}