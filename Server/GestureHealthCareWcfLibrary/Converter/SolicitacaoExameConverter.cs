using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Facdombosco.GestureHealthCareWcfLibrary.DataContract;

namespace Facdombosco.GestureHealthCareWcfLibrary.Converter
{
    public class SolicitacaoExameConverter
    {
        public static SolicitacaoExame Converter(Facdombosco.GestureHealthCare.Dto.SolicitacaoExame solicitacaoExame, bool incluirSolicitacaoExameItem = true)
        {
            SolicitacaoExame solicitacaoExameDataContract = new SolicitacaoExame();
            //solicitacaoExameDataContract.Codigo = solicitacaoExame.Codigo;
            solicitacaoExameDataContract.Data = solicitacaoExame.Data;
            if (incluirSolicitacaoExameItem)
                solicitacaoExameDataContract.SolicitacaoExameItem = SolicitacaoExameItemConverter.Converter(solicitacaoExame.SolicitacaoExameItem);

            return solicitacaoExameDataContract;
        }

        public static IList<SolicitacaoExame> Converter(IList<Facdombosco.GestureHealthCare.Dto.SolicitacaoExame> solicitacaoExame, bool incluirSolicitacaoExameItem = true)
        {
            IList<SolicitacaoExame> solicitacaoExameDataContract = new List<SolicitacaoExame>();

            foreach (Facdombosco.GestureHealthCare.Dto.SolicitacaoExame solicitacaoExameAtual in solicitacaoExame)
                solicitacaoExameDataContract.Add(SolicitacaoExameConverter.Converter(solicitacaoExameAtual));

            return solicitacaoExameDataContract;
        }
    }
}
