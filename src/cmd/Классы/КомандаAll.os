﻿// ///////////////////////////////////////////////////////////////////
// //
// // Служебный модуль с реализацией работы команды all
// //
// // Представляет собой модификацию приложения gitsync от 
// // команды oscript-library
// //
// // Структура модуля реализована в соответствии с рекомендациями 
// // oscript-app-template (C) EvilBeaver
// //
// ///////////////////////////////////////////////////////////////////

// Перем ДопПараметры;

// Процедура ЗарегистрироватьКоманду(Знач ИмяКоманды, Парсер) Экспорт

// 	ОписаниеКоманды = Парсер.ОписаниеКоманды(ИмяКоманды, "Запускает синхронизацию по нескольким репозиториям");
	
// 	Парсер.ДобавитьПозиционныйПараметрКоманды(ОписаниеКоманды, "ПутьКНастройкам", "Путь к файлу настроек синхронизатора.");

// 	Парсер.ДобавитьИменованныйПараметрКоманды(ОписаниеКоманды, "-log", "<Путь к файлу лога>");
// 	Парсер.ДобавитьИменованныйПараметрКоманды(ОписаниеКоманды, "-timer", "<Интервал срабатывания>");
// 	Парсер.ДобавитьИменованныйПараметрКоманды(ОписаниеКоманды, "-force", "<on|off> принудительная синхронизация");
// 	Парсер.ДобавитьИменованныйПараметрКоманды(ОписаниеКоманды, "-debug", "<on|off>");
// 	Парсер.ДобавитьИменованныйПараметрКоманды(ОписаниеКоманды, "-verbose", "<on|off>");
// 	Парсер.ДобавитьИменованныйПараметрКоманды(ОписаниеКоманды, "-tempdir", "<Путь к каталогу временных файлов>");

// 	Парсер.ДобавитьКоманду(ОписаниеКоманды);

// КонецПроцедуры // ЗарегистрироватьКоманду

// Функция ВыполнитьКоманду(Знач ПараметрыКоманды, Знач ДополнительныеПараметры) Экспорт

// 	ДопПараметры = ДополнительныеПараметры;

// 	ИмяФайлаНастроек = ПараметрыКоманды["ПутьКНастройкам"];
// 	Если ИмяФайлаНастроек = Неопределено Тогда

// 		МенеджерКомандПриложения.ПоказатьСправкуПоКомандам("all");
// 		Возврат МенеджерКомандПриложения.РезультатыКоманд().НеверныеПараметры;
		
// 	КонецЕсли;

// 	КаталогRoot = ОбъединитьПути(ТекущийСценарий().Каталог, "..\..\");

// 	Если ПараметрыКоманды["-log"] <> Неопределено Тогда

// 		Аппендер = Новый ВыводЛогаВФайл();
// 		Аппендер.ОткрытьФайл(ПараметрыКоманды["-log"]);
// 		ДополнительныеПараметры.Лог.ДобавитьСпособВывода(Аппендер);
// 		Раскладка = ЗагрузитьСценарий(ОбъединитьПути(КаталогRoot, "log-layout.os"));
// 		ДополнительныеПараметры.Лог.УстановитьРаскладку(Раскладка);

// 	КонецЕсли;

// 	Интервал = 0;
// 	Если ПараметрыКоманды["-timer"] <> Неопределено Тогда

// 		Интервал = Число(ПараметрыКоманды["-timer"]);

// 	КонецЕсли;

// 	Контроллер = Новый КонтроллерПакетнойСинхронизации;

// 	Пока Истина Цикл

// 		Контроллер.ВыполнитьСинхронизациюПоФайлуНастроек(
// 								ПараметрыКоманды, 
// 								ДополнительныеПараметры, 
// 								ИмяФайлаНастроек, 
// 								ПараметрыКоманды["-force"] = Истина);

// 		Если Интервал <= 0 Тогда

// 			Прервать;

// 		Иначе
			
// 			ДополнительныеПараметры.Лог.Информация("Ожидаем " + Интервал + " секунд перед новым циклом");
// 			Приостановить(Интервал * 1000);

// 		КонецЕсли;

// 	КонецЦикла;

// 	Возврат МенеджерКомандПриложения.РезультатыКоманд().Успех;

// КонецФункции // ВыполнитьКоманду
