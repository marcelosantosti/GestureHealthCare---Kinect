/**
 * This is a generated class and is not intended for modification.  To customize behavior
 * of this value object you may modify the generated sub-class of this class - SolicitacaoProcedimento.as.
 */

package br.com.facdombosco.gesturehealthcare.model.vo
{
import br.com.facdombosco.gesturehealthcare.model.vo.Atendimento;
import br.com.facdombosco.gesturehealthcare.model.vo.Medico;
import br.com.facdombosco.gesturehealthcare.model.vo.Procedimento;
import br.com.facdombosco.gesturehealthcare.model.vo.SolicitacaoProcedimentoItem;
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
public class _Super_SolicitacaoProcedimento extends flash.events.EventDispatcher implements com.adobe.fiber.valueobjects.IValueObject
{
    model_internal static function initRemoteClassAliasSingle(cz:Class) : void
    {
    }

    model_internal static function initRemoteClassAliasAllRelated() : void
    {
        br.com.facdombosco.gesturehealthcare.model.vo.Procedimento.initRemoteClassAliasSingleChild();
        br.com.facdombosco.gesturehealthcare.model.vo.Atendimento.initRemoteClassAliasSingleChild();
        br.com.facdombosco.gesturehealthcare.model.vo.Medico.initRemoteClassAliasSingleChild();
        br.com.facdombosco.gesturehealthcare.model.vo.SolicitacaoProcedimentoItem.initRemoteClassAliasSingleChild();
        br.com.facdombosco.gesturehealthcare.model.vo.SolicitacaoProcedimento.initRemoteClassAliasSingleChild();
    }

    model_internal var _dminternal_model : _SolicitacaoProcedimentoEntityMetadata;
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
    private var _internal__Procedimento : br.com.facdombosco.gesturehealthcare.model.vo.Procedimento;
    private var _internal__Atendimento : br.com.facdombosco.gesturehealthcare.model.vo.Atendimento;
    private var _internal_Codigo : int;
    private var _internal_Data : Date;
    private var _internal__Medico : br.com.facdombosco.gesturehealthcare.model.vo.Medico;
    private var _internal_SolicitacaoProcedimentoItem : ArrayCollection;
    model_internal var _internal_SolicitacaoProcedimentoItem_leaf:br.com.facdombosco.gesturehealthcare.model.vo.SolicitacaoProcedimentoItem;

    private static var emptyArray:Array = new Array();


    /**
     * derived property cache initialization
     */
    model_internal var _cacheInitialized_isValid:Boolean = false;

    model_internal var _changeWatcherArray:Array = new Array();

    public function _Super_SolicitacaoProcedimento()
    {
        _model = new _SolicitacaoProcedimentoEntityMetadata(this);

        // Bind to own data or source properties for cache invalidation triggering

    }

    /**
     * data/source property getters
     */

    [Bindable(event="propertyChange")]
    public function get _Procedimento() : br.com.facdombosco.gesturehealthcare.model.vo.Procedimento
    {
        return _internal__Procedimento;
    }

    [Bindable(event="propertyChange")]
    public function get _Atendimento() : br.com.facdombosco.gesturehealthcare.model.vo.Atendimento
    {
        return _internal__Atendimento;
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
    public function get _Medico() : br.com.facdombosco.gesturehealthcare.model.vo.Medico
    {
        return _internal__Medico;
    }

    [Bindable(event="propertyChange")]
    public function get SolicitacaoProcedimentoItem() : ArrayCollection
    {
        return _internal_SolicitacaoProcedimentoItem;
    }

    public function clearAssociations() : void
    {
    }

    /**
     * data/source property setters
     */

    public function set _Procedimento(value:br.com.facdombosco.gesturehealthcare.model.vo.Procedimento) : void
    {
        var oldValue:br.com.facdombosco.gesturehealthcare.model.vo.Procedimento = _internal__Procedimento;
        if (oldValue !== value)
        {
            _internal__Procedimento = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "_Procedimento", oldValue, _internal__Procedimento));
        }
    }

    public function set _Atendimento(value:br.com.facdombosco.gesturehealthcare.model.vo.Atendimento) : void
    {
        var oldValue:br.com.facdombosco.gesturehealthcare.model.vo.Atendimento = _internal__Atendimento;
        if (oldValue !== value)
        {
            _internal__Atendimento = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "_Atendimento", oldValue, _internal__Atendimento));
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

    public function set _Medico(value:br.com.facdombosco.gesturehealthcare.model.vo.Medico) : void
    {
        var oldValue:br.com.facdombosco.gesturehealthcare.model.vo.Medico = _internal__Medico;
        if (oldValue !== value)
        {
            _internal__Medico = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "_Medico", oldValue, _internal__Medico));
        }
    }

    public function set SolicitacaoProcedimentoItem(value:*) : void
    {
        var oldValue:ArrayCollection = _internal_SolicitacaoProcedimentoItem;
        if (oldValue !== value)
        {
            if (value is ArrayCollection)
            {
                _internal_SolicitacaoProcedimentoItem = value;
            }
            else if (value is Array)
            {
                _internal_SolicitacaoProcedimentoItem = new ArrayCollection(value);
            }
            else if (value == null)
            {
                _internal_SolicitacaoProcedimentoItem = null;
            }
            else
            {
                throw new Error("value of SolicitacaoProcedimentoItem must be a collection");
            }
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "SolicitacaoProcedimentoItem", oldValue, _internal_SolicitacaoProcedimentoItem));
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
    public function get _model() : _SolicitacaoProcedimentoEntityMetadata
    {
        return model_internal::_dminternal_model;
    }

    public function set _model(value : _SolicitacaoProcedimentoEntityMetadata) : void
    {
        var oldValue : _SolicitacaoProcedimentoEntityMetadata = model_internal::_dminternal_model;
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
