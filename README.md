# si-exercises
Para el ejercicio 14, tenemos la versión en que reemplazamos los ifs por polimorfismo y el ejercicio opcional por separado.
Para sacar los ifs de with: decidimos agregar el siguiente método a Integer:
newNumber
	self = 0 ifTrue:[^Cero new].
	self = 1 ifTrue: [^Uno new].
	self > 1 ifTrue: [^Positivo new initializeWith: self].
	self < 0 ifTrue: [^Negativo new initializeWith: self].
