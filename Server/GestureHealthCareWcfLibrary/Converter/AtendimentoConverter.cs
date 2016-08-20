using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Facdombosco.GestureHealthCareWcfLibrary.DataContract;

namespace Facdombosco.GestureHealthCareWcfLibrary.Converter
{
    public class AtendimentoConverter
    {
        public static Atendimento Converter(Facdombosco.GestureHealthCare.Dto.Atendimento atendimento, bool incluirSolicitacaoExame, bool incluirSolicitacaoProcedimento, bool incluirDiagnostico, bool incluirPaciente)
        {
            Atendimento atendimentoDataContract = new Atendimento();
            atendimentoDataContract.Codigo = atendimento.Codigo;
            atendimentoDataContract.Data = atendimento.Data;

            if (incluirDiagnostico)
                atendimentoDataContract.Diagnostico = DiagnosticoConverter.Converter(atendimento.Diagnostico);

            if (incluirSolicitacaoExame)
                atendimentoDataContract.SolicitacaoExame = SolicitacaoExameConverter.Converter(atendimento.SolicitacaoExame);

            if (incluirSolicitacaoProcedimento)
                atendimentoDataContract.SolicitacaoProcedimento = SolicitacaoProcedimentoConverter.Converter(atendimento.SolicitacaoProcedimento);
            
            atendimentoDataContract.Tipo = atendimento.Tipo;

            if (incluirPaciente)
                atendimentoDataContract.Paciente = PacienteConverter.Converter(atendimento.Paciente);

            return atendimentoDataContract;
        }

        public static IList<Atendimento> Converter(IList<Facdombosco.GestureHealthCare.Dto.Atendimento> atendimento, bool incluirSolicitacaoExame, bool incluirSolicitacaoProcedimento, bool incluirDiagnostico, bool incluirPaciente)
        {
            IList<Atendimento> atendimentoDataContract = new List<Atendimento>();

            foreach (Facdombosco.GestureHealthCare.Dto.Atendimento atendimentoAtual in atendimento)
                atendimentoDataContract.Add(AtendimentoConverter.Converter(atendimentoAtual, incluirSolicitacaoExame, incluirSolicitacaoProcedimento, incluirDiagnostico, incluirPaciente));

            return atendimentoDataContract;
        }
    }
}
