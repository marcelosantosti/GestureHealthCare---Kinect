/**
 * This is a generated class and is not intended for modification.  To customize behavior
 * of this service wrapper you may modify the generated sub-class of this class - GestureHealthCareService.as.
 */
package br.com.facdombosco.gesturehealthcare.service.imp
{
import com.adobe.fiber.core.model_internal;
import br.com.facdombosco.gesturehealthcare.model.vo.Atendimento;
import br.com.facdombosco.gesturehealthcare.model.vo.Cirurgia;
import br.com.facdombosco.gesturehealthcare.model.vo.Laudo;
import com.adobe.fiber.services.wrapper.WebServiceWrapper;
import com.adobe.serializers.utility.TypeUtility;
import mx.rpc.AbstractOperation;
import mx.rpc.AsyncToken;
import mx.rpc.soap.mxml.Operation;
import mx.rpc.soap.mxml.WebService;

[ExcludeClass]
internal class _Super_GestureHealthCareService extends com.adobe.fiber.services.wrapper.WebServiceWrapper
{
    
    // Constructor
    public function _Super_GestureHealthCareService()
    {
        // initialize service control
        _serviceControl = new mx.rpc.soap.mxml.WebService();
        var operations:Object = new Object();
        var operation:mx.rpc.soap.mxml.Operation;

        operation = new mx.rpc.soap.mxml.Operation(null, "FindAllLaudo");
         operation.resultElementType = br.com.facdombosco.gesturehealthcare.model.vo.Laudo;
        operations["FindAllLaudo"] = operation;

        operation = new mx.rpc.soap.mxml.Operation(null, "FindAllAtendimentoWithProcedimento");
         operation.resultElementType = br.com.facdombosco.gesturehealthcare.model.vo.Atendimento;
        operations["FindAllAtendimentoWithProcedimento"] = operation;

        operation = new mx.rpc.soap.mxml.Operation(null, "FindAllAtendimentoWithDiagnostico");
         operation.resultElementType = br.com.facdombosco.gesturehealthcare.model.vo.Atendimento;
        operations["FindAllAtendimentoWithDiagnostico"] = operation;

        operation = new mx.rpc.soap.mxml.Operation(null, "FindAllCirurgia");
         operation.resultElementType = br.com.facdombosco.gesturehealthcare.model.vo.Cirurgia;
        operations["FindAllCirurgia"] = operation;

        operation = new mx.rpc.soap.mxml.Operation(null, "FindAllAtendimentoWithExame");
         operation.resultElementType = br.com.facdombosco.gesturehealthcare.model.vo.Atendimento;
        operations["FindAllAtendimentoWithExame"] = operation;

        _serviceControl.operations = operations;
        try
        {
            _serviceControl.convertResultHandler = com.adobe.serializers.utility.TypeUtility.convertResultHandler;
        }
        catch (e: Error)
        { /* Flex 3.4 and earlier does not support the convertResultHandler functionality. */ }


        preInitializeService();
        model_internal::initialize();
    }
    
    //init initialization routine here, child class to override
    protected function preInitializeService():void
    {


        _serviceControl.service = "GestureHealthCareService";
        _serviceControl.port = "BasicHttpBinding_IGestureHealthCareService";
        wsdl = "http://localhost:2985/GestureHealthCareService.svc?wsdl";
        model_internal::loadWSDLIfNecessary();
    }
    

    /**
      * This method is a generated wrapper used to call the 'FindAllLaudo' operation. It returns an mx.rpc.AsyncToken whose 
      * result property will be populated with the result of the operation when the server response is received. 
      * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
      * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an mx.rpc.AsyncToken whose result property will be populated with the result of the operation when the server response is received.
      */
    public function FindAllLaudo(idPaciente:int) : mx.rpc.AsyncToken
    {
        model_internal::loadWSDLIfNecessary();
        var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("FindAllLaudo");
		var _internal_token:mx.rpc.AsyncToken = _internal_operation.send(idPaciente) ;
        return _internal_token;
    }
     
    /**
      * This method is a generated wrapper used to call the 'FindAllAtendimentoWithProcedimento' operation. It returns an mx.rpc.AsyncToken whose 
      * result property will be populated with the result of the operation when the server response is received. 
      * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
      * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an mx.rpc.AsyncToken whose result property will be populated with the result of the operation when the server response is received.
      */
    public function FindAllAtendimentoWithProcedimento(idPaciente:int) : mx.rpc.AsyncToken
    {
        model_internal::loadWSDLIfNecessary();
        var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("FindAllAtendimentoWithProcedimento");
		var _internal_token:mx.rpc.AsyncToken = _internal_operation.send(idPaciente) ;
        return _internal_token;
    }
     
    /**
      * This method is a generated wrapper used to call the 'FindAllAtendimentoWithDiagnostico' operation. It returns an mx.rpc.AsyncToken whose 
      * result property will be populated with the result of the operation when the server response is received. 
      * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
      * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an mx.rpc.AsyncToken whose result property will be populated with the result of the operation when the server response is received.
      */
    public function FindAllAtendimentoWithDiagnostico(idPaciente:int) : mx.rpc.AsyncToken
    {
        model_internal::loadWSDLIfNecessary();
        var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("FindAllAtendimentoWithDiagnostico");
		var _internal_token:mx.rpc.AsyncToken = _internal_operation.send(idPaciente) ;
        return _internal_token;
    }
     
    /**
      * This method is a generated wrapper used to call the 'FindAllCirurgia' operation. It returns an mx.rpc.AsyncToken whose 
      * result property will be populated with the result of the operation when the server response is received. 
      * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
      * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an mx.rpc.AsyncToken whose result property will be populated with the result of the operation when the server response is received.
      */
    public function FindAllCirurgia() : mx.rpc.AsyncToken
    {
        model_internal::loadWSDLIfNecessary();
        var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("FindAllCirurgia");
		var _internal_token:mx.rpc.AsyncToken = _internal_operation.send() ;
        return _internal_token;
    }
     
    /**
      * This method is a generated wrapper used to call the 'FindAllAtendimentoWithExame' operation. It returns an mx.rpc.AsyncToken whose 
      * result property will be populated with the result of the operation when the server response is received. 
      * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
      * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an mx.rpc.AsyncToken whose result property will be populated with the result of the operation when the server response is received.
      */
    public function FindAllAtendimentoWithExame(idPaciente:int) : mx.rpc.AsyncToken
    {
        model_internal::loadWSDLIfNecessary();
        var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("FindAllAtendimentoWithExame");
		var _internal_token:mx.rpc.AsyncToken = _internal_operation.send(idPaciente) ;
        return _internal_token;
    }
     
}

}
