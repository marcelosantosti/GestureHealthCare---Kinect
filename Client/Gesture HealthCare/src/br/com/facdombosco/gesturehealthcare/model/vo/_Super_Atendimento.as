/**
 * This is a generated class and is not intended for modification.  To customize behavior
 * of this value object you may modify the generated sub-class of this class - Atendimento.as.
 */

package br.com.facdombosco.gesturehealthcare.model.vo
{
import br.com.facdombosco.gesturehealthcare.model.vo.Cirurgia;
import br.com.facdombosco.gesturehealthcare.model.vo.Diagnostico;
import br.com.facdombosco.gesturehealthcare.model.vo.Paciente;
import br.com.facdombosco.gesturehealthcare.model.vo.SolicitacaoExame;
import br.com.facdombosco.gesturehealthcare.model.vo.SolicitacaoProcedimento;
import com.adobe.fiber.services.IFiberManagingService;
import com.adobe.fiber.valueobjects.IValueObject;
import flash.events.EventDispatcher;
import mx.collections.ArrayCollection;
import mx.events.PropertyChangeEvent;

import flash.net.registerClassAlias;
import flash.net.getClassByAlias;
import com.adobe.fiber.core.model_internal;
import com.adobe.fiber.valueobjects.IPropertyIterator;
import com.adobe.fiber.valueobjects.AvailablePropertyIterator;

use namespace model_internal;

[ExcludeClass]
public class _Super_Atendimento extends flash.events.EventDispatcher implements com.adobe.fiber.valueobjects.IValueObject
{
    model_internal static function initRemoteClassAliasSingle(cz:Class) : void
    {
    }

    model_internal static function initRemoteClassAliasAllRelated() : void
    {
        br.com.facdombosco.gesturehealthcare.model.vo.Cirurgia.initRemoteClassAliasSingleChild();
        br.com.facdombosco.gesturehealthcare.model.vo.Paciente.initRemoteClassAliasSingleChild();
        br.com.facdombosco.gesturehealthcare.model.vo.Atendimento.initRemoteClassAliasSingleChild();
        br.com.facdombosco.gesturehealthcare.model.vo.Medico.initRemoteClassAliasSingleChild();
        br.com.facdombosco.gesturehealthcare.model.vo.Procedimento.initRemoteClassAliasSingleChild();
        br.com.facdombosco.gesturehealthcare.model.vo.Sala.initRemoteClassAliasSingleChild();
        br.com.facdombosco.gesturehealthcare.model.vo.Diagnostico.initRemoteClassAliasSingleChild();
        br.com.facdombosco.gesturehealthcare.model.vo.SolicitacaoExame.initRemoteClassAliasSingleChild();
        br.com.facdombosco.gesturehealthcare.model.vo.SolicitacaoProcedimento.initRemoteClassAliasSingleChild();
        br.com.facdombosco.gesturehealthcare.model.vo.SolicitacaoProcedimentoItem.initRemoteClassAliasSingleChild();
    }

    model_internal var _dminternal_model : _AtendimentoEntityMetadata;
    model_internal var _changedObjects:mx.collections.ArrayCollection = new ArrayCollection();

    public function getChangedObjects() : Array
    {
        _changedObjects.addItemAt(this,0);
        return _changedObjects.source;
    }

    public function clearChangedObjects() : void
    {
        _changedObjects.removeAll();
    }

    /**
     * properties
     */
    private var _internal_Cirurgia : ArrayCollection;
    model_internal var _internal_Cirurgia_leaf:br.com.facdombosco.gesturehealthcare.model.vo.Cirurgia;
    private var _internal_Codigo : int;
    private var _internal_Data : Date;
    private var _internal__Diagnostico : br.com.facdombosco.gesturehealthcare.model.vo.Diagnostico;
    private var _internal__Paciente : br.com.facdombosco.gesturehealthcare.model.vo.Paciente;
    private var _internal_SolicitacaoExame : ArrayCollection;
    model_internal var _internal_SolicitacaoExame_leaf:br.com.facdombosco.gesturehealthcare.model.vo.SolicitacaoExame;
    private var _internal_SolicitacaoProcedimento : ArrayCollection;
    model_internal var _internal_SolicitacaoProcedimento_leaf:br.com.facdombosco.gesturehealthcare.model.vo.SolicitacaoProcedimento;
    private var _internal_Tipo : String;

    private static var emptyArray:Array = new Array();


    /**
     * derived property cache initialization
     */
    model_internal var _cacheInitialized_isValid:Boolean = false;

    model_internal var _changeWatcherArray:Array = new Array();

    public function _Super_Atendimento()
    {
        _model = new _AtendimentoEntityMetadata(this);

        // Bind to own data or source properties for cache invalidation triggering

    }

    /**
     * data/source property getters
     */

    [Bindable(event="propertyChange")]
    public function get Cirurgia() : ArrayCollection
    {
        return _internal_Cirurgia;
    }

    [Bindable(event="propertyChange")]
    public function get Codigo() : int
    {
        return _internal_Codigo;
    }

    [Bindable(event="propertyChange")]
    public function get Data() : Date
    {
        return _internal_Data;
    }

    [Bindable(event="propertyChange")]
    public function get _Diagnostico() : br.com.facdombosco.gesturehealthcare.model.vo.Diagnostico
    {
        return _internal__Diagnostico;
    }

    [Bindable(event="propertyChange")]
    public function get _Paciente() : br.com.facdombosco.gesturehealthcare.model.vo.Paciente
    {
        return _internal__Paciente;
    }

    [Bindable(event="propertyChange")]
    public function get SolicitacaoExame() : ArrayCollection
    {
        return _internal_SolicitacaoExame;
    }

    [Bindable(event="propertyChange")]
    public function get SolicitacaoProcedimento() : ArrayCollection
    {
        return _internal_SolicitacaoProcedimento;
    }

    [Bindable(event="propertyChange")]
    public function get Tipo() : String
    {
        return _internal_Tipo;
    }

    public function clearAssociations() : void
    {
    }

    /**
     * data/source property setters
     */

    public function set Cirurgia(value:*) : void
    {
        var oldValue:ArrayCollection = _internal_Cirurgia;
        if (oldValue !== value)
        {
            if (value is ArrayCollection)
            {
                _internal_Cirurgia = value;
            }
            else if (value is Array)
            {
                _internal_Cirurgia = new ArrayCollection(value);
            }
            else if (value == null)
            {
                _internal_Cirurgia = null;
            }
            else
            {
                throw new Error("value of Cirurgia must be a collection");
            }
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "Cirurgia", oldValue, _internal_Cirurgia));
        }
    }

    public function set Codigo(value:int) : void
    {
        var oldValue:int = _internal_Codigo;
        if (oldValue !== value)
        {
            _internal_Codigo = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "Codigo", oldValue, _internal_Codigo));
        }
    }

    public function set Data(value:Date) : void
    {
        var oldValue:Date = _internal_Data;
        if (oldValue !== value)
        {
            _internal_Data = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "Data", oldValue, _internal_Data));
        }
    }

    public function set _Diagnostico(value:br.com.facdombosco.gesturehealthcare.model.vo.Diagnostico) : void
    {
        var oldValue:br.com.facdombosco.gesturehealthcare.model.vo.Diagnostico = _internal__Diagnostico;
        if (oldValue !== value)
        {
            _internal__Diagnostico = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "_Diagnostico", oldValue, _internal__Diagnostico));
        }
    }

    public function set _Paciente(value:br.com.facdombosco.gesturehealthcare.model.vo.Paciente) : void
    {
        var oldValue:br.com.facdombosco.gesturehealthcare.model.vo.Paciente = _internal__Paciente;
        if (oldValue !== value)
        {
            _internal__Paciente = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "_Paciente", oldValue, _internal__Paciente));
        }
    }

    public function set SolicitacaoExame(value:*) : void
    {
        var oldValue:ArrayCollection = _internal_SolicitacaoExame;
        if (oldValue !== value)
        {
            if (value is ArrayCollection)
            {
                _internal_SolicitacaoExame = value;
            }
            else if (value is Array)
            {
                _internal_SolicitacaoExame = new ArrayCollection(value);
            }
            else if (value == null)
            {
                _internal_SolicitacaoExame = null;
            }
            else
            {
                throw new Error("value of SolicitacaoExame must be a collection");
            }
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "SolicitacaoExame", oldValue, _internal_SolicitacaoExame));
        }
    }

    public function set SolicitacaoProcedimento(value:*) : void
    {
        var oldValue:ArrayCollection = _internal_SolicitacaoProcedimento;
        if (oldValue !== value)
        {
            if (value is ArrayCollection)
            {
                _internal_SolicitacaoProcedimento = value;
            }
            else if (value is Array)
            {
                _internal_SolicitacaoProcedimento = new ArrayCollection(value);
            }
            else if (value == null)
            {
                _internal_SolicitacaoProcedimento = null;
            }
            else
            {
                throw new Error("value of SolicitacaoProcedimento must be a collection");
            }
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "SolicitacaoProcedimento", oldValue, _internal_SolicitacaoProcedimento));
        }
    }

    public function set Tipo(value:String) : void
    {
        var oldValue:String = _internal_Tipo;
        if (oldValue !== value)
        {
            _internal_Tipo = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "Tipo", oldValue, _internal_Tipo));
        }
    }

    /**
     * Data/source property setter listeners
     *
     * Each data property whose value affects other properties or the validity of the entity
     * needs to invalidate all previously calculated artifacts. These include:
     *  - any derived properties or constraints that reference the given data property.
     *  - any availability guards (variant expressions) that reference the given data property.
     *  - any style validations, message tokens or guards that reference the given data property.
     *  - the validity of the property (and the containing entity) if the given data property has a length restriction.
     *  - the validity of the property (and the containing entity) if the given data property is required.
     */


    /**
     * valid related derived properties
     */
    model_internal var _isValid : Boolean;
    model_internal var _invalidConstraints:Array = new Array();
    model_internal var _validationFailureMessages:Array = new Array();

    /**
     * derived property calculators
     */

    /**
     * isValid calculator
     */
    model_internal function calculateIsValid():Boolean
    {
        var violatedConsts:Array = new Array();
        var validationFailureMessages:Array = new Array();

        var propertyValidity:Boolean = true;

        model_internal::_cacheInitialized_isValid = true;
        model_internal::invalidConstraints_der = violatedConsts;
        model_internal::validationFailureMessages_der = validationFailureMessages;
        return violatedConsts.length == 0 && propertyValidity;
    }

    /**
     * derived property setters
     */

    model_internal function set isValid_der(value:Boolean) : void
    {
        var oldValue:Boolean = model_internal::_isValid;
        if (oldValue !== value)
        {
            model_internal::_isValid = value;
            _model.model_internal::fireChangeEvent("isValid", oldValue, model_internal::_isValid);
        }
    }

    /**
     * derived property getters
     */

    [Transient]
    [Bindable(event="propertyChange")]
    public function get _model() : _AtendimentoEntityMetadata
    {
        return model_internal::_dminternal_model;
    }

    public function set _model(value : _AtendimentoEntityMetadata) : void
    {
        var oldValue : _AtendimentoEntityMetadata = model_internal::_dminternal_model;
        if (oldValue !== value)
        {
            model_internal::_dminternal_model = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "_model", oldValue, model_internal::_dminternal_model));
        }
    }

    /**
     * methods
     */


    /**
     *  services
     */
    private var _managingService:com.adobe.fiber.services.IFiberManagingService;

    public function set managingService(managingService:com.adobe.fiber.services.IFiberManagingService):void
    {
        _managingService = managingService;
    }

    model_internal function set invalidConstraints_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_invalidConstraints;
        // avoid firing the event when old and new value are different empty arrays
        if (oldValue !== value && (oldValue.length > 0 || value.length > 0))
        {
            model_internal::_invalidConstraints = value;
            _model.model_internal::fireChangeEvent("invalidConstraints", oldValue, model_internal::_invalidConstraints);
        }
    }

    model_internal function set validationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_validationFailureMessages;
        // avoid firing the event when old and new value are different empty arrays
        if (oldValue !== value && (oldValue.length > 0 || value.length > 0))
        {
            model_internal::_validationFailureMessages = value;
            _model.model_internal::fireChangeEvent("validationFailureMessages", oldValue, model_internal::_validationFailureMessages);
        }
    }


}

}
