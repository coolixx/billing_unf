Функция ВызватьМетодAPIGET(Метод, Токен) Экспорт
#Если не ВебКлиент Тогда 	
АдресРесурса = "/partner-api/v2"+Метод; ///orders/services

ЗапросКAPI = СоздатьПодключениеКAPI(Токен,АдресРесурса);


Соединение1 = Новый HTTPСоединение("service-api.1capp.com",,,,Новый ИнтернетПрокси,,Новый ЗащищенноеСоединениеOpenSSL);
ОтветHTTP = Соединение1.Получить(ЗапросКAPI);

ResponsesJson = ОтветHTTP.ПолучитьТелоКакСтроку();

ЧтениеJSON = Новый ЧтениеJSON();
ЧтениеJSON.УстановитьСтроку(ResponsesJson);


Результат = ПрочитатьJSON(ЧтениеJSON);

	Возврат Результат;
#Иначе 
	Возврат неопределено;
#КонецЕсли
КонецФункции

Функция СоздатьПодключениеКAPI(Token,АдресРесурса)
#Если не ВебКлиент Тогда 
ЗапросКAPI = Новый HTTPЗапрос;
ЗапросКAPI.Заголовки.Вставить("accept", "application/json");
ЗапросКAPI.Заголовки.Вставить("Authorization", "Bearer "+Token);
ЗапросКAPI.АдресРесурса = АдресРесурса;

Возврат ЗапросКAPI;
#Иначе
Возврат неопределено;
#КонецЕсли	
КонецФункции
 