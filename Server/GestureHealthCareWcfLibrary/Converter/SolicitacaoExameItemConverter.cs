using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Facdombosco.GestureHealthCareWcfLibrary.DataContract;

namespace Facdombosco.GestureHealthCareWcfLibrary.Converter
{
    public class SolicitacaoExameItemConverter
    {
        public static SolicitacaoExameItem Converter(Facdombosco.GestureHealthCare.Dto.SolicitacaoExameItem solicitacaoExameItem)
        {
            SolicitacaoExameItem solicitacaoExameDataContract = new SolicitacaoExameItem();
            //solicitacaoExameDataContract.Codigo = solicitacaoExameItem.Codigo;
            solicitacaoExameDataContract.Exame = ExameConverter.Converter(solicitacaoExameItem.Exame);
            //solicitacaoExameDataContract.Laudo = solicitacaoExameItem.Laudo;
            solicitacaoExameDataContract.QuantidadeRealizada = solicitacaoExameItem.QuantidadeRealizada;
            solicitacaoExameDataContract.QuantidadeSolicitada = solicitacaoExameItem.QuantidadeSolicitada;
            //solicitacaoExameDataContract.SolicitacaoExame = solicitacaoExameItem.SolicitacaoExame;

            return solicitacaoExameDataContract;
        }

        public static IList<SolicitacaoExameItem> Converter(IList<Facdombosco.GestureHealthCare.Dto.SolicitacaoExameItem> solicitacaoExameItem)
        {
            IList<SolicitacaoExameItem> solicitacaoExameItemDataContract = new List<SolicitacaoExameItem>();

            foreach (Facdombosco.GestureHealthCare.Dto.SolicitacaoExameItem solicitacaoExameItemAtual in solicitacaoExameItem)
                solicitacaoExameItemDataContract.Add(SolicitacaoExameItemConverter.Converter(solicitacaoExameItemAtual));

            return solicitacaoExameItemDataContract;
        }
    }
}
