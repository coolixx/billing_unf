#Если Сервер Или ТолстыйКлиентОбычноеПриложение Или ВнешнееСоединение Тогда

&После("ОбработкаПроведения")
Процедура BS_ОбработкаПроведения(Отказ, РежимПроведения)
	Если ОбменДанными.Загрузка Тогда
		Возврат;
	КонецЕсли;
	
	Если ТипЗнч(ЭтотОбъект.ДокументОснование) = Тип("ДокументСсылка.СчетНаОплату") Тогда
		BS_РегистрацияОбъектовБиллингаВызовСервера.УдалениеЗарегистрированногоОбъекта(ЭтотОбъект.ДокументОснование);
	КонецЕсли;
КонецПроцедуры

#КонецЕсли
