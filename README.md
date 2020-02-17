### Sterowanie Złożonymi Układami Mechaniczmym
##  Sterowanie nogami dla robota szczescionożnego
Projekt wykonali:

  - Brosz Seweryn   36711
  - Hawrot Filip    36726
  - Mikołajczyk Tytus 36753 

## W projekcie wykonano: 

  - Model kinematyki nogi robota 
  - Wykonano implementacje sterowania jakobianowego
  - Próbę komunikacji matlab - ros - gazebo
 

## Komentarz odnośnie wybranych rozwiązań w kodzie programu
  
hat - funkcja tworząca macierz skośno-symetryczną. Znajduje ona zastosowanie w zastępowaniu mnożenia wektorowego mnożeniem macierzowym. Użycie jej umożliwiło dalsze obliczenia analityczne w drodze syntezy modelu stosowanego w niniejszym projekcie; tutaj są to konkretnie prędkości końcówki każdego z ramion manipulatora,
np. p(t) = exp( hat(s)*t ) * p0.

Liczenie jakobianu polegało na analitycznym obliczeniu pochodnej iloczynu trzech funkcji po czasie oraz wyciągnięciu zmiennych kątowych theta(1-3) poza macierz.

W celu policzenia pochodnej z jakobianu używamy zmiennych symbolicznych theta1, theta2 i theta3 oraz upraszczamy policzony analitycznie jakobian komendą "simplify(J)" i działamy macierzą, która jest efektem tej komendy. Należy pamiętać, że konieczne jest pobranie jedynie pierwszych trzech wierszy tej macierzy, aby możliwe było jej odwrócenie (zgodność liczb wierszy i kolumn w macierzy 3x3).

We wzorze na pochodne kątów obrotu zawarte jest mnożenie macierzy odwrotnej jakobianu przez wektor prędkości punktu p w przestrzeni XYZ, którą chcemy "rysować" tym punktem. W naszym przypadku jest to końcówka manipulatora. W kodzie to operator zadaje ścieżkę, po której chcemy, żeby końcówka nogi robota poruszała się. Odbywa się to w przedostatniej linii kodu: dx = inv(J(1:3,:))*[prędkośćX; prędkośćY; prędkośćZ];

Dla policzenia prędkości poruszania się punktów p (końcówek ramion manipulatora/nogi robota) użyta została metoda "miażdżenia" liczb do macierzy z niewiadomymi przy rozwiązywaniu macierzowych układów równań ze stałymi:
 -Ostatni argument w wektorze zmiennych ustawiamy jako "1", a w macierzy stałych dostawiamy kolumnę tych liczb. W wektorze pochodnych na miejscu wspomnianej jedynki pojawia się zero, czyli pochodna po "1", co daje nam uproszczenie wektora prędkości do trzech współrzędnych pomimo tego, że wektor jest czteroelementowy. Jest to jedna ze sztuczek na zapewnienie zgodności wymiarów macierzy w celu bezkolizyjnego na nich działania.


Deklaracja prędkości (a co za tym idzie - położenia) punktu końcowego każdego z członów manipulatora w przypadku kinematyki w naszym wydaniu polega na przemnożeniu wartości początkowej tegoż punktu przez odpowiednie eksponenty każdego z ramion pomiędzy tym punktem a punktem podstawy manipulatora. 



W symulacji wykorzystano model https://github.com/HumaRobotics/phantomx_gazebo .
W repozytorium znajdują się skrypt z modelem kinematyki, sterowaniem jakobianowym oraz skrypt symulujący chodzenie robota 6-nożnego.
W trakcie sprawdzania symulacji robota odkryto, że komendy "send" są wysyłane z dużym opóźnieniem między sobą, co powoduje zachwiania równowagi robota.

### Wnioski:
- Symulacja w gazebo wykazała duże opóźnienie miedzy wysyłanymi komendami, co powoduje duże zachwiania i wręcz utracenie równowagi przez robota 
- Przy wykonywaniu więcej niż jednego kroku robot  "gubi" i "dodaje" losowe pojedyncze sekwencje co jest zauwazalne w symulacji (eksperymentalnie odnotowano ruch piszczelą, przy symulacji skryptu nieużywającego tej funkcji) 
  
