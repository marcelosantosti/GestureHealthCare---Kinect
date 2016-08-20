using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Facdombosco.GestureHealthCare.Dto;

namespace Facdombosco.GestureHealthCare
{
    public class Tipos
    {
        public static IList<Type> RetornarTipos()
        {
            List<Type> tipos = new List<Type>();
            tipos.Add(typeof(Atendimento));
            tipos.Add(typeof(Cirurgia));
            tipos.Add(typeof(Diagnostico));
            tipos.Add(typeof(Exame));
            tipos.Add(typeof(Laudo));
            tipos.Add(typeof(Medico));
            tipos.Add(typeof(Paciente));
            tipos.Add(typeof(Procedimento));
            tipos.Add(typeof(Sala));
            tipos.Add(typeof(SolicitacaoExame));
            tipos.Add(typeof(SolicitacaoExameItem));
            tipos.Add(typeof(SolicitacaoProcedimento));
            tipos.Add(typeof(SolicitacaoProcedimentoItem));

            return tipos;
        }
    }
}
