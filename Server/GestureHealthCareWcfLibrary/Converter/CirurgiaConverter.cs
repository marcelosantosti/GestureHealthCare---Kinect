using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Facdombosco.GestureHealthCareWcfLibrary.DataContract;

namespace Facdombosco.GestureHealthCareWcfLibrary.Converter
{
    public class CirurgiaConverter
    {
        public static Cirurgia Converter(Facdombosco.GestureHealthCare.Dto.Cirurgia cirurgia)
        {
            Cirurgia cirurgiaDataContract = new Cirurgia();
            cirurgiaDataContract.Atendimento = AtendimentoConverter.Converter(cirurgia.Atendimento, false, false, false, true);
            cirurgiaDataContract.Codigo = cirurgia.Codigo;
            cirurgiaDataContract.DataAgendamento = cirurgia.DataAgendamento;
            cirurgiaDataContract.DataFim = cirurgia.DataFim;
            cirurgiaDataContract.DataInicio = cirurgia.DataInicio;
            cirurgiaDataContract.Lado = cirurgia.Lado;
            cirurgiaDataContract.Medico = MedicoConverter.Converter(cirurgia.Medico);
            cirurgiaDataContract.Membro = cirurgia.Membro;
            cirurgiaDataContract.Procedimento = ProcedimentoConverter.Converter(cirurgia.Procedimento);
            cirurgiaDataContract.Sala = SalaConverter.Converter(cirurgia.Sala);

            return cirurgiaDataContract;
        }

        public static IList<Cirurgia> Converter(IList<Facdombosco.GestureHealthCare.Dto.Cirurgia> cirurgia)
        {
            IList<Cirurgia> cirurgiaDataContract = new List<Cirurgia>();

            foreach (Facdombosco.GestureHealthCare.Dto.Cirurgia cirurgiaAtual in cirurgia)
                cirurgiaDataContract.Add(CirurgiaConverter.Converter(cirurgiaAtual));

            return cirurgiaDataContract;
        }
    }
}
