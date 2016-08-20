using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Facdombosco.GestureHealthCareWcfLibrary.DataContract;

namespace Facdombosco.GestureHealthCareWcfLibrary.Converter
{
    public class SolicitacaoProcedimentoItemConverter
    {
        public static SolicitacaoProcedimentoItem Converter(Facdombosco.GestureHealthCare.Dto.SolicitacaoProcedimentoItem solicitacaoProcedimentoItem)
        {
            SolicitacaoProcedimentoItem solicitacaoProcedimentoItemDataContract = new SolicitacaoProcedimentoItem();
            solicitacaoProcedimentoItemDataContract.Procedimento = ProcedimentoConverter.Converter(solicitacaoProcedimentoItem.Procedimento);

            return solicitacaoProcedimentoItemDataContract;
        }

        public static IList<SolicitacaoProcedimentoItem> Converter(IList<Facdombosco.GestureHealthCare.Dto.SolicitacaoProcedimentoItem> solicitacaoProcedimentoItem)
        {
            IList<SolicitacaoProcedimentoItem> solicitacaoProcedimentoItemDataContract = new List<SolicitacaoProcedimentoItem>();
            
            foreach (Facdombosco.GestureHealthCare.Dto.SolicitacaoProcedimentoItem solicitacaoProcedimentoItemAtual in solicitacaoProcedimentoItem)
                solicitacaoProcedimentoItemDataContract.Add(SolicitacaoProcedimentoItemConverter.Converter(solicitacaoProcedimentoItemAtual));

            return solicitacaoProcedimentoItemDataContract;
        }
    }
}
