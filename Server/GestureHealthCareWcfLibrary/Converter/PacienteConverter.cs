using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Facdombosco.GestureHealthCareWcfLibrary.DataContract;
using Facdombosco.GestureHealthCareUtils;

namespace Facdombosco.GestureHealthCareWcfLibrary.Converter
{
    public class PacienteConverter
    {
        public static Paciente Converter(Facdombosco.GestureHealthCare.Dto.Paciente paciente)
        {
            Paciente pacienteDataContract = new Paciente();
            pacienteDataContract.Codigo = paciente.Codigo;
            pacienteDataContract.DataNascimento = paciente.DataNascimento;
            pacienteDataContract.Foto = paciente.Foto;
            pacienteDataContract.IdadeAtual = DateUtil.RetornarIdade(paciente.DataNascimento);
            pacienteDataContract.Nome = paciente.Nome;
            pacienteDataContract.Sexo = paciente.Sexo;

            return pacienteDataContract;
        }
    }
}
