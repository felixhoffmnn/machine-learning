# Federated Learning

## Konzepte und Begriffe

-   **Server**: Der Server ist eine **zentrale** (oder auch **dezentrale**) Instanz, die die Clients und das Machine Learning Modell verwaltet
-   **Client**: Ein Client ist eine Instanz, die das Modell trainiert und die Daten lokal besitzt (z.B. ein _Smartphone_ oder _Krankenhaus_)
-   **Datenvertraulichkeit**: Die Daten der Clients sind **vertraulich** und dürfen nicht an den Server übertragen werden
-   **Heterogene / Homogene Daten**: Daten können starke Bias und Unterschiede besitzen, welche die Konvergenz des Modells beeinflussen können
    -   Heterogen Daten &rarr; Underfitting
    -   Homogene Daten &rarr; Overfitting
-   **Konvergenz**: Abhängig von den Daten kann ein Model konvergieren oder sogar divergieren, besonders wenn Biases in den Daten vorhanden sind

## Funktionsweise (Centralized Federated Learning)

Zunächst wollen wir uns den _Centralized Federated Learning_ Ansatz anschauen.
Des Weiteren gibt es noch den _Decentralized Federated Learning_ und _Heterogeneous Federated Learning_ Ansatz.

1. **Server wählt** ein Machine Learning **Modell** aus und **verteilt** (distributed) es an die **Clients**
    - z.B. Lineare Regression, neuronale Netze, Boosting
2. Clients **trainieren** das Modell mit ihren **lokalen** Daten
    - _Records_, _Epochen_ und _Batches_
3. Die Gradienten / Gewichte des Models werden vom Server **aggregiert**
    - Es können auch einzelne Layer eines Models upgedatet werden
    - Federated Stochastic Gradient Descent (_FedSGD_): Clients senden nur die Gradienten an den Server und dieser bildet den gewichteten Durchschnitt
    - Federated Averaging (_FedAvg_): Clients berechnet die Gradienten und gewichtet das Modell neu und sendet dieses an den Server
    - Hybrid Federated Dual Coordinate Ascent (_HyFDCA_)
4. Sobald der Server ein neues Modell gebildet hat, wird es an die Clients verteilt und eine neue _Epoche_ beginnt
5. Sobald die **gewünschte Anzahl an Epochen** (oder ein anderes Kriterium) erreicht ist, wird das **finale Modell** erstellt und ausgegeben
    - Zusätzlich werden Metriken wie _Accuracy_ und _Loss_ berechnet

> **Note:** Gewisse Ähnlichkeit zu _Parameter Server_
