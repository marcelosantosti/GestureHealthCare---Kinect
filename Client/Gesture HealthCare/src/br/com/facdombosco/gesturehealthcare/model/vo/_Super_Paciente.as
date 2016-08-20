/**
 * This is a generated class and is not intended for modification.  To customize behavior
 * of this value object you may modify the generated sub-class of this class - Paciente.as.
 */

package br.com.facdombosco.gesturehealthcare.model.vo
{
import br.com.facdombosco.gesturehealthcare.model.vo.Atendimento;
import br.com.facdombosco.gesturehealthcare.model.vo.Cirurgia;
import com.adobe.fiber.services.IFiberManagingService;
import com.adobe.fiber.valueobjects.IValueObject;
import flash.events.EventDispatcher;
import flash.utils.ByteArray;
import mx.collections.ArrayCollection;
import mx.events.PropertyChangeEvent;

import flash.net.registerClassAlias;
import flash.net.getClassByAlias;
import com.adobe.fiber.core.model_internal;
import com.adobe.fiber.valueobjects.IPropertyIterator;
import com.adobe.fiber.valueobjects.AvailablePropertyIterator;

use namespace model_internal;

[ExcludeClass]
public class _Super_Paciente extends flash.events.EventDispatcher implements com.adobe.fiber.valueobjects.IValueObject
{
    model_internal static function initRemoteClassAliasSingle(cz:Class) : void
    {
    }

    model_internal static function initRemoteClassAliasAllRelated() : void
    {
        br.com.facdombosco.gesturehealthcare.model.vo.Cirurgia.initRemoteClassAliasSingleChild();
        br.com.facdombosco.gesturehealthcare.model.vo.Atendimento.initRemoteClassAliasSingleChild();
    }

    model_internal var _dminternal_model : _PacienteEntityMetadata;
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
    private var _internal_Atendimento : ArrayCollection;
    model_internal var _internal_Atendimento_leaf:br.com.facdombosco.gesturehealthcare.model.vo.Atendimento;
    private var _internal_Codigo : int;
    private var _internal_DataNascimento : Date;
    private var _internal_Foto : ByteArray;
    private var _internal_IdadeAtual : String;
    private var _internal_Nome : String;
    private var _internal_Sexo : String;

    private static var emptyArray:Array = new Array();


    /**
     * derived property cache initialization
     */
    model_internal var _cacheInitialized_isValid:Boolean = false;

    model_internal var _changeWatcherArray:Array = new Array();

    public function _Super_Paciente()
    {
        _model = new _PacienteEntityMetadata(this);

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
    public function get Atendimento() : ArrayCollection
    {
        return _internal_Atendimento;
    }

    [Bindable(event="propertyChange")]
    public function get Codigo() : int
    {
        return _internal_Codigo;
    }

    [Bindable(event="propertyChange")]
    public function get DataNascimento() : Date
    {
        return _internal_DataNascimento;
    }

    [Bindable(event="propertyChange")]
    public function get Foto() : ByteArray
    {
        return _internal_Foto;
    }

    [Bindable(event="propertyChange")]
    public function get IdadeAtual() : String
    {
        return _internal_IdadeAtual;
    }

    [Bindable(event="propertyChange")]
    public function get Nome() : String
    {
        return _internal_Nome;
    }

    [Bindable(event="propertyChange")]
    public function get Sexo() : String
    {
        return _internal_Sexo;
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

    public function set Atendimento(value:*) : void
    {
        var oldValue:ArrayCollection = _internal_Atendimento;
        if (oldValue !== value)
        {
            if (value is ArrayCollection)
            {
                _internal_Atendimento = value;
            }
            else if (value is Array)
            {
                _internal_Atendimento = new ArrayCollection(value);
            }
            else if (value == null)
            {
                _internal_Atendimento = null;
            }
            else
            {
                throw new Error("value of Atendimento must be a collection");
            }
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "Atendimento", oldValue, _internal_Atendimento));
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

    public function set DataNascimento(value:Date) : void
    {
        var oldValue:Date = _internal_DataNascimento;
        if (oldValue !== value)
        {
            _internal_DataNascimento = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "DataNascimento", oldValue, _internal_DataNascimento));
        }
    }

    public function set Foto(value:ByteArray) : void
    {
        var oldValue:ByteArray = _internal_Foto;
        if (oldValue !== value)
        {
            _internal_Foto = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "Foto", oldValue, _internal_Foto));
        }
    }

    public function set IdadeAtual(value:String) : void
    {
        var oldValue:String = _internal_IdadeAtual;
        if (oldValue !== value)
        {
            _internal_IdadeAtual = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "IdadeAtual", oldValue, _internal_IdadeAtual));
        }
    }

    public function set Nome(value:String) : void
    {
        var oldValue:String = _internal_Nome;
        if (oldValue !== value)
        {
            _internal_Nome = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "Nome", oldValue, _internal_Nome));
        }
    }

    public function set Sexo(value:String) : void
    {
        var oldValue:String = _internal_Sexo;
        if (oldValue !== value)
        {
            _internal_Sexo = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "Sexo", oldValue, _internal_Sexo));
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
    public function get _model() : _PacienteEntityMetadata
    {
        return model_internal::_dminternal_model;
    }

    public function set _model(value : _PacienteEntityMetadata) : void
    {
        var oldValue : _PacienteEntityMetadata = model_internal::_dminternal_model;
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
