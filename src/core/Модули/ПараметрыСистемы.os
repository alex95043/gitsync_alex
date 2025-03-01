﻿///////////////////////////////////////////////////////////////////
//
// Служебный модуль с набором служебных параметров приложения
//
// Структура модуля реализована в соответствии с рекомендациями 
// oscript-app-template (C) EvilBeaver
//
///////////////////////////////////////////////////////////////////

// ИмяПродукта
//	Возвращает имя продукта
//
// Возвращаемое значение:
//   Строка   - Значение имени продукта
//
Функция ИмяПродукта() Экспорт
	
	Возврат "GitSync";
	
КонецФункции // ИмяПродукта

//	Возвращает идентификатор лога приложения
//
// Возвращаемое значение:
//   Строка   - Значение идентификатора лога приложения
//
Функция ИмяЛогаСистемы() Экспорт
	
	Возврат "oscript.app." + ИмяПродукта();
	
КонецФункции // ИмяЛогаСистемы

// ВерсияПродукта
//	Возвращает текущую версию продукта
//
// Возвращаемое значение:
//   Строка   - Значение текущей версии продукта
//
Функция ВерсияПродукта() Экспорт

	Возврат "3.5.4";

КонецФункции // ВерсияПродукта()

Процедура ПриРегистрацииКомандПриложения(Знач КлассыРеализацииКоманд) Экспорт

	КлассыРеализацииКоманд["help"]			= "КомандаСправкаПоПараметрам";
	КлассыРеализацииКоманд[ИмяКомандыВерсия()] = "КомандаVersion";
	КлассыРеализацииКоманд["clone"]			= "КомандаClone";
	КлассыРеализацииКоманд["init"]			= "КомандаInit";
	КлассыРеализацииКоманд["set-version"]	= "КомандаSetVersion";
	КлассыРеализацииКоманд["all"]			= "КомандаAll";
	КлассыРеализацииКоманд["export"]		= "КомандаExport";
	КлассыРеализацииКоманд["sync"]			= "КомандаSync";
	
КонецПроцедуры // ПриРегистрацииКомандПриложения

Функция ИмяКомандыПоУмолчанию() Экспорт

	Возврат "sync";
	
КонецФункции // ИмяКомандыПоУмолчанию

// Возвращает имя команды версия (ключ командной строки)
//
//  Возвращаемое значение:
//   Строка - имя команды
//
Функция ИмяКомандыВерсия() Экспорт
	
	Возврат "version";

КонецФункции // ИмяКомандыВерсия
