#import "@preview/polylux:0.3.1": *
#import "unipd.typ": *

#show: unipd-theme.with(
  author: "Elia Pasquali",
  title: "Progettazione e implementazione di un sistema di Network Detection and Response",
  date: "22/09/2023")

#set text(font: (
  "Noto Sans",
  "Segoe UI",
  "roboto",
  "Helvetica Neue",
  "Cantarell",
  "sans-serif",
))

#title-slide(
  subtitle: "Discussione Tesi di Laurea in Informatica"
)

#centered-slide(
  title: "Indice",
)[
  #side-by-side(columns: (1fr, 1fr),
    [
      #v(1em)
      #set text(size: 28pt)
      #enum(tight: false, indent: 4em)
      + L'azienda
      + Il progetto
      + Il prodotto
      + Obiettivi raggiunti
      + Conclusioni
    ],
    [
      #align(center, image("images/content-structure.svg", height: 80%))
    ]
  )
]

#centered-slide(
  title: "L'azienda",
  new-section: "L'azienda"
)[
  #align(center, image("images/wtc-logo.png", height: 3em))
  #v(1em)
  #side-by-side(
    [
      Nasce nel 1987 come _System Integrator_ che opera nel settore _ICT_
    ],
    [
      #align(center, image("images/wtc-sedi.png"))
    ],
    [
      Stage svolto all'interno del _team_ di _Network Operation Control_
    ]
  )
]

#centered-slide(
  title: "Nascita dello stage",
  new-section: "Il progetto"
)[
  #side-by-side(columns: (3fr, 1fr),
    [
      L'azienda cerca un sistema di NDR sul mercato che trova in Sangfor e attiva un _proof of concept_ con una singola sonda all'interno della rete aziendale
    ],
    [
      #align(center, image("images/sangfor-logo-small.png", height: 5em))
    ]
  )
  
  #align(center, image("images/arrow-down.svg", height: 2em))
  
  #side-by-side(columns: (1fr, 2fr),
    [
      #align(center, image("images/stageit.png"))
    ],
    [
      Tramite StageIT conosco Wintech e mi viene proposto un progetto di stage per portare in produzione il sistema _CyberCommand_ di Sangfor
    ]
  )
]

#centered-slide(
  title: "I sistemi NDR",
)[
  #side-by-side(columns: (1fr, 2fr),
    [
      #acronym("Network Detection and Response")

      Prodotti di sicurezza informatica che analizzano il traffico di rete e rilevano eventuali anomalie (_Network Detection_).
      
      Possono rispondere automaticamente alle minacce (_Network Response_)
    ],
    [
      #align(center, image("images/ndr-info.png"))
    ]
  )
]

#centered-slide(
  title: "Risultati attesi",
)[
  #uncover("1-")[
    *Obbligatori*:
    - _Deploy_ e configurazione del sistema NDR all'interno della rete aziendale
    - Test e analisi del prodotto
    - Configurazione della funzionalità di risposte automatiche
    - Documentazione di scelte prese, problemi e configurazioni
  ]

  #uncover("2-")[
    *Desiderabili*:
    - Integrazione con prodotti già presenti in azienda
  ]

  #uncover("3-")[
    *Facoltativi*:
    - _Bypassare_ il sistema di rilevazione
  ]
]

#centered-slide(
  title: "Il prodotto Sangfor",
  new-section: "Il prodotto"
)[
  #side-by-side(columns: (1fr, 2fr),
    [
      #v(1fr)
      _CyberCommand_, il sistema NDR offerto da Sangfor.

      Dalla dashboard è possibile visualizzare tutte le informazioni sulle minacce rilevate e lo stato della rete.
      #v(1fr)
    ],
    [
      #align(center, image("images/dashboard.png"))
    ]
  )
]

#centered-slide(
  title: "Sistema di sonde"
)[
  #side-by-side(columns: (1fr, 2fr),
    [
      #v(1fr)
      _CyberCommand_ sfrutte le sonde STA inserite all'interno della rete per analizzare il traffico di rete e rilevare eventuali anomalie. 
      #v(1fr)
    ],
    [
      #v(1fr)
      #align(center, image("images/sangfor-posizionamento.png"))
      #v(1fr)
    ]
  )
]

#centered-slide(
  title: "Flusso di analisi e whitelist"
)[
  #side-by-side(columns: (1fr, 1fr),
    [
      #v(1em)
      #align(center, image("images/analysis-stream.png"))
    ],
    [
      Possono essere definite delle regole per filtrare il traffico in modo da ottenere un'analisi più precisa.
    ]
  )

  #side-by-side(columns: (1fr, 1fr, 1fr),
    [
      #align(center, image("images/audit-whitelist.png", height: 8em))
    ],
    [
      #v(1fr)
      #align(center, image("images/alert-whitelist.png"))
      #v(1fr)
    ],
    [
      #align(center, image("images/weakness-whitelist.png"))
    ]
  )
]

#slide(
  title: "Segnalazioni"
)[
  #side-by-side(columns: (1fr, 2fr),
    [
      #v(1fr)
      Le segnalazioni rilevate vengono visualizzate con tutti i dettagli e i _log_ a loro associati.
      #v(1fr)
    ],
    [
      #v(1fr)
      #align(center, image("images/incident-detail.png"))
      #v(1fr)
    ]
  )
]

#centered-slide(
  title: "Risposte automatiche"
)[
  #side-by-side(columns: (1fr, 2fr),
    [
      #v(1fr)
      Il sistema NDR può rispondere automaticamente alle minacce rilevate seguendo un algoritmo costituito da _action node_ e _decision node_
      #v(1fr)
    ],
    [
      #v(1fr)
      #align(center, image("images/response.png"))
      #v(1fr)
    ]
  )
]

#centered-slide(
  title: "Obiettivi raggiunti",
  new-section: "Obiettivi raggiunti"
)[
  #box(image("images/checkmark.svg", height: 1em)) NDR inserito in produzione, configurato e testato

  #uncover("2-")[
    #box(image("images/checkmark.svg", height: 1em)) Documentate _best practices_ e problemi riscontrati
  ]
  
  #uncover("3-")[
    #box(image("images/checkmark.svg", height: 1em)) Risolti problemi rilevati con la definizione delle regole
  ]
  
  #uncover("4-")[
    #box(image("images/checkmark.svg", height: 1em)) Definite risposte automatiche e integrate con EDR
  ]

  #uncover("5-")[
    #box(image("images/crossmark.svg", height: 1em)) _Bypass_ del sistema di rilevazione
  ]
  
  #uncover("6-")[
    #box(image("images/crossmark.svg", height: 1em)) Integrazione con prodotti già presenti in azienda impossibile con attuale versione di _CyberCommand_
  ]
]

#centered-slide(
  title: "Rete ottenuta a fine stage"
)[
  #side-by-side(columns: (2fr, 1fr), gutter: 1em,
    [
      #image("images/sonde.svg")
    ],
    [
      Sonde presenti in:

      - Sede Wintech (PD)
      - Datacenter Trivenet (PD)
      - Datacenter Data4 (MI)
      - Sede cliente (VE)
    ]
  )
]

#slide(
  title: "Resoconto finale",
  new-section: "Conclusioni"
)[
  #side-by-side(columns: (1fr, 1fr),
    [
      *Lato personale*:
      - Esperienza di lavoro in un team aziendale
      - Conoscenza di un prodotto all'avanguardia di sicurezza di rete
      - Formazione nell'ambito di rete e sicurezza con strumenti professionali e in un contesto reale
    ],
    [
      #align(right, image("images/grow.svg", height: 8em))
      #v(1em)
      *Lato aziendale*:
      - Segnalati problemi e possibili miglioramenti al prodotto
      - Il sistema si è dimostato efficace nella rilevazione dei problemi
    ]
  )
]