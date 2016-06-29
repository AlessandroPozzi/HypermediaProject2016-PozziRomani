-- phpMyAdmin SQL Dump
-- version 4.1.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 29, 2016 at 05:11 PM
-- Server version: 5.6.29-log
-- PHP Version: 5.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `my_timhypermediaproject2016`
--

-- --------------------------------------------------------

--
-- Table structure for table `assistance`
--

CREATE TABLE IF NOT EXISTS `assistance` (
  `id_assistance` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `description` text COLLATE utf8_bin NOT NULL,
  `In_evidenza` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_assistance`),
  UNIQUE KEY `assistance name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=10 ;

--
-- Dumping data for table `assistance`
--

INSERT INTO `assistance` (`id_assistance`, `name`, `description`, `In_evidenza`) VALUES
(1, 'Dettaglio delle chiamate per Clienti Ricaricabili', 'Il servizio "documentazione traffico" ti offre la possibilità di avere il dettaglio di ogni telefonata, connessione dati o altro evento, effettuato dalla tua linea (*). Per ogni evento viene fornita l’indicazione della data/ora di effettuazione, del costo, della tipologia e del numero chiamato se si tratta di traffico voce o sms (con le ultime tre cifre asteriscate - L. 171/98 "Tutela vita privata nelle telecomunicazioni"). <br/><br/>\n\nLa documentazione del traffico è sempre disponibile in MyTIM Mobile e consultabile fino a due mesi antecedenti la data di consultazione del traffico se utilizzi una linea ricaricabile, in diversi formati facilmente consultabili ed archiviabili (esempio pdf). <br/><br/>\n\nÈ comunque possibile richiedere l’invio di un tabulato cartaceo del traffico pregresso (equivalente al pdf già disponibile in MyTIM Mobile), o l’invio di un tabulato del traffico pregresso in chiaro (deve essere in questo caso specificato), purché rientri nei periodi sopra indicati. In questo caso dovrai compilare ed inviare l''apposito modulo di "Richiesta Documentazione Traffico" che puoi scaricare in formato pdf dalla sezione Moduli, selezionando la sottosezione Ricaricabile di riferimento. \n <br/><br/>\n\n\n(*) alcune tipologie di traffico, per cui non è previsto un costo, possono non essere documentate.\n', 0),
(2, 'Scopri come consultare i consumi della tua linea con abbonamento', 'Puoi consultare i consumi del tuo Abbonamento\n \n<br/><br/>\nDirettamente online\nRegistrandoti a MyTIM Mobile potrai verificare, aggiornate alla data riportata sul sito:\n<br/><br/>\n   1. Traffico VOCE, che è composto da:\n<br/><br/>\n"Traffico Voce Nazionale": è l''importo che comprende le chiamate effettuate dall’Italia verso numerazioni nazionali e verso numerazioni speciali.<br/>\n"Traffico Voce Internazionale": è l''importo che comprende le chiamate effettuate dall''Italia verso numeri esteri.<br/>\n"Traffico Voce PayForMe" : è l’importo complessivo del traffico voce effettuato utilizzando il servizio di addebito della chiamata "4088 PayForMe".<br/>\n"Traffico Roaming (Voce)": è l''importo delle chiamate effettuate e ricevute all’estero.\n   2. Traffico SMS/MMS, che include:\n<br/><br/>\n"Traffico SMS": è l''importo che comprende i messaggi di testo inviati verso numerazioni mobili e di rete fissa.<br/>\n"Traffico MMS": è l''importo che comprende i messaggi multimediali (mms) inviati verso numerazioni mobili e di rete fissa.<br/>\n   3. Altro traffico dati / Servizi Interattivi, che comprende:<br/><br/>\n\n"Navigazione wap" è l''importo che comprende il traffico effettuato per la trasmissione di dati/connessione ad internet utilizzando la modalità wap (punto di accesso alla rete dati per la connessione: wap.tim.it).<br/>\n"Altro traffico dati" è l''importo che comprende il traffico effettuato per la trasmissione di dati/connessione ad internet utilizzando tutti gli altri punti di accesso alla rete dati.\n"Wifi" è l’importo complessivo del traffico effettuato da accesso Wifi.<br/>\n"Servizi interattivi" è l’importo che comprende gli addebiti per la ricezione/invio di sms/mms da numerazioni brevi a contenuto speciale (esempio: logo, suoneria, sfondo), gli sms utilizzati attraverso il servizio "4088 PayForMe sms", e tutti i servizi supplementari non inclusi nei contatori precedenti.\n<br/><br/>\nChiamando dal tuo telefonino il numero gratuito 40915: <br/>\nE'' importante sapere che il "traffico online" si riferisce ai consumi non inclusi nel costo di eventuali offerte e promozioni attive sulla tua linea. I consumi si riferiscono al periodo che intercorre dal primo giorno del bimestre di riferimento alla data comunicata dalla fonia. \nSe hai attivato una o più promozioni, al tasto 2 puoi verificare il residuo dei bonus corrispondenti e i numeri amici. Questo fa riferimento al periodo compreso tra il primo giorno del mese in corso e la data comunicata dalla fonia della voce guida. \n<br/><br/>\nPuoi contattare il 40915 anche solo inviando un sms gratuito con le seguenti sintassi:\n<br/><br/>\nSALTOT    per conoscere il saldo complessivo ed eventuale bonus.<br/>\nSALNAZ    per conoscere il saldo del traffico nazionale.<br/>\nSALITZ     per conoscere il saldo del traffico internazionale.<br/>\nSALROA   per conoscere il saldo del traffico roaming.<br/>\nSALSMS   per conoscere il saldo del traffico sms.\nSALMMS  per conoscere il saldo del traffico mms.\nSALWAP  per conoscere il saldo del traffico wap.\nSALDATI  per conoscere il saldo del traffico dati web (punto di accesso ibox.tim.it).<br/>\nSALWIFI  per conoscere il saldo del traffico wifi.<br/>\nSALVAS   per conoscere il saldo del traffico di tutti i servizi supplementari (esempio: sms interattivi).Riceverai un sms di risposta con le informazioni richieste.<br/><br/>\n\nNavigando dal telefonino:<br/>\nSul sito TIM.it ottimizzato per il tuo smartphone, oppure attraverso l''App MyTIM Mobile , attualmente disponibile in download gratuito nelle versioni per iPhone e per smartphone con sistema operativo Android.', 0),
(3, 'La domiciliazione sul Conto Corrente per i clienti ricaricabili', 'A partire dal 10/12/2015, è possibile domiciliare i costi del rinnovo delle offerte su conto corrente bancario o postale.<br/>\nTale modalità si aggiunge all’attuale domiciliazione su carta di credito.\n<br/><br/>\nPer richiedere la domiciliazione alla tua banca dovrai necessariamente recarti presso un Negozio TIM ed esibire la tua carta bancomat o postamat inserendo il codice PIN sul terminale POS. Al termine dell’operazione ti verrà chiesto di firmare il modulo di autorizzazione permanente di addebito in conto corrente.\n<br/><br/>\nL’attivazione della domiciliazione non è immediata, ma necessita dell’autorizzazione dell’istituto bancario che, in una settimana circa, comunicherà l’esito della richiesta e un SMS ti avviserà che l’operazione è andata a buon fine. <br/>A seguito dell’inserimento della richiesta di domiciliazione, in attesa dell’esito da parte della banca, potrai richiedere l’attivazione di una carta servizi con modalità di addebito su “conto corrente”, se tale modalità di pagamento è prevista per la specifica offerta. In attesa della validazione della domiciliazione, il primo canone dell’offerta e il costo di attivazione devono essere pagati al punto vendita con le usuali modalità di pagamento. Nel caso in cui, nel periodo che intercorre tra l’attivazione dell’offerta ed il primo rinnovo, l’autorizzazione da parte della banca non vada a buon fine, l’offerta non sarà rinnovata.<br/><br/>\n\nUna volta attivata la domiciliazione avrai la possibilità di acquistare anche altre offerte domiciliandone il rinnovo su conto corrente.', 0),
(4, 'Verifica online il tuo traffico', 'Accedendo alla sezione MyTIM Mobile del nostro sito è possibile verificare il dettaglio dei consumi relativi al traffico effettuato.<br/><br/>\n\nSe hai una linea prepagata: è possibile verificare il dettaglio del traffico effettuato a partire dal giorno precedente e fino agli ultimi 2 mesi rispetto alla data di consultazione.\n <br/><br/>\nSe hai sottoscritto un abbonamento: oltre a verificare il saldo dei consumi in corso di fatturazione, è possibile verificare online e scaricare il pdf del traffico telefonico effettuato entro 90 gg. dalla data di scadenza della fattura di riferimento.', 1),
(5, 'Attivazione linea di casa', 'Richiedere l’attivazione di una linea telefonica di casa è molto semplice, puoi:<br/><br/>\n\nrichiederla online\nchiamare il Servizio Clienti linea fissa 187\nrecarti presso un Negozio TIM.<br/>\nVerifica la modalità di attivazione consultando on line le varie offerte disponibili.<br/><br/>\n\nI dati necessari sono:<br/><br/>\n\nnome e cognome<br/>\ncodice fiscale<br/>\nindirizzo dell''abitazione per cui richiedi <br/>l''installazione della linea<br/>\nun recapito telefonico di cellulare<br/>\nindirizzo email (facoltativo).<br/>\nIl nostro personale tecnico ti contatterà quanto prima per concordare l’appuntamento per l’installazione dell’impianto telefonico.', 1),
(6, 'MyTIM Fisso e MyTIM Mobile, le aree clienti per gestire la tua linea', 'Hai un unico punto di accesso per gestire online la tua linea di casa e la tua linea mobile: MyTIM\nAll’interno della sezione MyTIM trovi :<br/>\nMyTIM Mobile (il nuovo nome dell’Area Clienti 119)<br/>\nMyTIM Fisso (il nuovo nome dell’Area Clienti 187)<br/><br/>\nLe modalità di accesso alle Aree Clienti non cambiano.<br/>\nPuoi accedere a MyTIM Fisso utilizzando username e password dell’Area Clienti 187 o indirizzo mail e password della mail Alice.<br/>\nPuoi accedere a MyTIM Mobile utilizzando come username la linea mobile e la password di 8 cifre numeriche.', 1),
(7, 'TIMgames', 'TIMgames è servizio TIM edicato al gaming che consente a tutti i clienti di scaricare su tablet e smartphone i migliori giochi on demand e in abbonamento per il mondo mobile.<br/><br/>\n\nCon TIMgames avrai a disposizione una library di oltre 1500 giochi, aggiornata ogni settimana con nuovi titoli e giochi in offerta presenti nell’area promozioni dello store.\n<br/><br/>\nTIMgames èaccessibile sia da App (scaricabile da Google Play) che da browser su www.timgames.it L’utente può scegliere la modalità di acquisto preferita tra on demand e abbonamento.\n<br/><br/>\nIn particolare:\n<br/>\nOn demand: a partire da 0,49€, acquistando e scaricando un gioco sul proprio telefonino;\n<br/><br/>\nIn abbonamento: con I Love Games Promo, a soli 2€ a settimana si possono scaricare senza limiti tutti i giochi presenti su TIMgames. Il primo mese è in promozione a solo 1€ a settimana.', 0),
(8, 'TIMreading', 'TIMreading è lo Store di TIM che permette di acquistare e leggere eBook, quotidiani e Magazine su PC, Tablet e Smartphone.<br/><br/>\n\nI contenuti disponibili sullo store sono:\n<br/>\n-11 quotidiani nazionali e sportivi, completi di allegati ed edizioni locali, disponibili in abbonamento settimanale o mensile sul proprio PC, Tablet o Smartphone, per seguire l’informazione dalle prime ore del mattino\n<br/>\n-oltre 50 Magazine in copia singola o in abbonamento, per scoprire le nuove tendenze e nuove mete, seguire i gossip e l’attualità\n<br/>\n-oltre 75.000 eBook tra best seller, gialli, romanzi rosa, classici e tanto altro, per passare il tempo leggendo un buon libro.\n<br/><br/>\n \n\nPuoi attivare diverse offerte per scoprire il servizio TIMreading:\n<br/>\n-abbonamenti a quotidiani e abbonamenti o copie singole di magazine dal sito TIMreading<br/>\n\n-presso i Negozi TIM o sul sito TIM l’abbonamento ad un quotidiano a partire da 15,99€/mese, con i primi 3 mesi gratis o l’abbonamento “I Love Mags” per scegliere ogni mese le riviste che preferisci.<br/>\n\n-presso i Negozi TIM l’abbonamento ad una rivista a partire da 10,99€/mese e hai un secondo abbonamento a scelta in regalo<br/>\n\n-ogni eBook ha il proprio prezzo ed ogni giorno su TIMreading almeno un libro è offerto con oltre il 60% di sconto.\n\n', 0),
(9, 'Configurazione Mail su iPhone', 'Per aggiungere il tuo account di posta Alice su iPhone, tocca dal menu l''icona Impostazioni.<br/>\nNelle Impostazioni:\n<br/>\n  scegli la voce Posta, contatti, <br/>calendari<br/>\n  quindi Aggiungi account...<br/>\n  dall''elenco dei provider vai su Altro. <br/><br/>\ntocca l''opzione Aggiungi account Mail<br/>\ncompila i campi con i tuoi dati della casella di posta Alice:<br/>\n  Nome: inserisci un nome a tua scelta;<br/>\n  Indirizzo: il tuo indirizzo completo del dominio @alice.it;<br/>\n  Password: digita la tua password di posta;<br/>\n  Descrizione: inserisci un nome per specificare questo account (Alice, Casa, Ufficio, ...).<br/><br/>\ntocca infine il tasto Avanti.<br/>', 1);

-- --------------------------------------------------------

--
-- Table structure for table `assistance_categories_content`
--

CREATE TABLE IF NOT EXISTS `assistance_categories_content` (
  `assistance_category` varchar(255) COLLATE utf8_bin NOT NULL,
  `content` varchar(255) COLLATE utf8_bin NOT NULL,
  `id_entry` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_entry`),
  KEY `assistance categories` (`assistance_category`),
  KEY `assistance content integrity` (`content`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=13 ;

--
-- Dumping data for table `assistance_categories_content`
--

INSERT INTO `assistance_categories_content` (`assistance_category`, `content`, `id_entry`) VALUES
('Controllo costi e pagamenti', 'Verifica online il tuo traffico', 1),
('Controllo costi e pagamenti', 'La domiciliazione sul Conto Corrente per i clienti ricaricabili', 2),
('Controllo costi e pagamenti', 'Dettaglio delle chiamate per Clienti Ricaricabili', 3),
('Controllo costi e pagamenti', 'Scopri come consultare i consumi della tua linea con abbonamento', 4),
('Gestione linea e servizi', 'Attivazione linea di casa', 5),
('Gestione linea e servizi', 'MyTIM Fisso e MyTIM Mobile, le aree clienti per gestire la tua linea', 6),
('Smart Life', 'TIMgames', 10),
('Smart Life', 'TIMreading', 11),
('Supporto tecnico e configurazione', 'Configurazione Mail su iPhone', 12);

-- --------------------------------------------------------

--
-- Table structure for table `assistance_faq`
--

CREATE TABLE IF NOT EXISTS `assistance_faq` (
  `id_faq` int(11) NOT NULL,
  `question` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `answer` text COLLATE utf8_bin,
  PRIMARY KEY (`id_faq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `assistance_faq`
--

INSERT INTO `assistance_faq` (`id_faq`, `question`, `answer`) VALUES
(1, 'Posso attivare la domiciliazione bancaria o postale telefonicamente o via web? ', 'No, per attivare la domiciliazione dovrai necessariamente recarti presso un Negozio TIM ed esibire la tua carta bancomat o postamat, inserire il codice PIN sul terminale POS e firmare la Proposta di attivazione offerte con addebito su conto corrente (Mandato Generico). '),
(2, 'La domiciliazione sul conto corrente è immediatamente attiva? ', 'No, la domiciliazione sul conto corrente necessita dell’approvazione da parte della banca per essere operativa.\r\nNella fase di richiesta viene rilasciato un codice di autorizzazione generato dall’acquisizione tramite POS, valido fino al ricevimento dell’esito definitivo da parte della banca che in genere arriva in circa 7 giorni.'),
(3, 'Come faccio a sapere se la mia richiesta di domiciliazione è andata a buon fine? ', 'A seguito del buon esito dell’operazione, riceverai un SMS che ti comunicherà il “codice riferimento mandato” di 24 caratteri. Il codice è univoco. '),
(4, 'Devo richiedere un’autorizzazione per ogni attivazione di offerta? ', 'No, la nuova normativa che disciplina il protocollo bancario SDD (SEPA CORE DIRECT DEBIT) consente al cliente di utilizzare un unico mandato per l’addebito di servizi TIM su conto corrente.'),
(5, 'Una volta acquisito il mandato a mio nome posso domiciliare l’offerta di un’altra persona? ', 'Il codice fiscale dell’intestatario del conto corrente deve coincidere con quello dell’intestatario della linea su cui viene richiesto il servizio. In caso di conto cointestato è sufficiente la corrispondenza tra l’intestatario della SIM e uno qualsiasi degli intestatari del conto. '),
(6, 'Si può acquisire un mandato generico per un minorenne? ', 'No, un minorenne, salvo casi eccezionali disciplinati dalla legge, non può essere né intestatario né cointestatario di un conto corrente. '),
(7, 'Ho già attivato la domiciliazione, ma devo cambiare banca. Come devo fare? ', 'Puoi fare la richiesta direttamente presso l’istituto bancario su cui vuoi fare la variazione. In alternativa, seleziona da qui il modulo “modifica dell’autorizzazione permanente di addebito in conto corrente” compilalo e clicca su “invia modulo” oppure scaricalo e, dopo averlo compilato, invialo per posta al recapito indicato sul modulo stesso. '),
(8, 'Voglio revocare il mandato, come devo fare? ', 'Puoi fare la richiesta direttamente presso il tuo istituto bancario. In alternativa, seleziona da qui il modulo “revoca dell’autorizzazione permanente di addebito in conto corrente” compilalo e clicca su “invia modulo” oppure scaricalo e, dopo averlo compilato, invialo per posta al recapito indicato sul modulo stesso. '),
(9, 'Cosa succede in caso di mancato pagamento da parte della banca per insufficienza fondi? ', 'Nel caso di mancato pagamento da banca, sono previsti al massimo due tentativi di addebito, uno ogni 10 giorni, dopodiché l’offerta viene cessata. '),
(10, 'Quali documenti sono necessari? ', 'Dovrai fornire in visione i seguenti documenti:\r\n\r\n    documento di identità del titolare linea (carta identità, patente di guida con foto, passaporto);\r\n    codice fiscale del titolare linea;\r\n    documentazione antiabusivismo, rappresentata da uno dei seguenti documenti:\r\n        copia di una recente fattura (luce, gas, acqua) anche se intestata ad altri precedenti soggetti, occupanti la medesima unità immobiliare per la quale è stata fatta richiesta di collegamento telefonico\r\n        oppure\r\n        copia della concessione/licenza edilizia.\r\n        oppure\r\n        copia della domanda di concessione in sanatoria corredata della prova dell''avvenuto pagamento delle somme dovute a titolo di oblazione (così come previsto dal 2° comma dell''art.45 della legge 28.2.85 n.47).\r\n\r\nSolo nel caso non fosse possibile presentare uno qualsiasi dei documenti, potrai produrre in sostituzione una "autodichiarazione sostitutiva di atto notorio" autenticata dal notaio o dal segretario comunale come previsto dall''art.4 della legge 4.1.68 e successive modificazioni ed integrazioni. '),
(11, 'Quali sono le diverse tipologie di linea telefonica di casa? ', '\r\n\r\n•    LINEA TELEFONICA PRINCIPALE: è una linea telefonica principale di tipo tradizionale per i clienti che non svolgono attività professionali intestata a qualunque componente del nucleo familiare anagrafico.\r\n•    LINEA TELEFONICA AGGIUNTIVA: è una linea telefonica aggiuntiva di tipo tradizionale intestata al medesimo titolare della linea principale, attivata nella stessa o in altra abitazione.\r\n•    LINEA ISDN: è una linea telefonica principale che si differenzia dalla linea di tipo tradizionale in quanto include alcuni servizi telefonici specifici.\r\n•    LINEA PER TRAFFICO ENTRANTE: è una linea telefonica di tipo tradizionale aggiuntiva a una linea principale, che consente la sola ricezione delle chiamate.\r\n•    LINEA IN FIBRA OTTICA: è la nuova linea per telefonare e navigare in Internet grazie all’alta velocità della fibra ottica, connettere contemporaneamente e con prestazioni elevate Tablet, PC, Smartphone e TV con  più applicazioni e dispositivi, vedere video anche in alta definizione senza attese né interruzioni.\r\n\r\nConsulta online le varie offerte disponibili.\r\n'),
(12, 'Quanto costa attivare una linea telefonica di casa? ', 'Il contributo per l’attivazione di una nuova linea tradizionale è pari a 97,60€ (IVA inclusa), salvo eventuali promozioni in corso.\r\n\r\nCon un costo di abbonamento mensile di 29 € (IVA inclusa) hai la linea di casa con incluse tutte le chiamate illimitate verso fissi e cellulari nazionali (TUTTO VOCE). \r\nCon un costo di abbonamento mensile di 19 € (IVA inclusa) hai la linea di casa con chiamate valorizzate a consumo (VOCE).\r\n\r\nPer conoscere le condizioni economiche agevolate riservate a particolari categorie di clientela clicca qui.\r\n\r\nNella sezione Offerte seleziona quella di tuo interesse anche per chiamare e navigare in Internet con ADSL e Fibra, verifica tutte le condizioni previste ed eventuali promozioni in corso sui contributi di attivazione (può essere previsto anche un contributo per l’attivazione di specifiche Offerte).  \r\n\r\nInoltre se domicili la fattura della linea fissa sul c/c bancario/postale o su carta di credito non ti sarà addebitato l’importo dell’anticipo conversazioni. Clicca qui per conoscere i dettagli.\r\n\r\nSe richiedi l’attivazione di una nuova linea o un trasloco di linea già attiva, che necessita di un collegamento telefonico attraverso opere speciali, in aree classificate “Nuclei Abitati” e “Case Sparse” dovrai corrispondere a TIM oltre al contributo di attivazione anche un contributo supplementare a fondo perduto (secondo quanto previsto dalla Delibera AGCOM 385/11/CONS). Il costo del contributo supplementare è calcolato sulla base del Listino allegato alla Delibera AGCOM 136/14/CONS e ti verrà comunicato preventivamente per fornirci l’esplicita accettazione. \r\n\r\nIn caso di richieste singole è pari al 30% del costo complessivo di installazione del collegamento. In caso di richieste contestuali (ossia sopraggiunte entro la fine lavori) che interessano lo stesso percorso di rete, la percentuale di contributo a carico dei clienti – limitatamente alle sole parti comuni dell’impianto - è pari al 50% del costo dell’impianto calcolato sulla base del medesimo listino e delle modalità previste dalla Delibera AGCOM n. 385/11/CONS, da ripartire equamente tra tutti i clienti che hanno contestualmente richiesto l’allacciamento alla rete. Relativamente alle restanti parti dell’impianto specifiche per ciascuna utenza il contributo dovuto da ciascun cliente resta determinato nella percentuale del 30%.\r\nL’importo del Contributo a fondo perduto può essere pagato in un’unica soluzione o fino a 24 rate mensili.\r\n\r\nPer prendere visione delle relative Condizioni clicca qui.\r\n\r\nPer la realizzazione dei collegamenti in fibra ottica che esulino dai normali standard tecnici per difficoltà realizzative e/o in presenza di richieste specifiche del Cliente, TIM si riserva di stimare un eventuale contributo economico supplementare alle condizioni standard da sottoporre a preventiva accettazione da parte del cliente. '),
(13, 'Se attivo una linea in una seconda casa, quanto pago di abbonamento? ', 'Il costo dell’abbonamento della linea in una seconda casa o nella stessa casa è uguale a quello previsto per la linea principale (Offerta Voce) pari a 19 €/mese (IVA inclusa). '),
(14, 'Ho la linea telefonica di casa con un altro gestore ma vorrei rientrare in TIM, che cosa devo fare? ', 'Per rientrare in TIM con la linea fissa, senza nessun disservizio e senza la necessità di comunicare il recesso direttamente al tuo attuale Operatore, è possibile inserire online la richiesta che implica di conseguenza la cessazione del rapporto contrattuale con il tuo attuale Operatore.\r\nPer il buon esito della richiesta, è necessario reperire presso il tuo attuale operatore il Codice di Migrazione ossia una stringa alfa-numerica che serve per indicare correttamente la tua linea telefonica e per avviare le procedure di passaggio in TIM.\r\n(Per maggiori informazione sul codice di migrazione leggi la faq "Che cos''è il Codice di Migrazione").\r\n\r\nSe hai più numeri attivi associati ad un unico Codice di Migrazione dovranno essere riportati all''interno degli appositi campi. Il Codice di Migrazione è pubblicato nell’ultima fattura che hai ricevuto dal tuo attuale Operatore telefonico oppure lo potrai ottenere consultando il sito web o contattando il Call Center commerciale.\r\nIl Codice di Migrazione deve essere completo in ogni sua parte. Se in fattura trovi indicati due Codici di Migrazione, indicali entrambi. In caso contrario la procedura di passaggio non andrà a buon fine.\r\nIl passaggio in TIM avverrà con la tipologia di abbonamento al servizio telefonico da te scelto nella richiesta.\r\nDal momento in cui TIM riceverà la tua richiesta verranno immediatamente avviate tutte le procedure necessarie per la migrazione della linea telefonica verso TIM che ti contatterà se necessario per fissare un appuntamento per l’attivazione del servizio presso la tua abitazione.\r\nA meno di eventuali problemi tecnici che ne impediscano l’attivazione, il servizio scelto sarà attivato da TIM con lo stesso numero telefonico da te attualmente utilizzato. Dopo circa 20 giorni potrai quindi riprendere ad utilizzare i servizi di TIM.\r\nPuoi chiamare gratuitamente il Servizio Clienti linea fissa 187 per conoscere le modalità di passaggio in TIM alternative. '),
(15, 'Ho la linea telefonica di casa con TIM ma l’ADSL con un altro gestore e vorrei attivare il servizio ADSL con TIM. Cosa devo fare? ', 'E'' prevista la possibilità per i clienti di attivare un''offerta ADSL di TIM senza nessun disservizio e senza la necessità di comunicare il recesso direttamente al tuo attuale Operatore. Il passaggio del servizio ADSL a TIM non comporta alcun costo aggiuntivo oltre al pagamento dell''abbonamento mensile dell’offerta attivata. Per rientrare in TIM è possibile eseguire online la richiesta che implica di conseguenza la cessazione del rapporto contrattuale con il tuo attuale Operatore.\r\nPer il buon esito della richiesta, è necessario reperire presso il tuo attuale operatore che ti fornisce l’accesso ADSL il Codice di Migrazione. Questo codice è una stringa alfa-numerica che serve per indicare correttamente la linea telefonica e per avviare le procedure di passaggio.\r\n(Per maggiori informazione sul codice di migrazione leggi la faq "Che cos''è il Codice di Migrazione").\r\n\r\nSe hai più numeri attivi associati ad un unico Codice di Migrazione dovranno essere riportati all''interno degli appositi campi. Il Codice di Migrazione è pubblicato nell’ultima fattura che hai ricevuto dal tuo attuale Operatore telefonico oppure lo potrai ottenere consultando il sito web o contattando il Call Center commerciale.\r\n\r\nIl Codice di Migrazione è pubblicato nell’ultima fattura che hai ricevuto dal tuo attuale operatore telefonico con il quale hai servizio ADSL oppure lo potrai ottenere consultando il sito web o contattando il Call Center commerciale.\r\nIl Codice di Migrazione deve essere completo in ogni sua parte. Se in fattura trovi indicati due Codici di Migrazione, indicali entrambi. In caso contrario la procedura di passaggio non andrà a buon fine.\r\nDal momento in cui TIM riceverà la tua richiesta verranno immediatamente avviate tutte le procedure necessarie per la migrazione dell''ADSL verso TIM. TIM quindi procederà ad attivare l''offerta richiesta e, se necessario, ti contatterà per fissare un appuntamento per l’attivazione del servizio.\r\nA meno di eventuali problemi tecnici che ne impediscano l’attivazione, dopo circa 20 giorni potrai quindi utilizzare i servizi ADSL di TIM.\r\n\r\nL’eventuale esercizio del diritto di recesso (c.d. ripensamento) previsto dall’art. 52 e seguenti del D.lgs. 206/2005 (Codice del Consumo) dopo l’avvio del processo di passaggio in TIM, non garantisce il ripristino automatico della situazione contrattuale precedente.'),
(16, 'Che cosa è il Codice di Migrazione? ', 'È un codice alfa-numerico contenente tutti i dati che servono ad identificare correttamente la tua linea telefonica e il tuo attuale servizio ADSL (ove presente).\r\nIl Codice Migrazione è composto da:\r\n\r\n    Codice Segreto (CS) che è formato da 3 caratteri alfanumerici che contraddistinguono il tuo attuale Operatore telefonico.\r\n    Codice Risorsa (COR) che individua la risorsa da migrare. E’ una stringa alfanumerica formata da 12 caratteri al massimo, ma potrebbe essere anche più breve. Solitamente, questo campo corrisponde al numero di telefono.\r\n    Codice Servizio (COS) che individua il servizio attivo con il tuo attuale operatore.\r\n    Codice di controllo è  una lettera e serve per verificare la correttezza del Codice di Migrazione stesso.\r\n\r\nInsieme al Codice Migrazione, vengono fornire tutte le numerazioni telefoniche attive associate all’accesso.\r\nIl Codice Migrazione è un dato necessario per rientrare in TIM e deve essere completo in ogni sua parte. In caso contrario la procedura di passaggio non andrà a buon fine.\r\nIl Codice di Migrazione, il codice di controllo e le numerazioni associate sono pubblicati nell’ultima fattura che hai ricevuto dal tuo attuale operatore telefonico oppure li potrai ottenere consultando il sito web o contattando il Call Center commerciale.\r\nPer maggiori dettagli sulle modalità di contatto puoi rivolgerti al 187. '),
(17, 'Che cosa è il Codice Segreto? ', 'Il Codice Segreto è un codice alfanumerico assegnato ad ogni cliente, introdotto e disciplinato dalle delibere AGCom nn. 41/09/CIR - 52/09/CIR. Il Codice è stato istituito al fine di comprovare la volontà del cliente di passare ad altro operatore, riducendo i rischi di passaggi non richiesti. E’ composto da tre caratteri alfanumerici, selezionati in un set di 200 combinazioni possibili. Anche TIM ha assegnato a tutti i suoi clienti il Codice Segreto che, fornito contestualmente al numero di telefono e al Carattere di Controllo(*), dovrà essere portato a conoscenza dell’operatore telefonico alternativo nel momento in cui il cliente TIM recede dal contratto.\r\nIl Codice Segreto e il carattere di controllo sono visualizzati sulla fattura sia nella versione cartacea sia su "il mio conto" via Internet, che puoi trovare all’interno del sito tim.it nella sezione MyTIM Fisso a te riservata. Il Codice Segreto e il Carattere di Controllo si trovano nella prima pagina del riepilogo dei costi in alto a destra sotto il “Codice Fiscale” sotto la voce “Codice segreto”.\r\n\r\n(*) Il Carattere di Controllo è un carattere alfabetico calcolato automaticamente ed utilizzato per verificare l’esattezza della stringa Codice Segreto e numero di telefono.'),
(18, 'Come è composto il Codice Segreto? ', 'I primi 3 caratteri del Codice Segreto sono caratteri alfanumerici e randomici. TIM ha un set di 200 combinazioni possibili diverse tra loro che ha assegnato casualmente a tutti i suoi clienti. Segue poi il numero di telefono del cliente e quindi il carattere di controllo, che è un carattere alfabetico che viene calcolato automaticamente (attraverso un apposito algoritmo) e serve come controllo in fase di inserimento della richiesta nei sistemi. '),
(19, 'Dove posso trovare sul sito il mio Codice Segreto? ', ' Per visualizzare il tuo codice segreto, devi accedere alla sezione MyTIM Fisso (previa registrazione) e cliccare su “il mio conto” e successivamente scaricare il pdf dell’ultima fattura. '),
(20, 'Cosa puoi fare nella sezione MyTIM Mobile', 'Con MyTIM Mobile hai sempre a disposizione le informazioni su:\r\nCredito residuo (per le TIM Card Ricaricabili) o saldo del bimestre in corso non ancora fatturato (per gli abbonati);\r\nPiano tariffario e scadenza SIM (per le TIM Card Ricaricabili);\r\nAvanzamento del consumo del traffico incluso nelle tue offerte attive.\r\nDettaglio del traffico telefonico effettuato\r\nControllare i tuoi costi per essere sempre informato sul dettaglio della tua spesa telefonica;\r\nRicaricare il tuo credito residuo o quello di un’altra utenza (per le linee Ricaricabili);\r\n \r\nInoltre all’interno della sezione MyTIM Mobile potrai:\r\nVisualizzare le informazioni relative a tutte linee TIM a te intestate e associate tramite il servizio al servizio Associa Sim;\r\nAttivare le offerte selezionate da TIM appositamente per te;\r\nAttivare e gestire il servizio “TIM Ti Avvisa” per tenere sotto controllo le tue offerte attive;\r\nGestire i servizi attivi sulla tua linea.'),
(21, 'Cosa puoi fare nella sezione MyTIM Fisso', 'Con MyTIM Fisso hai la possibilità di:\r\nVisualizzare i tuoi dati anagrafici, con possibilità di effettuare online alcune richieste come modificare indirizzo email e password, il trasloco, il subentro ecc.;\r\nConsultare online e stampare le ultime 6 fatture e richiedere e visualizzare il traffico in chiaro;\r\nPagare la fattura con carta di credito o gestire la domiciliazione bancaria;\r\nModificare l’indirizzo di spedizione della tua fattura direttamente via web (se lo ricevi via posta ordinaria);\r\nControllare lo stato di avanzamento delle tue richieste commerciali, amministrative e tecniche;\r\nRecuperare la password che hai dimenticato.\r\n \r\nInoltre all’interno della sezione MyTIM Fisso, selezionando la voce «Richiedi assistenza tecnica" puoi:\r\nEseguire la diagnosi online della linea telefonica, ADSL o Fibra di casa, segnalare un problema ai tecnici o risolvere on line i problemi più comuni su internet, posta elettronica;\r\nEseguire la diagnosi sui servizi TV attivi (TIM SKY, IPTV) ed eventualmente segnalare un problema ai tecnici;\r\nEssere avvisato di eventuali disservizi sulla Rete Fissa TIM nella tua zona, e richiedere l’invio di un SMS o di una email alla risoluzione del guasto;\r\nGestire le tue Pratiche e monitorarne lo stato di lavorazione.\r\n '),
(22, 'Cos''è un eBook?', 'Un eBook è la versione elettronica di un libro stampato o stampabile, che può essere scaricato e letto su un PC, un Tablet o uno Smartphone. Un eBook offre un''esperienza di lettura molto simile al libro tradizionale e in più tutta la flessibilità e il potenziale offerto dai dispositivi digitali.'),
(23, 'Quali sono le dimensioni di un eBook / Quanto pesa un eBook?', 'Il libro elettronico non ha un peso fisico ma un peso in KB o MB che corrisponde allo spazio di memoria occupato dal file nel dispositivo lettore, variabile a seconda delle caratteristiche del libro (numero di pagine, presenza di immagini, multimedialità e altro). In media il peso varia tra i 100KB e i 2MB. '),
(24, 'Quali sono le differenze tra il quotidiano acquistabile in digitale e l''equivalente cartaceo? ', 'Il quotidiano digitale contiene le stesse informazioni della versione cartacea ed in molti casi è arricchito con contenuti multimediali quali ad esempio videogallery, fotogallery.Se sottoscrivi l''abbonamento digitale al quotidiano, hai inclusi, senza alcun costo supplementare, gli inserti e gli allegati eventualmente disponibili in edicola in abbinamento al quotidiano cartaceo. Potrai, inoltre, accedere a tutte le eventuali edizioni locali, scegliendo quella di tuo interesse e per alcune testate avrai anche accesso a contenuti esclusivi dell''offerta digitale (es. l''edizione RSera de la Repubblica). '),
(25, 'Quanti byte pesa un quotidiano digitale? ', 'Il peso in byte di un quotidiano varia ogni giorno e dipende dal numero di pagine e dei contenuti multimediali inclusi. Una copia pesa almeno 70-100 MB. Lo sfoglio del quotidiano avviene sia da PC che da Tablet e Smartphone sull’App della testata a cui ti sei abbonato e richiede perciò l''utilizzo della connettività dati, il cui costo dipende dal tuo profilo tariffario dati. Ti consigliamo, pertanto, di utilizzare un''offerta di navigazione dati flat o di scaricare il quotidiano in navigazione ADSL. '),
(26, 'Quali differenze ci sono tra il Magazine acquistabile in digitale e l''equivalente cartaceo? ', 'Non c''è nessuna differenza in quanto la versione digitale è identica alla versione cartacea.\r\nIl servizio consente di leggere in digitale il Magazine su PC e Tablet. '),
(27, 'Quanto pesa un Magazine digitale? ', '\r\n\r\nIl peso in byte di un Magazine varia in funzione del numero di pagine e della ricchezza grafica dei contenuti. Una copia pesa almeno 200-300 MB. Il download del Magazine sia su PC che Tablet richiede l''utilizzo della connettività dati, il cui costo dipende dal tuo profilo tariffario dati. Ti consigliamo, pertanto, di utilizzare un''offerta di navigazione dati flat o di scaricare le riviste in navigazione ADSL.\r\n<br/>\r\nTi ricordiamo che, solo se sei un Cliente TIM e se hai attiva un’offerta Internet, il traffico internet per il download dei magazine è incluso su Rete mobile TIM 3G/4G per apn wap.tim.it e ibox.tim.it e non erode il bundle dati compreso nell’offerta dati.\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `assistance_for`
--

CREATE TABLE IF NOT EXISTS `assistance_for` (
  `id_device` int(11) NOT NULL,
  `id_assistance` int(11) NOT NULL,
  `id_entry` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_entry`),
  KEY `id device` (`id_device`),
  KEY `id assistance` (`id_assistance`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=13 ;

--
-- Dumping data for table `assistance_for`
--

INSERT INTO `assistance_for` (`id_device`, `id_assistance`, `id_entry`) VALUES
(1, 1, 1),
(1, 2, 2),
(1, 4, 3),
(2, 1, 4),
(2, 2, 5),
(2, 4, 6),
(3, 1, 7),
(3, 2, 8),
(3, 4, 9),
(4, 1, 10),
(4, 2, 11),
(4, 4, 12);

-- --------------------------------------------------------

--
-- Table structure for table `assistance_to_faq`
--

CREATE TABLE IF NOT EXISTS `assistance_to_faq` (
  `id_assistance` int(11) NOT NULL,
  `id_FAQ` int(11) NOT NULL,
  `id_entry` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_entry`),
  KEY `id assistance` (`id_assistance`),
  KEY `id faq` (`id_FAQ`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=28 ;

--
-- Dumping data for table `assistance_to_faq`
--

INSERT INTO `assistance_to_faq` (`id_assistance`, `id_FAQ`, `id_entry`) VALUES
(3, 1, 1),
(3, 2, 2),
(3, 3, 3),
(3, 4, 4),
(3, 5, 5),
(3, 6, 6),
(3, 7, 7),
(3, 8, 8),
(3, 9, 9),
(5, 10, 10),
(5, 11, 11),
(5, 12, 12),
(5, 13, 13),
(5, 14, 14),
(5, 15, 15),
(5, 16, 16),
(5, 17, 17),
(5, 18, 18),
(5, 19, 19),
(6, 20, 20),
(6, 21, 21),
(8, 22, 22),
(8, 23, 23),
(8, 24, 24),
(8, 25, 25),
(8, 26, 26),
(8, 27, 27);

-- --------------------------------------------------------

--
-- Table structure for table `available_sl_service`
--

CREATE TABLE IF NOT EXISTS `available_sl_service` (
  `id_device` int(11) NOT NULL,
  `id_sl` int(11) NOT NULL,
  `id_entry` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_entry`),
  KEY `id device` (`id_device`),
  KEY `id smart life` (`id_sl`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=7 ;

--
-- Dumping data for table `available_sl_service`
--

INSERT INTO `available_sl_service` (`id_device`, `id_sl`, `id_entry`) VALUES
(1, 1, 1),
(4, 1, 2),
(5, 5, 3),
(1, 2, 4),
(1, 3, 5),
(7, 6, 6);

-- --------------------------------------------------------

--
-- Table structure for table `content_images`
--

CREATE TABLE IF NOT EXISTS `content_images` (
  `id_entry` int(255) NOT NULL AUTO_INCREMENT,
  `content` varchar(512) COLLATE utf8_bin NOT NULL,
  `url` varchar(512) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_entry`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=50 ;

--
-- Dumping data for table `content_images`
--

INSERT INTO `content_images` (`id_entry`, `content`, `url`) VALUES
(2, 'LG K8', 'lg-k8-4g-indigoblue-01.png'),
(3, 'Samsung GALAXY A5 (2016)', 'GALAXY_A5_black_03.png'),
(4, 'Apple iPhone 5s 16GB', 'iphone-5s-silver-2.png'),
(5, 'D-Link SmartHome Starter Kit', 'd-link smart home.png'),
(6, 'Philips Friends of Hue Bloom', 'philips.png'),
(7, 'Pack TIMvision e Chromecast', 'CHROMECAST-1.png'),
(8, 'Casa e Famiglia', 'casa.png'),
(9, 'Controllo costi e pagamenti', 'controllo costi.png'),
(10, 'Gestione linea e servizi', 'gestione linea.png'),
(11, 'Modem e Networking', 'modem.png'),
(12, 'Outlet', 'outlet.png'),
(13, 'Salute e Benessere', 'salute.png'),
(14, 'Servizi alla persona', 'servizi pers.png'),
(15, 'Smart Life', 'smart life assistenza.png'),
(16, 'Smartphone e telefoni', 'telephone.png'),
(17, 'Supporto tecnico e configurazione', 'assistenza.png'),
(18, 'TV e Entertainment', 'tv enter.png'),
(19, 'Tablet e Computer', 'pc.png'),
(20, 'Tv e Smart Living', 'tv.png'),
(21, 'Apple iPhone 6s 16GB', 'apple-iPhone6s_Gld-1.jpg'),
(22, 'Apple iPhone 6s 16GB', 'apple-iPhone6s_Gld-3.jpg'),
(23, 'Apple iPhone 6s 16GB', 'apple-iPhone6s_Gld-4.jpg'),
(24, 'Apple iPhone 6s 16GB', 'apple-iPhone6s_Gld-2.jpg'),
(25, 'Samsung GALAXY A5 (2016)', 'GALAXY_A5_black_01_0.jpg'),
(26, 'Samsung GALAXY A5 (2016)', 'GALAXY_A5_black_02.jpg'),
(27, 'Apple iPhone 5s 16GB', 'iphone-5s-silver-1.jpg'),
(28, 'LG K8', 'lg-k8-4g-indigoblue-02.jpg'),
(29, 'LG K8', 'lg-k8-4g-indigoblue-03.jpg'),
(30, 'Tutti i dispositivi', 'device2.png'),
(31, 'Tutti i servizi Smart Life', 'SL.png'),
(32, 'Tutti i servizi di Assistenza', 'assistenza.png'),
(33, 'Fidelity Card', 'fidelity_card.png'),
(34, 'Pagamenti', 'pagamenti.png'),
(35, 'Samsung Galaxy TabPro S 12', 'galaxytabpros12-1.jpg'),
(36, 'Samsung Galaxy TabPro S 12', 'galaxytabpros12-2.jpg'),
(37, 'Samsung Galaxy TabPro S 12', 'galaxytabpros12-3.jpg'),
(38, 'Samsung Gear Fit', 'samsung-gear-fit-1.jpg'),
(39, 'Samsung Gear Fit', 'samsung-gear-fit-2.jpg'),
(40, 'Samsung Gear Fit', 'samsung-gear-fit-4.jpg'),
(41, 'Tim Tag', 'tim_Tag.png'),
(42, 'Tim Home Connect', 'timcasa-zoom_2.png'),
(43, 'Trasporti', 'trasporti.jpg'),
(44, 'TIM SKY', 'modem-sez-3.jpg'),
(45, 'DISPOSITIVI', 'all_devices.jpg'),
(46, 'SMART LIFE', 'cover.jpg'),
(47, 'ASSISTENZA', 'assistance.jpg'),
(48, 'WellUp', 'wellup.jpg'),
(49, 'PROMOZIONI', 'promocover.png');

-- --------------------------------------------------------

--
-- Table structure for table `device`
--

CREATE TABLE IF NOT EXISTS `device` (
  `id_device` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `description` text COLLATE utf8_bin NOT NULL,
  `characteristics` text COLLATE utf8_bin NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_device`),
  UNIQUE KEY `device name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=32423434 ;

--
-- Dumping data for table `device`
--

INSERT INTO `device` (`id_device`, `name`, `description`, `characteristics`, `price`) VALUES
(1, 'Apple iPhone 6s 16GB', 'Inizi a usare iPhone 6s e ti rendi subito conto che non hai mai provato niente del genere. Con il 3D Touch ti basta premere una volta sul display perché si aprano tante nuove possibilità. Live Photos dà più vita ai tuoi ricordi. E questo è solo l’inizio. Continua a usare il tuo iPhone 6s e scoprirai tutte le innovazioni che racchiude, a ogni livello.<br/>', '- 4GPLUS <br/>\n- Display Retina HD da 4,7"(diagonale) con risoluzione di 1334x750 px <br/>\n- 3D Touch <br/>\n- Chip A9 con coprocessore di movimento M9 integrato, con architettura a 64 bit di livello desktop <br/>\n- Fotocamera iSight da 12 megapixel con Focus Pixels <br/> - True Tone Flash e Live Photos <br/>\n- Elegante guscio unibody<br/>\n- Batteria a lunga durata<br/>\n<br/>\n<b>iOS 9 e iCloud</b> <br/>\niOS 9 è il sistema operativo mobile più evoluto, intelligente e sicuro al mondo. E con le nuove app incluse, insieme alle novità che trovi in Siri e in tante altre funzioni, adesso è ancora più geniale e indispensabile. Grazie alla profonda integrazione con l’hardware Apple tutto procede a meraviglia, e sull’App Store trovi tante altre fantastiche app create apposta per sfruttare tutte le capacità di iPhone.\n<br/>\n<b>Touch ID</b><br/>\nLa tecnologia Touch ID utilizza un sensore di impronte digitali estremamente evoluto, e ora più veloce e preciso che mai. Così puoi sbloccare il telefono in modo semplice e sicuro.', 789.90),
(2, 'LG K8', 'Per te che vuoi essere sempre sulla cresta dell''onda e avere tutta la tua vita nel palmo della tua mano, LG K8 4G è la scelta ideale. Con il suo design curato, le funzioni all''avanguardia e l''ultima versione di Android, avrai uno smartphone che ti consente di andare oltre le convenzioni.<br/>', '<b>SCEGLI IL TUO STILE</b> <br/>\r\n\r\nLa nuova serie K di LG ti offre una gamma di smartphone che rispecchiano la tua personalità. LG K8 ti accompagna nei tuoi viaggi e ti sorprenderà con selfie dettagliati tutti da condividere con la velocità della rete 4G LTE\r\n<br/>\r\n<b>DESIGN CON VETRO SMUSSATO</b> <br/>\r\n\r\nDatti un tono! LG K8 ha un design che lascia a bocca aperta grazie al profilo del vetro smussato e alla forma arrotondata. In più è più ergonomico e garantisce una presa più salda grazie alla lavorazione della cover posteriore.\r\n<br/>\r\n<b>FOTOCAMERA E FLASH VIRTUALE</b><br/>\r\n\r\nCattura i le situazioni più divertenti della giornata con la fotocamera da 8 Megapixel. E'' sufficiente un tocco sul display e K8 mette a fuoco e scatta immediatamente. Anche per i selfie puoi contare sulla fotocamera frontale da 5 Megapixel con la funzione flash virtuale che illumina il tuo volto, così i tuoi selfie saranno illuminati come si deve, mentre tutti gli altri... scatteranno selfie scuri!\r\n<br/>\r\n<b>DISPLAY DA 5"</b><br/>\r\n\r\nGuarda le tue foto e i tuoi video sul display ampio da ben 5".\r\n\r\n- 4G LTE / NFC<br/>\r\n- Sistema Operativo Android 6<br/>\r\n- Display 5”<br/>\r\n- Processore QuadCore 1.3 GHz<br/>', 179.90),
(3, 'Samsung GALAXY A5 (2016)', 'Samsung Galaxy A5 2016 è uno smartphone Android avanzato e completo sotto tutti i punti di vista con alcune eccellenze. Dispone di un grande display da 5.2 pollici e di una risoluzione da 1920x1080 pixel che è la più elevata attualmente in circolazione. Le funzionalità offerte da questo Samsung Galaxy A5 2016 sono veramente tante e all''avanguardia. A cominciare dal modulo LTE 4G che permette un trasferimento dati e una navigazione in internet eccellente.<br/> \nDi tutto rispetto la fotocamera da 13 megapixel che permette al Samsung Galaxy A5 2016 di scattare foto con una risoluzione di 4128x3096 pixel e di registrare video in alta definizione alla risoluzione di 1920x1080 pixel. Lo spessore di 7.3mm è veramente contenuto e rende questo Samsung Galaxy A5 2016 ancora più spettacolare. <br/> ', '<b>Un mix perfetto tra vetro e metallo</b><br/>\n\nLa combinazione tra metallo e Gorilla Glass rendono il nuovo Galaxy A5 2016 accattivante e alla moda. Goditi una presa ancora più sicura e confortevole accompagnata da un design snello e una cornice ancora più sottile.\n<br/>\n<b>Maggiore potenza</b><br/>\n\nSperimenta le straordinarie prestazioni dell''hardware e la velocità di navigazione ultrarapida. Il processore Octa Core l''accesso alla rete 4G/LTE e la RAM da 2GB assicurano un caricamento perfetto delle pagine Internet, una transizione impeccabile dell''interfaccia utente e un multi-tasking ancora più rapido\n<br/>\n<b>Immagini più nitide e luminose</b><br/>\n\nLe fotocamere anteriore e posteriore sono dotate di apertura f/1.9 per offrire immagini straordinariamente chiare, anche in condizioni di scarsa illuminazione. Grazie allo stabilizzatore ottico di immagine (OIS) potrai scattare immagini e realizzare video senza sfocature. Infine, dopo aver cliccato due volte il pulsante Home in pochi secondi sarai pronto a catturare i momenti più importanti.', 429.90),
(4, 'Apple iPhone 5s 16GB', 'Chip A7 con architettura a 64 bit, sensore di impronte digitali Touch ID,nuova fotocamera iSight da 8 megapixel e nuova videocamera FaceTime HD,reti 4G LTE1 ultraveloci, iOS 8 e iCloud: iPhone 5s è davvero all’avanguardia. <br/> Eppure è sottile e leggero come sempre.', '<p>Un chip con architettura a 64 bit. Un sensore di identità a impronte digitali. Una fotocamera migliore e più veloce. E un sistema operativo realizzato appositamente per i 64 bit. Uno smartphone con anche soltanto una di queste funzioni sarebbe già all’avanguardia. Uno smartphone con tutte queste funzioni è un iPhone che segna una nuova era.</p>\n<p>iPhone 5s è precisione estrema fino al singolo micron. E lo dimostra in tutto. Lo splendido guscio in alluminio. L’elegante lucentezza di metallo e vetro. Il cristallo di zaffiro nel tasto Home, e altro zaffiro a protezione della fotocamera iSight. Un’attenzione al design e ai processi costruttivi che non ha eguali. Non poteva che nascerne un iPhone 5s incredibilmente sottile e leggero.</p>\n<p>Quante volte al giorno controlli il tuo iPhone? Decine e decine, forse anche di più. E inserire ogni volta il codice di accesso ti fa perdere del tempo. Eppure lo fai, per essere sicuro che nessun altro possa usare il tuo iPhone. Ma con iPhone 5s, utilizzare il tuo telefono è più veloce, facile e anche un po’ futuristico. Perché adesso c’è Touch ID, il nuovo sensore di identità a impronte digitali.</p>\n<p>Metti il dito sul tasto Home, e l’iPhone si sblocca: non serve altro. È un modo estremamente comodo e sicuro per accedere al tuo telefono. Con la tua impronta autorizzi anche gli acquisti su iTunes Store, App Store e iBooks Store, senza dover inserire la password. E il Touch ID è in grado di leggere a 360°, perciò non importa se tieni l’iPhone in orizzontale, in verticale o come capita: riconosce comunque la tua impronta e capisce chi sei. E dato che con Touch ID puoi registrare più impronte, riconoscerà anche quelle delle persone di cui ti fidi.</p>\n\n<p>C’è la velocità. E poi c’è la velocità del nuovo chip A7, che rende CPU e grafica fino a due volte più reattive rispetto al chip A6. Ancora più strabiliante è che il chip A7 trasforma iPhone 5s nel primo smartphone a 64 bit al mondo: vale a dire un’architettura di livello desktop in un telefono supersottile. In più, iOS 7 è stato progettato appositamente per i 64 bit, quindi sfrutta al massimo le performance del chip A7.</p>\n<p>Il chip A7 supporta OpenGL ES v3.0 per offrirti la grafica superdettagliata e gli effetti visivi evoluti che fino a oggi trovavi solo su Mac, PC e console per videogiochi. La differenza è sbalorditiva. Pensa per esempio ai mondi immaginari di certi giochi. Ombreggiature e texture più vere. I raggi del sole che si riflettono sull’acqua. Vivrai un’esperienza di gioco di puro realismo.</p>\n<p>iOS 7 e le app incluse nell’iPhone sono ottimizzati per il chip A7. L’app Fotocamera ne è un perfetto esempio: sfruttando il nuovo processore ISP integrato nel chip A7, arriva a offrirti un autofocus 2 volte più veloce, scatti più rapidi, e video con frame rate superiori.1 E non pensare che la batteria ne risenta, perché il chip A7 è progettato per un’efficienza energetica incredibile.</p>\n<p>Il nuovo coprocessore M7 è la spalla ideale del chip A7. È progettato appositamente per misurare i dati sui movimenti raccolti da accelerometro, giroscopio e bussola. Un compito che spetterebbe al chip A7, ma l’M7 è molto più efficiente. Così le app per il fitness che registrano l’attività fisica accedono ai dati dal coprocessore M7 senza impegnare costantemente il chip A7. Perciò incidono molto meno sul consumo della batteria.</p>\n<p>Il coprocessore M7 sa se stai camminando, correndo, o perfino guidando. Mappe è un buon esempio: quando parcheggi, il navigatore passa automaticamente dalle indicazioni di guida a quelle sui percorsi pedonali.\n				    	\n					</p>', 479.90),
(5, 'D-Link SmartHome Starter Kit', 'Con lo Smart Home HD Starter Kit potrai impostare, controllare, monitorare e automatizzare la tua casa ovunque ti trovi.\nNel Kit sono inclusi:<br/>\n\nUn Monitor HD (DCS-935L) \nUn Wi-Fi Motion Sensor (DCH-S150)\nUna smart plug (DSP-W215) \nTramite l''App mydlink Home per smartphone e tablet hai a disposizione il controllo di tutti i dispositivi così da semplificarti la gestione della casa rendendola più sicura e intelligente.\n<br/>\nFacile configurazione e gestione dei tuoi dispositivi\n<br/>\nBasta semplicemente scaricare l’app mydlink Home e la configurazione guidata ti aiuterà a utilizzare al meglio tutti i dispositivi presenti nel kit in modo facile e intuitivo.\nCon l’app potrai creare tu stesso le regole per accendere e spegnere i tuoi elettrodomestici quando e ovunque vuoi. \n<br/>\nNotifiche automatiche e real time sul tuo smartphone\n<br/>\nL’app mydlink Home ti notificherà quando:<br/>\n-Un movimento o un suono viene rilevato<br/>\n-Un dispositivo è stato acceso o spento<br/>\n-Il consumo elettrico è stato superato<br/>\n-Un dispositivo non funziona correttamente o si surriscalda<br/>\n-Il sensore di movimento a infrarossi passivo riduce di gran lunga i falsi allarmi, garantendoti di essere avvisato solo quando necessario: rilevazione dei movimenti fino a 8 metri (100° orizzontale, 80° verticale).', 'Questo geniale piccolo starter kit ti offre la possibilità di impostare, controllare, monitorare e automatizzare la tua casa ovunque ti trovi. Lo starter kit Smart Home HD include una smart plug (DSP-W215), un Wi-Fi Motion Sensor (DCH-S150) e un Monitor. I dispositivi, comunicanti tra loro, attraverso l''app per smartphone e tablet mydlink Home, saranno a tua disposizione per qualsiasi utilizzo. Questi geniali dispositivi, una volta applicati, ti semplificheranno la vita rendendola più sicura, e tu godrai di una maggiore tranquillità. Si tratta della tecnologia domotica al livello più avveniristico.<br/>\n<b>Facile configurazione</b><br/>\nBasta semplicemente scaricare la app mydlink Home e la configurazione guidata ti aiuterà a far funzionare tutti i dispositivi presenti nel kit.<br/>\nIl pratico starter kit mydlink Home ti offre la possibilità di cominciare per poi aggiungere altri dispositivi quando lo vorrai. L''app1 mydlink Home1 per smartphone e tablet iOS e Android offre il controllo completo di tutti i dispositivi di domotica mydlink Home. Puoi persino configurare le regole di automazione per rendere la tua casa ancora più intelligente.<br/>\n\nCosa può fare Hue per te?<br/>\n\nAl mattino...<br/>\n\nUsa l''opzione timer e trasforma Hue nella tua sveglia mattutina. Imposta le luci in modo che si illuminino gradualmente per un risveglio più naturale. Ricrea con Hue la tua alba personale.<br/>\n\nBenvenuto a casa...<br/>\n\nSe lavori fino a tardi o passi la serata fuori, puoi accendere e spegnere le luci in remoto in modalità wireless. Darai così l''impressione di essere a casa anche quando non ci sei. Puoi anche impostare le luci in modo che si accendano a un''ora prestabilita, una soluzione perfetta per quando sei in vacanza ma vuoi dare l''impressione che a casa ci sia qualcuno oppure per non rincasare mai più al buio dopo il lavoro.<br/>\n\nRivivi un momento che ti è caro...<br/>\n\nCon Hue qualsiasi foto del tuo smartphone diventa una tavolozza per colorare di luce la tua casa permettendoti di rivivere i momenti di una vacanza memorabile o di cogliere tutta l''atmosfera di una giornata estiva. Trascina il cursore sulla foto per selezionare un colore nell''immagine: la lampadina wireless selezionata riprodurrà immediatamente la tonalità scelta. Quando sei soddisfatto del risultato, salva l''ambientazione per poterla rivivere ancora.<br/>', 159.90),
(6, 'Philips Friends of Hue Bloom', 'Colora il tuo mondo di luce, che siano i colori luminosi del giorno o le sfumature dorate dell''autunno, lo starter kit Philips Friends of hue Bloom bianco ti consente di creare l''illuminazione che desideri tramite smartphone o altri dispositivi.', 'Philips Hue è il sistema di illuminazione LED più innovativo al mondo grazie alla connettività con Smartphone e Tablet. Attraverso la App avrai la possibilità di creare una luce personalizzata nelle diverse aree della tua casa ed in linea con lo stile di vita della tua famiglia.<br/>\n\nScopri tutte le nuance del bianco, dal bianco freddo energizzante al bianco caldo rilassante oppure gioca con la luce colorata per creare la tua atmosfera preferita. Hue può svegliarti, aiutarti a proteggere la casa, fare rivivere i tuoi ricordi preferiti, perfino migliorare il tuo umore. È sorprendente, intelligente, fatto apposta per te.<br/>\n\n', 179.95),
(7, 'Pack TIMvision e Chromecast', 'Con Chromecast porti TIMvision, i tuoi video, le foto e molto altro ancora su qualsiasi TV usando semplicemente uno smartphone o il tablet ed una connessione Internet Wi-Fi, tutto senza consumare GB.<br/>\n\nCon l’App TIMvision potrai vedere cartoni, cinema, serie TV, documentari sempre on demand. Creare il tuo palinsesto senza interruzioni pubblicitarie ed avere più di 8.000 titoli disponibili in un solo abbonamento mensile ed il programma inizia quando vuoi tu sulla TV di casa.<br/>\n\nNon devi fare altro che utilizzare il tuo smartphone, il tablet come un telecomando per riprodurre contenuti direttamente sulla tua TV, mettere in pausa e regolare il volume.\n<br/>\nSe sei cliente TIM, puoi acquistare il Pack TIMvision e Chromecast anche presso un Negozio TIM, hai TIMvision sempre incluso per i primi 3 mesi.\n<br/>\nChromecast è un dispositivo di streaming multimediale che, una volta inserito in una qualsiasi porta HDMI, ti permette di trasmettere i contenuti preferiti direttamente sullo schermo della TV di casa. È piccolo, leggero, economico, facile da installare ed ancora più semplice da usare.\n<br/>\nPuoi trasmettere le pagine di un sito web dal browser Chrome\no riprodurre i contenuti visualizzati sul tuo smartphone o tablet\ndirettamente sulla TV. Puoi riprodurre tutti i contenuti che trovi online.', 'Un modo facile per trasmettere video, musica e giochi alla TV\nIl tuo telefono diventa un telecomando semplice ma funzionale. Apri le tue app per dispositivi mobili preferite per accedere velocemente ai tuoi contenuti, quali programmi TV, playlist. Non occorre eseguire altri accessi o download. Tocca il pulsante Trasmetti per guardare i tuoi contenuti preferiti sullo schermo di casa. Con il tuo telefono è facile cercare, consultare, mettere in coda i contenuti e controllare la TV da qualsiasi stanza di casa tua. Nel frattempo puoi continuare a utilizzare il telefono per altre attività, senza interrompere la riproduzione e senza consumare la batteria.   ', 39.00),
(8, 'Samsung Galaxy TabPro S 12', 'Galaxy TabPro S è il nuovo tablet componibile di samsung, con sistema operativo windows 10. Ideale per lavorare in mobilità senza fare compromessi.', '<b>DESIGN SOTTILE E LEGGERO</b><br/>\n\nGalaxy TabPro S rappresenta il perfetto connubio tra design e tecnologia. <br/>Estremamente sottile e leggero, stupisce per la ricercatezza dei dettagli e la qualità dei materiali.<br/>\n\n<b>ELEGANTE PROTEZIONE</b><br/>\n\nLa book cover protegge perfettamente Galaxy TabPro S, mantenendone intatta l''eleganza.<br/>\n\n<b>DISPLAY SUPER AMOLED</b><br/>\n\nGalaxy TabPro S è il primo prodotto Windows 10 al mondo dotato di display SUPER AMOLED. Lavorare in mobilità è davvero comodo, grazie al display touchscreen da 12 pollici.<br/> Indipendentemente dal contenuto visualizzato, che sia una immagine o un video, i colori e la brillantezza delle immagini saranno esaltate dalla definizione e dalla qualità del display SUPER AMOLED di Galaxy TabPro S. <br/>\n\n<b>INTRATTENIMENTO XBOX ONE GAME STREAMING</b><br/>\n\nCon questa rivoluzionaria funzione, utilizzando la stessa connessione WiFi, potrai giocare in streaming ai giochi della tua XBOX ONE direttamente su Galaxy TabPro S.<br/>\n\n<b>PERFORMANCE SENZA COMPROMESSI</b><br/>\n\nIl sistema operativo Windows 10, supportato dalla potenza del nuovo processore Intel Core M, sono una garanzia per lavorare professionalmente in qualunque situazione e in qualsiasi momento.<br/>\n\n<b>2-IN-1</b><br/>\n\nNessun compromesso: potente come un PC e portatile come un tablet. Galaxy TabPro S è perfetto in qualunque situazione.<br/>\n\n<b>DURATA BATTERIA E RICARICA</b><br/>\n\nLa batteria a lunga durata di Galaxy TabPro S permette di focalizzarsi solamente sulle proprie attività. <br/>Completamente carico in sole due ore e mezza, consente un uso continuativo di oltre 10 ore', 1299.90),
(9, 'Samsung Gear Fit', 'L''innovativo schermo curvo da 1,84’’ Super AMOLED Touch Screen e i cinturini intercambiabili di Samsung Gear Fit ti rendono cool e a alla moda anche quando ti alleni. Ti offre inoltre una varietà di colori, sfondi e tipologie di orologio che puoi scegliere secondo le tue preferenze. Così puoi personalizzare il tuo look ogni giorno!<br/><br/>\n\nCon Samsung Gear Fit ricevi subito notifiche di Email, SMS, chiamate in arrivo e app così non perdi una notifica per essere sempre in contatto con il tuo mondo. Ma c’è di più, fallo diventare Il tuo Personal Trainer quotidiano! Grazie infatti al sensore di frequenza cardiaca, in modalità allenamento, questo dispositivo ti supporta in tempo reale e ti dà suggerimenti che ti servono durante l''attività fisica per raggiungere i tuoi obiettivi.<br/><br/>\n', '\nTiene sempre traccia delle attività durante la giornata ed è sempre pronto ad accompagnarti grazie al suo design innovativo, confortevole ed ultraleggero (solo 27 gr.) ed in più resistente all’acqua ed alla polvere.<br/>\nSamsung Gear Fit è compatibile con una serie di dispositivi:<br/>\nGALAXY S5 – GALAXY Note 3/Note II – GALAXY S4/S4 Active/S4 Zoom/S4 mini – GALAXY Note II<br/>\n(il numero di dispositivi  compatibili potrebbe aumentare ulteriormente).', 79.90);

-- --------------------------------------------------------

--
-- Table structure for table `device_categories_content`
--

CREATE TABLE IF NOT EXISTS `device_categories_content` (
  `device_category` varchar(255) COLLATE utf8_bin NOT NULL,
  `content` varchar(255) COLLATE utf8_bin NOT NULL,
  `id_entry` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_entry`),
  KEY `device category` (`device_category`),
  KEY `content name` (`content`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=12 ;

--
-- Dumping data for table `device_categories_content`
--

INSERT INTO `device_categories_content` (`device_category`, `content`, `id_entry`) VALUES
('Smartphone e telefoni', 'Apple iPhone 5s 16GB', 1),
('Smartphone e telefoni', 'Samsung GALAXY A5 (2016)', 2),
('Smartphone e telefoni', 'LG K8', 3),
('Smartphone e telefoni', 'Apple iPhone 6s 16GB', 4),
('Tv e Smart Living', 'Pack TIMvision e Chromecast', 5),
('Modem e Networking', 'Philips Friends of Hue Bloom', 6),
('Modem e Networking', 'D-Link SmartHome Starter Kit', 7),
('Tablet e Computer', 'Samsung Galaxy TabPro S 12', 8),
('Outlet', 'Samsung Gear Fit', 11);

-- --------------------------------------------------------

--
-- Table structure for table `device_to_promo`
--

CREATE TABLE IF NOT EXISTS `device_to_promo` (
  `id_device` int(11) NOT NULL,
  `id_promo` int(11) NOT NULL,
  `id_entry` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_entry`),
  KEY `id promo` (`id_promo`),
  KEY `id device` (`id_device`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=4 ;

--
-- Dumping data for table `device_to_promo`
--

INSERT INTO `device_to_promo` (`id_device`, `id_promo`, `id_entry`) VALUES
(1, 1, 1),
(4, 2, 2),
(5, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `device_to_spec`
--

CREATE TABLE IF NOT EXISTS `device_to_spec` (
  `id_device` int(11) NOT NULL,
  `id_spec` int(11) NOT NULL,
  `id_entry` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_entry`),
  KEY `id_device` (`id_device`),
  KEY `id_specification` (`id_spec`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=105 ;

--
-- Dumping data for table `device_to_spec`
--

INSERT INTO `device_to_spec` (`id_device`, `id_spec`, `id_entry`) VALUES
(1, 1, 1),
(1, 2, 2),
(1, 3, 3),
(1, 4, 4),
(1, 5, 5),
(1, 6, 6),
(1, 7, 7),
(1, 8, 8),
(1, 9, 9),
(2, 10, 10),
(2, 11, 11),
(2, 12, 12),
(2, 13, 13),
(2, 14, 14),
(2, 15, 15),
(2, 16, 16),
(2, 17, 17),
(2, 18, 18),
(2, 19, 19),
(2, 20, 20),
(2, 21, 21),
(2, 22, 22),
(2, 23, 23),
(3, 24, 24),
(3, 25, 25),
(3, 26, 26),
(3, 27, 27),
(3, 28, 28),
(3, 29, 29),
(3, 29, 30),
(3, 26, 31),
(3, 27, 32),
(3, 28, 33),
(3, 29, 34),
(3, 30, 35),
(3, 31, 36),
(3, 32, 37),
(4, 33, 38),
(4, 34, 39),
(4, 35, 40),
(4, 36, 41),
(4, 37, 42),
(4, 38, 43),
(4, 39, 44),
(4, 40, 45),
(4, 41, 46),
(5, 44, 49),
(5, 45, 50),
(5, 46, 51),
(6, 47, 52),
(6, 48, 53),
(6, 49, 54),
(6, 50, 55),
(6, 51, 56),
(6, 52, 57),
(6, 53, 58),
(6, 54, 59),
(6, 55, 60),
(6, 56, 61),
(6, 57, 62),
(6, 58, 63),
(6, 59, 64),
(6, 60, 65),
(6, 61, 66),
(6, 62, 67),
(6, 63, 68),
(6, 64, 69),
(6, 65, 70),
(6, 66, 71),
(6, 67, 72),
(6, 68, 73),
(6, 69, 74),
(6, 70, 75),
(7, 71, 76),
(7, 72, 77),
(7, 73, 78),
(7, 74, 79),
(7, 75, 80),
(7, 76, 81),
(7, 77, 82),
(7, 78, 83),
(7, 79, 84),
(8, 81, 86),
(8, 82, 87),
(8, 83, 88),
(8, 84, 89),
(8, 85, 90),
(8, 86, 91),
(8, 87, 92),
(8, 88, 93),
(8, 89, 94),
(8, 90, 95),
(8, 91, 96),
(9, 92, 97),
(9, 93, 98),
(9, 94, 99),
(9, 95, 100),
(9, 96, 101),
(9, 97, 102),
(9, 98, 103),
(9, 99, 104);

-- --------------------------------------------------------

--
-- Table structure for table `for_device_1`
--

CREATE TABLE IF NOT EXISTS `for_device_1` (
  `id_sl` int(11) NOT NULL,
  `id_device` int(11) NOT NULL,
  `id_entry` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_entry`),
  KEY `id sl` (`id_sl`),
  KEY `id device` (`id_device`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=4 ;

--
-- Dumping data for table `for_device_1`
--

INSERT INTO `for_device_1` (`id_sl`, `id_device`, `id_entry`) VALUES
(4, 5, 1),
(4, 6, 2),
(2, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `for_device_2`
--

CREATE TABLE IF NOT EXISTS `for_device_2` (
  `id_assistance` int(11) NOT NULL,
  `id_device` int(11) NOT NULL,
  `id_entry` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_entry`),
  KEY `id device` (`id_device`),
  KEY `id assistance` (`id_assistance`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=13 ;

--
-- Dumping data for table `for_device_2`
--

INSERT INTO `for_device_2` (`id_assistance`, `id_device`, `id_entry`) VALUES
(1, 1, 1),
(1, 2, 2),
(1, 3, 3),
(1, 4, 4),
(2, 1, 5),
(2, 2, 6),
(2, 3, 7),
(2, 4, 8),
(4, 1, 9),
(4, 2, 10),
(4, 3, 11),
(4, 4, 12);

-- --------------------------------------------------------

--
-- Table structure for table `high_level_categories`
--

CREATE TABLE IF NOT EXISTS `high_level_categories` (
  `macro_group` varchar(255) COLLATE utf8_bin NOT NULL,
  `category` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `high_level_categories`
--

INSERT INTO `high_level_categories` (`macro_group`, `category`) VALUES
('SMART LIFE', 'Casa e Famiglia'),
('ASSISTENZA', 'Controllo costi e pagamenti'),
('ASSISTENZA', 'Gestione linea e servizi'),
('DISPOSITIVI', 'Modem e Networking'),
('DISPOSITIVI', 'Outlet'),
('SMART LIFE', 'Salute e Benessere'),
('SMART LIFE', 'Servizi alla persona'),
('ASSISTENZA', 'Smart Life'),
('DISPOSITIVI', 'Smartphone e telefoni'),
('ASSISTENZA', 'Supporto tecnico e configurazione'),
('SMART LIFE', 'TV e Entertainment'),
('DISPOSITIVI', 'Tablet e Computer'),
('DISPOSITIVI', 'Tutti i dispositivi'),
('SMART LIFE', 'Tutti i servizi Smart Life'),
('ASSISTENZA', 'Tutti i servizi di Assistenza'),
('DISPOSITIVI', 'Tv e Smart Living');

-- --------------------------------------------------------

--
-- Table structure for table `promotion`
--

CREATE TABLE IF NOT EXISTS `promotion` (
  `id_promo` int(11) NOT NULL,
  `new_price` decimal(10,2) DEFAULT NULL,
  `payment_instalments` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `other_promo` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id_promo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `promotion`
--

INSERT INTO `promotion` (`id_promo`, `new_price`, `payment_instalments`, `other_promo`) VALUES
(1, NULL, 'in 36 rate senza interessi\n21,94 €/mese (se hai una linea di casa TIM)', '- 22GB gratis per 30 giorni Internet 4G LTE<br/>\n- TIM Card con 5 euro di traffico prepagato incluso<br/>\n- TIM Cloud - fino a 10 GB di spazio GRATIS e 1000 MMS inclusi<br/>'),
(2, 429.90, NULL, '- 22GB gratis per 30 giorni Internet 4G LTE<br/>'),
(3, NULL, 'In promozione a 120 € in 24 rate\r\n5 €/mese (se hai una linea di casa TIM)', NULL),
(100, NULL, NULL, '129 euro:\r\n RILEVATORE GPS\r\n+12 MESI DI SERVIZIO'),
(101, 36.00, '3 euro al mese a partire dal 25° mese', 'TIM Home Connect 24 - 24 mesi senza pensieri! '),
(102, 24.00, '3 euro al mese a partire dal 13° mese', 'TIM Home Connect 12 - 12 mesi senza pensieri! '),
(103, 5.00, '3 euro al mese', 'TIM Home Connect Light - L''offerta che si rinnova ogni mese!');

-- --------------------------------------------------------

--
-- Table structure for table `single_topic`
--

CREATE TABLE IF NOT EXISTS `single_topic` (
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `title` varchar(255) COLLATE utf8_bin NOT NULL,
  `content` text COLLATE utf8_bin NOT NULL,
  `id_entry` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_entry`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=8 ;

--
-- Dumping data for table `single_topic`
--

INSERT INTO `single_topic` (`name`, `title`, `content`, `id_entry`) VALUES
('Aspetti di mercato', 'Aspetti di mercato del nostro modello di business', 'I nostri mercati strategici sono l''Italia ed il Brasile. Le attività sono seguite da Business Unit dedicate:  la   Business Unit Domestic -  servizi voce e dati, da rete fissa e mobile, per i clienti finali (retail) e altri  operatori (wholesale), servizi wholesale internazionali (Telecom Italia Sparkle ) e soluzioni IT (Olivetti) -,   la Busines Unit Brasile  (TIM Brasil). <br/>\n\nLa nostra organizzazione, in linea con l’evoluzione dei business model di settore e dei trend di mercato e tecnologici, sta virando verso un modello “Digital Telco e Platform Company”. Un modello che si basa su infrastrutture innovative ed un eccellente servizio al cliente e punta  alla diffusione di servizi e contenuti digitali premium offerti su una piattaforma personalizzabile e fruibili ovunque e su qualsisasi dispositivo.<br/>\n\nIl presidio commerciale della clientela retail - ovvero privati (consumatori individuali e famiglie) e clientela business -,  fa riferimento a  questi driver organizzativi:<br/>\n\ngarantire l’accountability end to end dei processi di marketing, sales e post sales su ciascun segmento di clientela,\nfavorire lo sviluppo di offerte integrate “customer centric” e la focalizzazione sui servizi del mercato digitale\ncreare sinergie tra i canali commerciali, per aumentare l''efficienza e l''efficacia del modello di multicanalità\nfavorire lo sviluppo dei servizi “platform based” ampliando il portafoglio di offerta di TIM\nporre attenzione ai clienti multinational, per lo sviluppo della connettività internazionale.\nA tal fine le attività sul mercato domestico sono strutturate in queste principali funzioni:<br/>\n\nConsumer e Small Enterprise Market: questa funzione ha la responsabilità di assicurare il margine operativo proveniente dall''attività verso i segmenti consumer e small business,  massimizzando ricavi, redditività e quote di mercato attraverso l’offerta,  i piani di marketing, la comunicazione commerciale, la commercializzazione dei prodotti/servizi, le attività di caring, credito operativo e la gestione amministrativa dei clienti. Lo scopo è  aumentare la soddisfazione della clientela e, al contempo, ottimizzare i costi complessivi del servizio. A questa funzione fa riferimento, dal punto di vista organizzativo, la società Persidera, nata dalla fusione di Telecom Italia Media Broadcasting e Rete A.<br/>\n\nICT Solutions e Service Platforms: con la responsabilità di assicurare il margine operativo proveiente dall''attività verso i segmenti Top, Strategic, Large, Medium Enterprise e della Pubblica Amministrazione,  massimizzando ricavi, redditività e quote di mercato attraverso l''offerta, i piani di marketing e la comunicazione commerciale. Inoltre assicura la progettazione delle soluzioni ICT, la commercializzazione dei prodotti/servizi, le attività di post vendita, di caring e di gestione del credito di competenza. A questa funzione fanno riferimento, dal punto di vista organizzativo, Olivetti e Telecom Italia Sparkle. <br/>\n\nInternational Wholesale Services: comprende le attività di Telecom Italia Sparkle che opera nel mercato dei servizi internazionali voce, dati e internet per gli operatori di telecomunicazioni fissi  e mobili, gli ISP e le aziende multinazionali, attraverso reti proprietarie nei mercati Europei, nel Mediterraneo e in Sud America.<br/>\n\nWholesale: nella funzione, creata a novembre 2015, confluiscono le funzioni Open Access e  National Wholesale Services. Questa modifica organizzativa punta a rafforzare ulteriomente l''efficienza e l''efficacia dei processi di attivazione e manutenzione dei servizi di accesso wholesale alla rete fissa di Telecom Italia forniti alle proprie direzioni commerciali e agli OLO, ponendo sullo stesso piano, alle dipendenze dello stesso responsabile, le divisioni commercaili di Telecom Italia e degli OLO. La funzione Wholesale ha dunque le seguenti responsabilità: assicurare lo sviluppo del business wholesale, l’innovazione, la definizione dell’offerta e la commercializzazione dei relativi prodotti e servizi; garantire il processo end to end di delivery e assurance dei servizi alla clientela retail e wholesale, in coerenza con un’efficace gestione delle infrastrutture della rete di accesso e secondo principi di non discriminazione tra attività interne ed esterne; assicurare la governance complessiva ed il monitoraggio end to end delle performance e degli indicatori di processo, con l’obiettivo di massimizzare i livelli di qualità dei servizi erogati e garantire condizioni di equità e trasparenza.<br/>\n\nTechnology: ha la responsabilità di assicurare l’innovazione tecnologica e i processi di sviluppo, ingegneria, realizzazione ed esercizio delle infrastrutture di rete.<br/>\n\nNel corso del 2015 è stata creata INWIT S.p.A. La società opera nel settore delle infrastrutture per le comunicazioni elettroniche, nello specifico in quelle dedicate all’ospitalità di apparati di trasmissione radio per le reti di telefonia mobile sia di Telecom Italia sia di altri operatori.<br/>', 1),
('Descrizione', 'Descrizione del nostro sistema di Governance', 'Il sistema di corporate governance di Telecom Italia, articolato secondo il modello tradizionale, è incentrato sul ruolo di guida nell’indirizzo strategico attribuito al Consiglio di Amministrazione; sulla trasparenza delle scelte gestionali sia all’interno della Società sia nei confronti del mercato; sull’efficienza e sull’efficacia del sistema di controllo interno; sulla rigorosa disciplina dei potenziali conflitti di interesse e su saldi principi di comportamento per l’effettuazione di operazioni con parti correlate.  <br/>\r\n\r\nQuesto sistema, pensato e costruito anche alla luce dei principi elaborati dal Comitato per la Corporate Governance di Borsa Italiana e delle best practices internazionali, è stato implementato con l''adozione di codici, principi e procedure che caratterizzano l''attività delle diverse componenti organizzative e operative e che sono costantemente oggetto di verifica e di aggiornamento per rispondere in maniera efficace all''evoluzione del contesto normativo e al mutare delle prassi operative.<br/>\r\n\r\nSiamo convinti che una buona corporate governance possa e debba individuare sempre nuovi margini di miglioramento, alla luce degli stimoli e dei constraints esterni, così come dell’esperienza applicativa.<br/>', 2),
('Per gli investitori', 'Informazioni per gli investitori', 'I documenti di offerta, i Prospetti di quotazione delle Obbligazioni, i Prospetti Informativi sull''Emittente, i Regolamenti e gli Avvisi relativi agli strumenti finanziari sono stati oggetto di pubblicazione ai sensi delle norme di volta in volta vigenti.</br>\r\n\r\nNessuno degli strumenti finanziari descritti nei Prospetti è oggetto di offerta o di vendita da parte di società del Gruppo.</br>\r\n\r\nIn particolare, per quanto concerne le emissioni in sterline e in dollari, le informazioni contenute nei documenti allegati non costituiscono e non devono in qualsiasi caso costituire un''offerta di vendita o consegna di strumenti finanziari ovvero un''offerta di acquisto di strumenti finanziari in Italia, né al pubblico né ad “operatori qualificati” come definiti all''Art. 31, paragrafo 2 del Regolamento Consob n. 11522 del 1° Luglio 1998 (congiuntamente, i “Soggetti Italiani”); pertanto gli strumenti finanziari oggetto di questa comunicazione non sono destinati all''offerta, vendita o consegna, diretta o indiretta, in Italia a Soggetti Italiani.</br>\r\n\r\nQuanto alle emissioni in dollari collocate con forma tecnica “144A private placement with registration rights” secondo regolamentazione USA, si tratta di collocamenti privati presso investitori istituzionali effettuati in deroga allo US Securities Act e che quindi non richiedono registration presso la SEC al momento dell''emissione, bensì in un secondo momento.</br>', 3),
('Governance', 'La struttura del nostro sistema di Governance', '<p>\nIl sistema di corporate governance di Telecom Italia, articolato secondo il modello tradizionale, è incentrato sul ruolo di guida nell’indirizzo strategico attribuito al Consiglio di Amministrazione; sulla trasparenza delle scelte gestionali sia all’interno della Società sia nei confronti del mercato; sull’efficienza e sull’efficacia del sistema di controllo interno; sulla rigorosa disciplina dei potenziali conflitti di interesse e su saldi principi di comportamento per l’effettuazione di operazioni con parti correlate.<br/>\n\nQuesto sistema, pensato e costruito anche alla luce dei principi elaborati dal Comitato per la Corporate Governance di Borsa Italiana e delle best practices internazionali, è stato implementato con l''adozione di codici, principi e procedure che caratterizzano l''attività delle diverse componenti organizzative e operative e che sono costantemente oggetto di verifica e di aggiornamento per rispondere in maniera efficace all''evoluzione del contesto normativo e al mutare delle prassi operative.<br/>\n\nSiamo convinti che una buona corporate governance possa e debba individuare sempre nuovi margini di miglioramento, alla luce degli stimoli e dei constraints esterni, così come dell’esperienza applicativa.<br/></p>\n<img class="img-responsive" src="../img/sistema governance.jpg"/>', 4),
('Testimonials', 'Scopri i nostri testimonials:', '<div class="testimonial">\r\n              <img class="img-responsive imgtest" src="../img/berners%20lee.png"/>\r\n              <img class="img-responsive imgtest" src="../img/complete_fazio.png"/>\r\n          </div>', 5),
('Innovazioni', 'All''innovazione, forza motrice del futuro, dedichiamo impegno e risorse', '<br/> \r\n<b>#TIMGIRLSHACKATHON</b>\r\n<p>La competizione tecnologica al femminile più cool del momento torna il 6 aprile in quattro nuove città: Padova, Firenze, Cagliari, Bari. Un hackathon organizzato da TIM per coinvolgere le ragazze sui temi legati al Cyberbullismo e acquisire una maggiore consapevolezza del web.</p>\r\n<br/>\r\n<b>PENINSULA TALKS</b>\r\n<p>Il Made in Italy che non ti aspetti. TIM e Humboldt Books promuovono Peninsula Talks, la rivista interattiva che racconta storie di persone che sono state capaci di reinventare il Made in Italy. Un progetto di data journalism, con una innovativa  piattaforma sviluppata dall''agenzia di information design Accurat, per dare spazio a professionisti, artigiani e pensatori che sono stati in grado di superare gli stereotipi e disegnare i confini di una nuova italianità.</p>\r\n<br/>               \r\n<b>#KMDIFUTURO</b>\r\n<p>Persone comuni, startupper, giornalisti, creativi, scrittori o imprenditori raccontano, in un ideale chilometro di strada a bordo di una Panda TIM, come il digitale e le nuove reti stiano cambiando le nostre vite e il nostro futuro. Chilometri di strada che rimandano ai chilometri di fibra, più di 16 milioni, che Telecom Italia e TIM poseranno entro il 2017, per connettere l''Italia all''Italia di domani. </p>\r\n<br/>  \r\n<b>TIM VENTURES</b>\r\n<p>Il futuro è di chi ha la forza di sognarlo. Il primo Corporate Venture Capital italiano. TIM partecipa alla crescita di startup innovative in ambito Internet e digital life, sostenendole nella fase di sviluppo.</p>\r\n<br/>', 6),
('Progetti', 'I progetti TIM disegnano il futuro che immaginiamo', '<b>Innovazione</b>\r\n<p>\r\nAll''innovazione, forza motrice del futuro,\r\ndedichiamo impegno e risorse.</p>\r\n</br>\r\n\r\n<b>Ambiente e sociale</b>\r\n<p>\r\nCi impegnamo ogni giorno per i bisogni\r\ndelle comunità con soluzioni innovative\r\ne altamente tecnologiche.</p>\r\n</br>\r\n\r\n<b>Cultura</b>\r\n<p>\r\nLe nuove tecnologie contribuiscono\r\nalla diffusione della cultura nel Paese e\r\nalla nascita di nuove professioni.</p>\r\n</br>\r\n\r\n<b>Sport</b>\r\n<p>\r\nLo sport è passione, rispetto e condivisione\r\ndi emozioni. Un patrimonio di valori e\r\nbuone pratiche in cui ci identifichiamo.</p>\r\n</br>', 7);

-- --------------------------------------------------------

--
-- Table structure for table `single_topic_content`
--

CREATE TABLE IF NOT EXISTS `single_topic_content` (
  `id_entry` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `content` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_entry`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=10 ;

--
-- Dumping data for table `single_topic_content`
--

INSERT INTO `single_topic_content` (`id_entry`, `name`, `content`) VALUES
(3, 'Business', 'Aspetti di mercato'),
(4, 'Business', 'Per gli investitori'),
(5, 'Governance', 'Descrizione'),
(6, 'Governance', 'Governance'),
(7, 'Chi siamo', 'Testimonials'),
(8, 'Chi siamo', 'Innovazioni'),
(9, 'Chi siamo', 'Progetti');

-- --------------------------------------------------------

--
-- Table structure for table `sl`
--

CREATE TABLE IF NOT EXISTS `sl` (
  `id_sl` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `description` text COLLATE utf8_bin NOT NULL,
  `price` int(11) DEFAULT NULL,
  `how_to` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_sl`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=8 ;

--
-- Dumping data for table `sl`
--

INSERT INTO `sl` (`id_sl`, `name`, `description`, `price`, `how_to`) VALUES
(1, 'Fidelity Card', 'Salva nel TIM Wallet le tue carte fedeltà per averle sempre con te', NULL, 'Con TIM Wallet puoi virtualizzare le tue carte fedelta'' e portarle sempre con te. <br/>\nAccedi alla Vetrina Servizi e in pochi passaggi puoi acquisire tutte le tue carte fedeltà. \nInquadra la carta nel riquadro e attendi che venga riconosciuta. <br/>\nIl riconoscimento della tessera é automatico, tuttavia se la tessera non viene riconosciuta tra le carte presenti puoi comunque aggiungerla utilizzando la fotocamera del tuo smartphone: seleziona il tipo di codice riportato sulla tessera (codice a barre, QRCode o codice numerico) e inquadralo. Se il codice non viene riconosciuto automaticamente, può essere inserito anche manualmente. <br/>\nIn breve puoi vedere la tessera nel portafogli. \nPuoi mostrarla nei punti vendita abilitati direttamente dal tuo smartphone: se clicchi sull''immagine della carta in automatico ruota e ti mostra il codice a barre (attenzione: non tutti i punti vendita hanno i lettori di codice a barre abilitati!)'),
(2, 'Pagamenti', 'Con TIM Wallet puoi utilizzare il tuo smartphone per pagare in tutti i negozi abilitati.<br/>\nScopri subito TIM SmartPAY, la carta prepagata nata dalla partnership fra Intesa Sanpaolo e TIM dedicata a tutti i clienti TIM, oppure scegli la carta di pagamento che preferisci tra quelle disponibili di Intesa Sanpaolo, Mediolanum, BNL o Hello bank!.\n<br/><br/>\nTIM SmartPAY è la carta di pagamento prepagata conveniente e sicura, realizzata in collaborazione con Intesa Sanpaolo e VISA. <br/>\nLa TIM SmartPAY è una carta dedicata ai clienti TIM.\n<br/><br/>\nPuoi richiederla ed utilizzarla sin da subito per fare acquisti con il tuo smartphone NFC * e su Internet.', NULL, 'Scarica l’app TIM Wallet da Google Play su uno smartphone NFC Android.<br/><br/>\n\nCollega la TIM SmartPAY o aggiungi la carta di pagamento che preferisci tra quelle disponibili nella vetrina.<br/><br/>\n\nAl momento del pagamento seleziona la carta che vuoi utilizzare, premi “Paga” e avvicina lo smartphone al POS contactless. Ricevei la conferma che il pagamento è stato effettuato direttamente sul display dello smartphone.\nNEGOZI ABILITATI'),
(3, 'Trasporti', 'Compra un biglietto via SMS e pagalo direttamente con il tuo credito telefonico\r\n', NULL, 'Apri TIM Wallet e accedi alla Vetrina Servizi. \nSe la città che ti interessa é abilitata, clicca e acquista il biglietto. <br/>\nPaghi direttamente con il tuo credito telefonico (se sei un Cliente Ricaricabile) o con addebito in bolletta (se sei un Cliente con Abbonamento). \n<br/><br/>\nAttenzione: ti verranno addebitati il costo del biglietto più il costo dell’SMS di richiesta (19,90 €cent IVA inclusa). <br/><br/>\n\nRicevi un SMS, il biglietto è valido da quel momento senza necessità di ulteriori convalide. \nPuoi trovare il biglietto elettronico direttamente nel TIM Wallet nel tuo portafogli, puoi rinnovarlo quando scade. In caso di controllo, mostra l’SMS di conferma che hai ricevuto.<br/><br/>\n\nA Milano puoi utilizzare anche la modalità QRCode. Dopo aver acquistato il biglietto della metropolitana e ricevuto l’SMS, ricevi anche il QRCode che permette di aprire i tornelli della metropolitana. E’ sufficiente visualizzare il QRCode e accostare il display dello smartphone all’apposito lettore.'),
(4, 'Tim Tag', 'TIMTag è il dispositivo che ti informa sulla posizione del tuo amico a quattro zampe e delle cose a te più care.\nSegui in tempo reale i suoi spostamenti sul tuo smartphone senza perderlo mai di vista.\n\nCon TIMTag hai un dispositivo di localizzazione GPS di ultima generazione, con 12 mesi di servizio TIMTag e una TIM Card inclusi e un'' App dedicata intuitiva e semplice da utilizzare!', NULL, 'Acquista il Pack TIMTag:\r\nAcquista subito online e ricevi direttamente a casa tua il pack oppure vai in uno dei negozi TIM.\r\n\r\nAttiva la TIM Card:\r\nRegistra la TIM Card che trovi nel Pack in un negozio TIM (l''offerta TIMTag si attiverà automaticamente dopo la registrazione).\r\n\r\nScarica l''APP TIMTag sul tuo Smartphone:\r\nInstalla l''app sul tuo smartphone ed associa il dispositivo di localizzazione (Android ed iOS).'),
(5, 'Tim Home Connect', 'TIM Home Connect è l’offerta pensata per essere utilizzata nei dispositivi di domotica presenti nella casa, la cui gestione prevede l''uso di una SIM\n\nCon Tim Home Connect infatti hai a disposizione minuti, MB e SMS da utilizzare per connettere e gestire il tuo antifurto, la tua caldaia o altri sistemi di domotica.\n\n \n', NULL, '1) Se sei già in possesso di una TIM Card, direttamente online cliccando sul tasto ATTIVA\n<br/>\n2) Presso i Negozi TIM'),
(6, 'TIM SKY', 'Sky TV: L’offerta più completa di serie TV su Sky Atlantic e Fox, con le serie più seguite e premiate da tutto il mondo e le grandi produzioni originali Sky.Tanti programmi interessanti di arte, cucina, musica, viaggi, lifestyle, storie dal mondo e grandi eventi dello sport internazionale.Le news dall’Italia e dal mondo di Sky TG24, e gli approfondimenti sportivi 24 ore su 24 di Sky Sport 24.<br/><br/>\r\n\r\n\r\nSky Famiglia: Programmi sicuri, divertenti ed educativi per bambini di tutte le età, anche in inglese.Tutti i canali Disney, i documentari spettacolari di Discovery Channel e National Geographic Channel e gli approfondimenti di History, storie appassionanti, professioni incredibili e programmi di scienza e tecnologia. In più la migliore musica nazionale, internazionale e i grandi concerti.<br/>\r\n<br/>\r\n\r\n\r\nSky Box Sets: Sky Box Sets è la novità di Sky che ti offre le migliori serie TV, da vedere stagione dopo stagione, tutte su My Sky. Hai le stagioni complete delle serie TV più amate come Mad Men, Twin Peaks e trovi anche le stagioni precedenti delle serie TV in onda, come Gomorra.<br/>\r\n<br/>\r\n\r\n\r\nSky Cinema: Un’offerta unica, con 12 canali dedicati al grande cinema, per soddisfare tutte le tue passioni. I canali evento dedicati alle saghe cinematografiche indimenticabili, come Sky Cinema 007, Sky Cinema Star Wars e tanti altri.Tutti in HD, senza interruzioni pubblicitarie e anche in lingua originale.\r\n<br/>\r\n<br/>\r\n\r\nSky Sport: Un''offerta unica di sport con tutta la F1® in diretta e la MotoGP™ in esclusiva, la UEFA Europa League e la Premier League, il calcio internazionale di Fox Sport, il basket Serie A Beko e l''Eurolega, tutto in esclusiva. Inoltre, i grandi tornei di tennis, rugby e golf.\r\n<br/>\r\n<br/>\r\n\r\nSky Calcio: Solo su Sky tutta la Serie A TIM e in esclusiva tutta la Serie B ConTe.it per una copertura unica in Italia fino al 2018. Inoltre tutte le partite di UEFA Euro 2016 e in esclusiva tutta la Copa America Centenario, per un''estate di calcio senza pause.', 49, '<b>Puoi richiedere l''attivazione:</b>\r\n<br/>\r\n<br/>\r\n-Presso un negozio TIM<br/>\r\n-Chiamando il 187<br/>\r\n<br/>\r\n'),
(7, 'WellUp', 'Un''app gratuita sviluppata come fosse un diario personale, per disporre in ogni momento di tutte le informazioni sui controlli medici preventivi da effettuare periodicamente per sé e per tutta la famiglia', NULL, 'Scarica l''app dall''Apple Store (su dispositivi Apple) o dal Google Play Store (su dispositivi Android).');

-- --------------------------------------------------------

--
-- Table structure for table `sl_benefits`
--

CREATE TABLE IF NOT EXISTS `sl_benefits` (
  `id_benefit` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `content` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_benefit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `sl_benefits`
--

INSERT INTO `sl_benefits` (`id_benefit`, `name`, `content`) VALUES
(1, 'INQUADRA LA TESSERA', 'Utilizza la fotocamera per aggiungere una carta'),
(2, 'RICONOSCIMENTO AUTOMATICO', 'La tessera viene riconosciuta in automatico e la trovi nel tuo TIM Wallet\r\n'),
(3, 'UTILIZZA LE CARTE', 'Apri il wallet e mostra le carte fedelta'' nei punti vendita'),
(4, 'SICURO', 'I dati della tua carta di credito o prepagata sono memorizzati in modo confidenziale e protetto sulla TIM Card'),
(5, 'SEMPLICE E VELOCE', 'Basta un tocco per scegliere la carta con cui effettuare i tuoi acquisti\r\n'),
(6, 'COMODO', 'Lasci il portafoglio a casa e utilizzi lo smartphone per avere a disposizione le tue carte\r\n'),
(7, 'SCEGLI LA CITTA''', 'Entra nella Vetrina dei servizi e scopri se il servizio è già attivo nella tua città\r\n'),
(8, 'ACQUISTA IL BIGLIETTO', 'Seleziona la tipologia di biglietto e acquistalo direttamente con il tuo credito telefonico\r\n'),
(9, 'VISUALIZZA IL BIGLIETTO', 'Trovi subito il biglietto valido nella sezione Trasporti del tuo TIM Wallet\r\n'),
(10, 'ADATTO A OGNI SITUAZIONE', 'Resistente all’acqua\r\n'),
(11, 'ADATTO A OGNI SITUAZIONE', 'Batteria a lunga durata\r\n'),
(12, 'ADATTO A OGNI SITUAZIONE', 'Allarmi di movimento\r\n(velocità, inerzia, crash)'),
(13, 'ADATTO A OGNI SITUAZIONE', 'Allarmi di uscita da zone sicure\r\n(Geofence)'),
(14, 'CHIAMATE', '20 minuti di chiamate\r\n'),
(15, 'INTERNET', '100 MB di traffico Internet\r\n'),
(16, 'SMS', '100 SMS verso tutti\r\n'),
(17, 'ABBONAMENTO PER I GIA'' CLIENTI ADSL/Fibra', '14 €/mese in più per 18 mesi con Sky TV e 12 mesi di Sky Box Sets.<br/>\n\nOPPURE 19€/mese per i primi 18 mesi con Sky Famiglia + Sky HD<br/>\n\nOPPURE 26,90€/mese per i primi 18 mesi con un pacchetto a scelta tra Sky Cinema, Sky Sport o Sky Calcio\n\n\n\n'),
(18, 'SMART MODEM', 'Incluso\r\n'),
(19, 'CONTRIBUTO DI ATTIVAZIONE SERVIZIO SKY', 'Incluso'),
(20, 'CONSEGNA My Sky', '49 euro'),
(21, 'IL PROGETTO', 'Il progetto realizzato da Fondazione Telecom Italia e Fondazione Umberto Veronesi ha l''obiettivo di dare informazioni concrete e scientificamente attendibili sui corretti stili di vita e sulle azioni di prevenzione.'),
(22, 'CONTRO LE MALATTIE', ' Per quanto possa sembrare strano, è nelle abitudini di vita che si annidano i maggiori rischi per la salute. Well Up ti aiuta a migliorare le tue abitudini di vita.');

-- --------------------------------------------------------

--
-- Table structure for table `sl_categories_content`
--

CREATE TABLE IF NOT EXISTS `sl_categories_content` (
  `sl_category` varchar(255) COLLATE utf8_bin NOT NULL,
  `content` varchar(255) COLLATE utf8_bin NOT NULL,
  `id_entry` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_entry`),
  KEY `sl category` (`sl_category`),
  KEY `content name` (`content`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=10 ;

--
-- Dumping data for table `sl_categories_content`
--

INSERT INTO `sl_categories_content` (`sl_category`, `content`, `id_entry`) VALUES
('Servizi alla persona', 'Pagamenti', 1),
('Servizi alla persona', 'Trasporti', 2),
('Servizi alla persona', 'Fidelity Card', 3),
('Casa e Famiglia', 'Tim Tag', 4),
('Casa e Famiglia', 'Tim Home Connect', 5),
('TV e Entertainment', 'TIM SKY', 8),
('Salute e Benessere', 'WellUp', 9);

-- --------------------------------------------------------

--
-- Table structure for table `sl_to_benefits`
--

CREATE TABLE IF NOT EXISTS `sl_to_benefits` (
  `id_sl` int(11) NOT NULL,
  `id_benefit` int(11) NOT NULL,
  `id_entry` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_entry`),
  KEY `id sl` (`id_sl`),
  KEY `id benefit` (`id_benefit`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=23 ;

--
-- Dumping data for table `sl_to_benefits`
--

INSERT INTO `sl_to_benefits` (`id_sl`, `id_benefit`, `id_entry`) VALUES
(1, 1, 1),
(1, 2, 2),
(1, 3, 3),
(2, 4, 4),
(2, 5, 5),
(2, 6, 6),
(3, 7, 7),
(3, 8, 8),
(3, 9, 9),
(4, 10, 10),
(4, 11, 11),
(4, 12, 12),
(4, 13, 13),
(5, 14, 14),
(5, 15, 15),
(5, 16, 16),
(6, 17, 17),
(6, 18, 18),
(6, 19, 19),
(6, 20, 20),
(7, 21, 21),
(7, 22, 22);

-- --------------------------------------------------------

--
-- Table structure for table `sl_to_promo`
--

CREATE TABLE IF NOT EXISTS `sl_to_promo` (
  `id_sl` int(4) NOT NULL,
  `id_promo` int(4) NOT NULL,
  `id_entry` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_entry`),
  KEY `id sl` (`id_sl`),
  KEY `id promo` (`id_promo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

--
-- Dumping data for table `sl_to_promo`
--

INSERT INTO `sl_to_promo` (`id_sl`, `id_promo`, `id_entry`) VALUES
(4, 100, 1),
(5, 101, 2),
(5, 102, 3),
(5, 103, 4);

-- --------------------------------------------------------

--
-- Table structure for table `technical_spec`
--

CREATE TABLE IF NOT EXISTS `technical_spec` (
  `id_spec` int(11) NOT NULL AUTO_INCREMENT,
  `spec_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `content` varchar(511) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_spec`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=100 ;

--
-- Dumping data for table `technical_spec`
--

INSERT INTO `technical_spec` (`id_spec`, `spec_name`, `content`) VALUES
(1, 'Display', 'Display Retina HD da 4,7" (diagonale) con risoluzione di 1334x750 pixel\r\n3D Touch'),
(2, 'Processore', 'Chip A9 con coprocessore di movimento M9 integrato'),
(3, 'Fotocamera', 'Fotocamera iSight da 12 megapixel con Focus Pixels, True Tone Flash e Live Photos'),
(4, 'Registrazione video', 'Registrazione video 4K a 30 fps, moviola (1080p) a 120 fps'),
(5, 'Videocamera', 'Videocamera FaceTime HD con Retina Flash (foto da 5MP)'),
(6, 'Sensori', 'Touch ID di seconda generazione'),
(7, 'Connettivita', '4G LTE Advanced e Wi-Fi 802.11a/b/g/n/ac con tecnologia MIMO'),
(8, 'Sistema Operativo', 'iOS 9 e iCloud'),
(9, 'Colori', 'argento, oro, grigio siderale, oro rosa'),
(10, 'Tecnologia', '4G cat.4/HSDPA42/UMTS/EDGE/GPRS Frequenze 850/900/1800/1900/2100'),
(11, 'Connettivita', 'Wi-Fi - Bluetooth - Micro USB - NFC'),
(12, 'GPS', 'Integrato'),
(13, 'Display', '5" 16 Milioni colori Touch'),
(14, 'Fotocamera', 'Posteriore da 8 Mpxl con flash'),
(15, 'Memoria Interna', '8GB con Slot Memory Card Micro SD fino a 32GB'),
(16, 'Processore', 'Processore QuadCore 1.3 GHz'),
(17, 'Formato SIM', 'Nano-sim'),
(18, 'Audio e Video', 'Video Recorder&Playback - MP3 Player - Radio FM'),
(19, 'In dotazione', 'Caricabatteria, Cavo dati USB, Manuale d''uso rapido, Auricolare stereo'),
(20, 'Dimensioni', '144,6x71,5x8,7 mm'),
(21, 'Peso', '142 gr.'),
(22, 'Autonomia', 'Stand-by fino a 100 ore -  Conversazione fino a 240 min.'),
(23, 'Sistema operativo', 'Sistema Operativo Android 6 Marshmallow'),
(24, 'Dimensioni', '145 g / 144.7 x 70.8 x 7.25 mm'),
(25, 'Batteria', '- Capacità: 2900 mAh\r\n- Autonomia: TBD'),
(26, 'Connettivita', '- USB 2.0 / Bluetooth 4.1 Low Energy \r\n- 802.11 a/b/g/n 2.4+5GHz, HT40\r\n- A-GPS + GLONASS\r\n- Router Wi-Fi / Wi-Fi Direct\r\n- NFC / Android Beam\r\n- Connettore auricolare da 3,5 mm \r\n- Supporto nanoSIM\r\n- USB OTG'),
(27, 'Fotocamera', '\r\n- 13 Mpx AF con FlashLED, Zoom digitale 4x, OIS , F1.9 (fotocamera posteriore)\r\n- 5 Mpx, F1.9 (fotocamera anteriore)\r\n- Modalità Pro, , Autoscatto, Selfie panoramico, Panoramica, Scatto multiplo, HDR, Notte, Modalità aggiuntive scaricabili\r\n- Foto: 4128x3096, 4128x2322, 3096x3096, 3264x2448, 3264x1836, 2048x1152\r\n- Registrazione Video: 1920x1080, 1280x720, 640x480'),
(28, 'Display', '- Touchscreen Full HD SuperAMOLED 5.2’’ \r\n- 1920 x 1080'),
(29, 'Memoria', '- 16 GB interna* (espandibile fino a 128 GB)\r\n- 2 GB (RAM)'),
(30, 'Sistema operativo', 'Sistema Operativo Android 5.1.1'),
(31, 'Processore', 'Processore Octa-Core 1.6 GHz'),
(32, 'Colore', 'Nero, Bianco, Oro'),
(33, 'Display', 'Retina da 4"'),
(34, 'Processore', 'Chip A7 con coprocessore di movimento M7'),
(35, 'Sensori', 'impronte digitali Touch ID'),
(36, 'Fotocamera', 'iSight da 8 megapixel con flash True Tone - Registrazione video HD a 1080p - Videocamera FaceTime'),
(37, 'Connettivita', 'Reti 4G LTE ultraveloci'),
(38, 'Applicazioni', 'Oltre 900.000 app sull’App Store'),
(39, 'Sistema operativo', 'iOS 8: l’OS mobile più evoluto al mondo'),
(40, 'Cloud', 'iCloud: I tuoi contenuti, su tutti i tuoi dispositivi'),
(41, 'Colore', 'Grigio, Nero'),
(44, 'Monitor HD', 'Con il Monitor HD, potrai controllare la tua casa in alta definizione (720p) e grazie alla visione notturna anche in assenza di luce (fino a 5 mt). Il Monitor HD ti avvisa mediante notifica push ogni volta che verrà rilevato un suono o un movimento.'),
(45, 'Sensore di movimento', 'Grazie alla tecnologia a infrarossi passiva saranno ridotti i falsi allarmi e verrai avvisato solo quando necessario. Con il sensore di movimento rileverai i movimenti fino a 8 metri (100° orizzontale, 80° verticale).'),
(46, 'Smart Plug', 'Potrai accendere e spegnere i dispositivi dal tuo smartphone tablet, ovunque ti trovi. Essere avvisato se un elettrodomestico è stato acceso o spento. Impostare nuove regole di funzionamento in base alle tue esigenze.'),
(47, 'Materiale', 'Alluminio'),
(48, 'Colore', 'Bianco'),
(49, 'Intensità regolabile', 'Si'),
(50, 'Perfetta per creare atmosfera', 'Si'),
(51, 'Cambiacolore (LED)', 'Si'),
(52, 'Effetto luce diffusa', 'Si'),
(53, 'Connessione ZigBee Light', 'Si'),
(54, 'Bridge hue incluso', 'Si'),
(55, 'Dimensioni del prodotto', '21,8x 22,8x 21,9 cm'),
(56, 'Peso del prodotto', '0,840 Kg'),
(57, 'Tensione di rete', 'Da 100 V a 240 V, 50-60 Hz'),
(58, 'Numero di lampadine', '1'),
(59, 'Watt lampadina inclusa', '8 W'),
(60, 'Totale lumen emessi dall''apparecchio', '120 lm'),
(61, 'Apparecchio di illuminazione', 'Ad intensità regolabile'),
(62, 'Tecnologia', 'LED'),
(63, 'Codice IP', 'IP20, protezione contro gli oggetti superiori a 12,5 mm, nessuna protezione contro l''acqua'),
(64, 'Classe di protezione', 'II - doppio sistema di isolamento'),
(65, 'Garanzia', '2 anni'),
(66, 'Dimensioni della confezione', '11,6x 36,8x 21,1 cm'),
(67, 'Peso della confezione', '1,444 Kg'),
(68, 'Appositamente progettata per', 'Salotto e camera da letto, Cameretta dei bambini'),
(69, 'Tipo', 'Lampada da tavolo'),
(70, 'Connettività ', 'wireless'),
(71, 'Dimensioni', 'Dispositivo: 51,9 x 51,9 x 13,49 mm\r\nConfezione: 124,4 mm x 42,85 mm x 124 mm\r\nCavo di alimentazione: 1,75 m'),
(72, 'Peso', '39,1g'),
(73, 'Porte e connettori', 'HDMI compatibile CEC (Consumer Eletronic Control)\r\nMicro USB'),
(74, 'Colore', 'Nero'),
(75, 'Risoluzione', '1080p'),
(76, 'Connettivita', 'Wi-Fi 802.11 b/g/n/ac (2,4 GHz/5 GHz)'),
(77, 'Sicurezza', 'WEP, WPA/WPA2'),
(78, 'Alimentazione', 'Alimentazione 5V, 1A'),
(79, 'Sistema Operativo Supportato', 'Android 4.1 e versioni successive\r\niOS 7.0 e versioni successive\r\nWindows 7 e versioni successive\r\nMac OS X 10.7 e versioni successive\r\nChrome OS'),
(81, 'Connettivita', 'LTE Cat6 /HSDPA 42 Mbps /, Wi-Fi 802.11b/g/n MIMO, Bluetooth 4.1, Micro USB 3.1 (C-type) – GPS Glonass - NFC\r\n'),
(82, 'Display', 'Display 12” FHD+, 2160x1440 SuperAmoled\r\n'),
(83, 'Dimensioni', '290.3x198.8x6.3 mm\r\n'),
(84, 'Peso', '698 gr\r\n'),
(85, 'Autonomia', '600 minuti\r\n'),
(86, 'Fotocamera', 'Fotocamera (Front: 5 MP Back: 5 MP)\r\n'),
(87, 'Formati supportati\r\n', 'Video: MP4,3GP,WMV,ASF,AVI,MKV\r\nAudio: MP3,AAC,WAV,WMA,AMR,FLAC'),
(88, 'Memoria', '128GB SSD, 4GB di Ram\r\n'),
(89, 'Processore', 'Processore Intel Core M3 (Dualcore 2.2 GHz)\r\n'),
(90, 'Sistema Operativo', 'Windows 10 Pro\r\n'),
(91, 'In confezione\r\n', 'Carica batteria, Cavo dati Usb, Manuale d’uso\r\n'),
(92, 'Display', 'Curvo Touch da 1.84” (risoluzione 128x432) a 16M di colori\r\n'),
(93, 'Certificazione', 'Resistente ad acqua e polvere (IP67)\r\n'),
(94, 'Sensori', 'Accelerometro - Giroscopio - Sensore cardiaco\r\n'),
(95, 'Connettivita', 'Bluetooth 4.0 - Micro USB\r\n'),
(96, 'Applicazioni', 'Modalità allenamento, Meteo, Calendario, Contapassi, Orologio, Cronometro, Conto alla rovescia, Notifiche istantanee, Controlli multimediali, Trova dispositivo personale\r\n'),
(97, 'Dimensioni', '23,4 x 57,4 x 11,95 mm\r\n'),
(98, 'Peso', '27 grammi\r\n'),
(99, 'Batteria', '210mAh');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assistance_categories_content`
--
ALTER TABLE `assistance_categories_content`
  ADD CONSTRAINT `assistance_categories_content_ibfk_1` FOREIGN KEY (`assistance_category`) REFERENCES `high_level_categories` (`category`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `assistance_categories_content_ibfk_2` FOREIGN KEY (`content`) REFERENCES `assistance` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `assistance_for`
--
ALTER TABLE `assistance_for`
  ADD CONSTRAINT `id assistance ref int` FOREIGN KEY (`id_assistance`) REFERENCES `assistance` (`id_assistance`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `id device ref int` FOREIGN KEY (`id_device`) REFERENCES `device` (`id_device`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `assistance_to_faq`
--
ALTER TABLE `assistance_to_faq`
  ADD CONSTRAINT `assistance_to_faq_ibfk_1` FOREIGN KEY (`id_assistance`) REFERENCES `assistance` (`id_assistance`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `assistance_to_faq_ibfk_2` FOREIGN KEY (`id_FAQ`) REFERENCES `assistance_faq` (`id_faq`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `available_sl_service`
--
ALTER TABLE `available_sl_service`
  ADD CONSTRAINT `available_sl_service_ibfk_1` FOREIGN KEY (`id_device`) REFERENCES `device` (`id_device`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `available_sl_service_ibfk_2` FOREIGN KEY (`id_sl`) REFERENCES `sl` (`id_sl`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `device_categories_content`
--
ALTER TABLE `device_categories_content`
  ADD CONSTRAINT `device_categories_content_ibfk_1` FOREIGN KEY (`device_category`) REFERENCES `high_level_categories` (`category`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `device_categories_content_ibfk_2` FOREIGN KEY (`content`) REFERENCES `device` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `device_to_promo`
--
ALTER TABLE `device_to_promo`
  ADD CONSTRAINT `device_to_promo_ibfk_1` FOREIGN KEY (`id_device`) REFERENCES `device` (`id_device`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `device_to_promo_ibfk_2` FOREIGN KEY (`id_promo`) REFERENCES `promotion` (`id_promo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `device_to_spec`
--
ALTER TABLE `device_to_spec`
  ADD CONSTRAINT `device id referential integrity` FOREIGN KEY (`id_device`) REFERENCES `device` (`id_device`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `device_to_spec_ibfk_1` FOREIGN KEY (`id_spec`) REFERENCES `technical_spec` (`id_spec`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `for_device_1`
--
ALTER TABLE `for_device_1`
  ADD CONSTRAINT `for_device_1_ibfk_1` FOREIGN KEY (`id_sl`) REFERENCES `sl` (`id_sl`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `for_device_1_ibfk_2` FOREIGN KEY (`id_device`) REFERENCES `device` (`id_device`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `for_device_2`
--
ALTER TABLE `for_device_2`
  ADD CONSTRAINT `for_device_2_ibfk_1` FOREIGN KEY (`id_device`) REFERENCES `device` (`id_device`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `for_device_2_ibfk_2` FOREIGN KEY (`id_assistance`) REFERENCES `assistance` (`id_assistance`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sl_categories_content`
--
ALTER TABLE `sl_categories_content`
  ADD CONSTRAINT `sl_categories_content_ibfk_1` FOREIGN KEY (`sl_category`) REFERENCES `high_level_categories` (`category`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sl_categories_content_ibfk_2` FOREIGN KEY (`content`) REFERENCES `sl` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sl_to_benefits`
--
ALTER TABLE `sl_to_benefits`
  ADD CONSTRAINT `sl_to_benefits_ibfk_1` FOREIGN KEY (`id_sl`) REFERENCES `sl` (`id_sl`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sl_to_benefits_ibfk_2` FOREIGN KEY (`id_benefit`) REFERENCES `sl_benefits` (`id_benefit`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sl_to_promo`
--
ALTER TABLE `sl_to_promo`
  ADD CONSTRAINT `sl_to_promo_ibfk_1` FOREIGN KEY (`id_sl`) REFERENCES `sl` (`id_sl`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sl_to_promo_ibfk_2` FOREIGN KEY (`id_promo`) REFERENCES `promotion` (`id_promo`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
