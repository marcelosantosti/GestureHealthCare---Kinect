using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using Facdombosco.GestureHealthCareWcfLibrary.DataContract;
using Facdombosco.GestureHealthCare.Service;
using AutoMapper;
using Facdombosco.GestureHealthCareWcfLibrary.Converter;

namespace Facdombosco.GestureHealthCareWcfLibrary
{
    public class GestureHealthCareService : IGestureHealthCareService
    {
        public IList<Cirurgia> FindAllCirurgia()
        {
            return CirurgiaConverter.Converter(CirurgiaService.FindAllWithAtendimento());
        }

        public IList<Atendimento> FindAllAtendimentoWithExame(int? idPaciente)
        {
            return AtendimentoConverter.Converter(AtendimentoService.FindAllAtendimentoWithExame(idPaciente), true, false, false, false);
        }

        public IList<Atendimento> FindAllAtendimentoWithProcedimento(int? idPaciente)
        {
            return AtendimentoConverter.Converter(AtendimentoService.FindAllAtendimentoWithProcedimento(idPaciente), false, true, false, false);
        }

        public IList<Atendimento> FindAllAtendimentoWithDiagnostico(int? idPaciente)
        {
            return AtendimentoConverter.Converter(AtendimentoService.FindAllAtendimentoWithDiagnostico(idPaciente), false, false, true, false);
        }

        public IList<Laudo> FindAllLaudo(int? idPaciente)
        {
            return LaudoConverter.Converter(LaudoService.FindAllLaudo(idPaciente));
        }
    }
}
