﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SCBS.GraphQLClient.Models;

public partial class User
{
    public Guid Id { get; set; }

    public string Username { get; set; }

    public string FullName { get; set; }

    public string Password { get; set; }

    public string Email { get; set; }

    public string Avatar { get; set; }

    public string Phone { get; set; }

    public string Gender { get; set; }

    public string Role { get; set; }

    public string Status { get; set; }

    public double? Rating { get; set; }

    public DateTime? CreatedAt { get; set; }

    public DateTime? UpdatedAt { get; set; }

    public virtual ICollection<Schedule> Schedules { get; set; } = new List<Schedule>();
}