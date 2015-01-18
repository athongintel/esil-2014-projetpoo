﻿using GestionaireLocation.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;

namespace GestionaireLocation.Class
{
    public class CustomMembershipUser : MembershipUser
    {
        public Utilisateur User { get; set; }
        public String UserName { get; set; }
        public String RoleName { get; set; }
        
        public CustomMembershipUser(Utilisateur user) : base()
        {
            User = user;
            UserName = user.nom;
            if (user.Locataire != null)
                RoleName = CustomRoleProvider.LOCATAIRE;
            else if (user.Bailleur != null)
                RoleName = CustomRoleProvider.BAILLEUR;
        }

    }
}
