using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using Facdombosco.GestureHealthCareWcfLibrary.DataContract;

namespace Facdombosco.GestureHealthCareWcfLibrary
{
    [ServiceContract]
    public interface IGestureHealthCareService
    {
        [OperationContract]
        IList<Cirurgia> FindAllCirurgia();

        [OperationContract]
        IList<Atendimento> FindAllAtendimentoWithExame(int? idPaciente);

        [OperationContract]
        IList<Atendimento> FindAllAtendimentoWithProcedimento(int? idPaciente);

        [OperationContract]
        IList<Atendimento> FindAllAtendimentoWithDiagnostico(int? idPaciente);

        [OperationContract]
        IList<Laudo> FindAllLaudo(int? idPaciente);
    }
}
