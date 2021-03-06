﻿
&НаСервереБезКонтекста
Процедура КомандаСформироватьНаСервере()
		//{{КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!
	
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	бпсСогласование.Ссылка,
		|	бпсСогласование.Дата КАК Дата
		|ИЗ
		|	БизнесПроцесс.бпсСогласование КАК бпсСогласование
		|
		|УПОРЯДОЧИТЬ ПО
		|	Дата";
	
	РезультатЗапроса = Запрос.Выполнить();
	
	Выборка = РезультатЗапроса.Выбрать();
	
	Отказ = Ложь;
	Пока Выборка.Следующий() Цикл
		РегистрыСведений.бпсБизнесПроцессыСогласования.ДобавитьЗапись(Выборка.Ссылка,Отказ);
		Сообщить("Обработан "+Выборка.Ссылка);
	КонецЦикла;
	
	//}}КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА

КонецПроцедуры

&НаКлиенте
Процедура КомандаСформировать(Команда)
	КомандаСформироватьНаСервере();
КонецПроцедуры
