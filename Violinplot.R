# "Скрипичный график" - график распределения значений данных (значения среднего, станд. отклонение).

# ЧАСТЬ-1. готовим датафрейм. 
	# шаг-1. вчитываем таблицу с данными. делаем из нее исходный датафрейм. чистим датафрейм от NA
MDepths <- read.csv("Depths.csv", header=TRUE, sep = ",")
Ml <- na.omit(MDepths) 
row.has.na <- apply(Ml, 1, function(x){any(is.na(x))}) 
sum(row.has.na) 
head(Ml)

MDTt = melt(setDT(Ml), measure = patterns("^profile"), value.name = c("depth"))
head(MDTt)


library(violinmplot) 

# ЧАСТЬ-2. рисуем диаграмму -"скрипки" (распределение данных)

violinmplot(depth ~ variable, MDTt, horizontal=FALSE, col.violin = "blue", main = "Violin plot of the Mariana Trench: \na hybrid of a Box plot and a Kernel probability density estimation plot (rotated) + median")