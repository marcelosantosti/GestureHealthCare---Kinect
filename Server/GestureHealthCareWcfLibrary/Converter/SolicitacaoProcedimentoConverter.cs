using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Facdombosco.GestureHealthCareWcfLibrary.DataContract;

namespace Facdombosco.GestureHealthCareWcfLibrary.Converter
{
    public class SolicitacaoProcedimentoConverter
    {
        public static SolicitacaoProcedimento Converter(Facdombosco.GestureHealthCare.Dto.SolicitacaoProcedimento solicitacaoProcedimento)
        {
            SolicitacaoProcedimento solicitacaoProcedimentoDataContract = new SolicitacaoProcedimento();
            //solicitacaoProcedimentoDataContract.Codigo = solicitacaoProcedimento.Codigo;
            solicitacaoProcedimentoDataContract.Data = solicitacaoProcedimento.Data;
            //solicitacaoProcedimentoDataContract.Medico = MedicoConverter.Converter(solicitacaoProcedimento.Medico);
            solicitacaoProcedimentoDataContract.SolicitacaoProcedimentoItem = SolicitacaoProcedimentoItemConverter.Converter(solicitacaoProcedimento.SolicitacaoProcedimentoItem);

            return solicitacaoProcedimentoDataContract;
        }

        public static IList<SolicitacaoProcedimento> Converter(IList<Facdombosco.GestureHealthCare.Dto.SolicitacaoProcedimento> solicitacaoProcedimento)
        {
            IList<SolicitacaoProcedimento> solicitacaoProcedimentoDataContract = new List<SolicitacaoProcedimento>();

            foreach (Facdombosco.GestureHealthCare.Dto.SolicitacaoProcedimento solicitacaoProcedimentoAtual in solicitacaoProcedimento)
                solicitacaoProcedimentoDataContract.Add(SolicitacaoProcedimentoConverter.Converter(solicitacaoProcedimentoAtual));

            return solicitacaoProcedimentoDataContract;
        }
    }
}
