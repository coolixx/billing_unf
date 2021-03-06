
#Область МетодыГРМ

Функция МетодЗапускаПриложения() Экспорт
	Возврат "/applications/%1/action/start";
КонецФункции

Функция МетодОстоновкиПриложения() Экспорт
	Возврат "/applications/%1/action/stop";
КонецФункции

Функция МетодПолученияСпискаПриложенийКлиентаПоID() Экспорт
	Возврат "​/customers​/%1/applications";
КонецФункции

Функция МетодПолученияСпискаПриложений() Экспорт
	Возврат "/applications";
КонецФункции

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция HTTPМетоды() Экспорт
	
	Методы = Новый Структура;
	Методы.Вставить("CONNECT", "CONNECT");
	Методы.Вставить("COPY", "COPY");
	Методы.Вставить("DELETE", "DELETE");
	Методы.Вставить("GET", "GET");
	Методы.Вставить("HEAD", "HEAD");
	Методы.Вставить("LOCK", "LOCK");
	Методы.Вставить("MERGE", "MERGE");
	Методы.Вставить("MKCOL", "MKCOL");
	Методы.Вставить("MOVE", "MOVE");
	Методы.Вставить("OPTIONS", "OPTIONS");
	Методы.Вставить("PATCH", "PATCH");
	Методы.Вставить("POST", "POST");
	Методы.Вставить("PROPFIND", "PROPFIND");
	Методы.Вставить("PROPPATCH", "PROPPATCH");
	Методы.Вставить("PUT", "PUT");
	Методы.Вставить("TRACE", "TRACE");
	Методы.Вставить("UNLOCK", "UNLOCK");
	
	Возврат Методы;
	
КонецФункции

Функция БазаИспользуетсяВМоделиСервиса() Экспорт
	
	Возврат ОбщегоНазначения.РазделениеВключено(); 	
	
КонецФункции

#КонецОбласти