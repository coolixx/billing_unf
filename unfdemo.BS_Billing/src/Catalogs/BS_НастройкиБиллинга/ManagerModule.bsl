#Если Сервер Или ВнешнееСоединение Тогда
	
Функция ПолучитьНастройкиПоУмолчанию() Экспорт
	
	НастройкиОбмена = Новый Структура;
		
		ДниОповещенияКонтрагентов = Новый ТаблицаЗначений;
		ДниОповещенияКонтрагентов.Колонки.Добавить("Пометка");
		ДниОповещенияКонтрагентов.Колонки.Добавить("День");
		ДниОповещенияКонтрагентов.Колонки.Добавить("Представление");
		
		СрокОплаты = ПолучитьМаксимальныйСрокОплаты();

		Для Сч = 1 по СрокОплаты Цикл

			СклонениеДень = ПользователиСлужебныйКлиентСервер.ПредметЦелогоЧисла(Сч, "НП=Истина;",
															НСтр("ru = 'день,дня,дней,,,,,,0'"));
			СтрокаТЧОповещениеКонтрагента = ДниОповещенияКонтрагентов.Добавить();
			СтрокаТЧОповещениеКонтрагента.День = Сч;
			СтрокаТЧОповещениеКонтрагента.Представление = СтрШаблон("%1 %2", Сч, СклонениеДень);
			СтрокаТЧОповещениеКонтрагента.Пометка = Ложь;
			
		КонецЦикла;

	НастройкиОбмена.Вставить("ДниОповещенияКонтрагентов", 	ДниОповещенияКонтрагентов);

	Возврат НастройкиОбмена;
	
КонецФункции

Функция ПолучитьМаксимальныйСрокОплаты()
	
	СрокОплаты = 7;
	
	Запрос = Новый Запрос;
	Запрос.Текст =
		"ВЫБРАТЬ
		|	МАКСИМУМ(ДоговорыКонтрагентов.СрокОплатыПокупателя) КАК СрокОплатыПокупателя
		|ИЗ
		|	Справочник.ДоговорыКонтрагентов КАК ДоговорыКонтрагентов
		|ГДЕ
		|	ДоговорыКонтрагентов.ЭтоДоговорОбслуживания = ИСТИНА";
	
	РезультатЗапроса = Запрос.Выполнить();
	
	Если НЕ РезультатЗапроса.Пустой() Тогда
		Выборка = РезультатЗапроса.Выбрать();
		
		Если Выборка.Следующий() Тогда
			СрокОплаты = ?(СрокОплаты > Выборка.СрокОплатыПокупателя, СрокОплаты, Выборка.СрокОплатыПокупателя)
		КонецЕсли;
	КонецЕсли;

	Возврат СрокОплаты;
	
КонецФункции 

#КонецЕсли