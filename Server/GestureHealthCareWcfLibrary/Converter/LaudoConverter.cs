using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Facdombosco.GestureHealthCareWcfLibrary.DataContract;

namespace Facdombosco.GestureHealthCareWcfLibrary.Converter
{
    public class LaudoConverter
    {
        public static Laudo Converter(Facdombosco.GestureHealthCare.Dto.Laudo laudo)
        {
            Laudo laudoDataContract = new Laudo();
            laudoDataContract.Arquivo = laudo.Arquivo;
            laudoDataContract.SolicitacaoExameItem = SolicitacaoExameItemConverter.Converter(laudo.SolicitacaoExameItem);
            laudoDataContract.SolicitacaoExameItem.SolicitacaoExame = SolicitacaoExameConverter.Converter(laudo.SolicitacaoExameItem.SolicitacaoExame, false);
            laudoDataContract.SolicitacaoExameItem.SolicitacaoExame.Atendimento = AtendimentoConverter.Converter(laudo.SolicitacaoExameItem.SolicitacaoExame.Atendimento, false, false, false, false);

            return laudoDataContract;
        }

        public static IList<Laudo> Converter(IList<Facdombosco.GestureHealthCare.Dto.Laudo> laudo)
        {
            IList<Laudo> laudoDataContract = new List<Laudo>();

            foreach (Facdombosco.GestureHealthCare.Dto.Laudo laudoAtual in laudo)
                laudoDataContract.Add(LaudoConverter.Converter(laudoAtual));

            return laudoDataContract;
        }
    }
}
