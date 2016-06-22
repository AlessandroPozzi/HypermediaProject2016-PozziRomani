-- phpMyAdmin SQL Dump
-- version 4.1.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mag 31, 2016 alle 09:59
-- Versione del server: 5.6.29-log
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
-- Struttura della tabella `assistance`
--

CREATE TABLE IF NOT EXISTS `assistance` (
  `id_assistance` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE ascii_bin NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_assistance`),
  UNIQUE KEY `assistance name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=ascii COLLATE=ascii_bin AUTO_INCREMENT=7 ;

--
-- Dump dei dati per la tabella `assistance`
--

INSERT INTO `assistance` (`id_assistance`, `name`, `description`) VALUES
(1, 'Dettaglio delle chiamate per Clienti Ricaricabili', 'Il servizio "documentazione traffico" ti offre la possibilità di avere il dettaglio di ogni telefonata, connessione dati o altro evento, effettuato dalla tua linea (*). Per ogni evento viene fornita l’indicazione della data/ora di effettuazione, del costo, della tipologia e del numero chiamato se si tratta di traffico voce o sms (con le ultime tre cifre asteriscate - L. 171/98 "Tutela vita privata nelle telecomunicazioni"). \r\n\r\nLa documentazione del traffico è sempre disponibile in MyTIM Mobile e consultabile fino a due mesi antecedenti la data di consultazione del traffico se utilizzi una linea ricaricabile, in diversi formati facilmente consultabili ed archiviabili (esempio pdf). \r\n\r\nÈ comunque possibile richiedere l’invio di un tabulato cartaceo del traffico pregresso (equivalente al pdf già disponibile in MyTIM Mobile), o l’invio di un tabulato del traffico pregresso in chiaro (deve essere in questo caso specificato), purché rientri nei periodi sopra indicati. In questo caso dovrai compilare ed inviare l''apposito modulo di "Richiesta Documentazione Traffico" che puoi scaricare in formato pdf dalla sezione Moduli, selezionando la sottosezione Ricaricabile di riferimento. \r\n \r\n\r\n\r\n(*) alcune tipologie di traffico, per cui non è previsto un costo, possono non essere documentate.\r\n'),
(2, 'Scopri come consultare i consumi della tua linea con abbonamento', 'Puoi consultare i consumi del tuo Abbonamento\r\n \r\n\r\nDirettamente online\r\nRegistrandoti a MyTIM Mobile potrai verificare, aggiornate alla data riportata sul sito:\r\n\r\n   1. Traffico VOCE, che è composto da:\r\n\r\n"Traffico Voce Nazionale": è l''importo che comprende le chiamate effettuate dall’Italia verso numerazioni nazionali e verso numerazioni speciali.\r\n"Traffico Voce Internazionale": è l''importo che comprende le chiamate effettuate dall''Italia verso numeri esteri.\r\n"Traffico Voce PayForMe" : è l’importo complessivo del traffico voce effettuato utilizzando il servizio di addebito della chiamata "4088 PayForMe".\r\n"Traffico Roaming (Voce)": è l''importo delle chiamate effettuate e ricevute all’estero.\r\n   2. Traffico SMS/MMS, che include:\r\n\r\n"Traffico SMS": è l''importo che comprende i messaggi di testo inviati verso numerazioni mobili e di rete fissa.\r\n"Traffico MMS": è l''importo che comprende i messaggi multimediali (mms) inviati verso numerazioni mobili e di rete fissa.\r\n   3. Altro traffico dati / Servizi Interattivi, che comprende:\r\n\r\n"Navigazione wap" è l''importo che comprende il traffico effettuato per la trasmissione di dati/connessione ad internet utilizzando la modalità wap (punto di accesso alla rete dati per la connessione: wap.tim.it).\r\n"Altro traffico dati" è l''importo che comprende il traffico effettuato per la trasmissione di dati/connessione ad internet utilizzando tutti gli altri punti di accesso alla rete dati.\r\n"Wifi" è l’importo complessivo del traffico effettuato da accesso Wifi.\r\n"Servizi interattivi" è l’importo che comprende gli addebiti per la ricezione/invio di sms/mms da numerazioni brevi a contenuto speciale (esempio: logo, suoneria, sfondo), gli sms utilizzati attraverso il servizio "4088 PayForMe sms", e tutti i servizi supplementari non inclusi nei contatori precedenti.\r\n\r\nChiamando dal tuo telefonino il numero gratuito 40915: \r\nE'' importante sapere che il "traffico online" si riferisce ai consumi non inclusi nel costo di eventuali offerte e promozioni attive sulla tua linea. I consumi si riferiscono al periodo che intercorre dal primo giorno del bimestre di riferimento alla data comunicata dalla fonia. \r\nSe hai attivato una o più promozioni, al tasto 2 puoi verificare il residuo dei bonus corrispondenti e i numeri amici. Questo fa riferimento al periodo compreso tra il primo giorno del mese in corso e la data comunicata dalla fonia della voce guida. \r\n\r\nPuoi contattare il 40915 anche solo inviando un sms gratuito con le seguenti sintassi:\r\n\r\nSALTOT    per conoscere il saldo complessivo ed eventuale bonus.\r\nSALNAZ    per conoscere il saldo del traffico nazionale.\r\nSALITZ     per conoscere il saldo del traffico internazionale.\r\nSALROA   per conoscere il saldo del traffico roaming.\r\nSALSMS   per conoscere il saldo del traffico sms.\r\nSALMMS  per conoscere il saldo del traffico mms.\r\nSALWAP  per conoscere il saldo del traffico wap.\r\nSALDATI  per conoscere il saldo del traffico dati web (punto di accesso ibox.tim.it).\r\nSALWIFI  per conoscere il saldo del traffico wifi.\r\nSALVAS   per conoscere il saldo del traffico di tutti i servizi supplementari (esempio: sms interattivi).Riceverai un sms di risposta con le informazioni richieste.\r\n\r\nNavigando dal telefonino:\r\nSul sito TIM.it ottimizzato per il tuo smartphone, oppure attraverso l''App MyTIM Mobile , attualmente disponibile in download gratuito nelle versioni per iPhone e per smartphone con sistema operativo Android.'),
(3, 'La domiciliazione sul Conto Corrente per i clienti ricaricabili\n', 'A partire dal 10/12/2015, è possibile domiciliare i costi del rinnovo delle offerte su conto corrente bancario o postale.\r\nTale modalità si aggiunge all’attuale domiciliazione su carta di credito.\r\n\r\nPer richiedere la domiciliazione alla tua banca dovrai necessariamente recarti presso un Negozio TIM ed esibire la tua carta bancomat o postamat inserendo il codice PIN sul terminale POS. Al termine dell’operazione ti verrà chiesto di firmare il modulo di autorizzazione permanente di addebito in conto corrente.\r\n\r\nL’attivazione della domiciliazione non è immediata, ma necessita dell’autorizzazione dell’istituto bancario che, in una settimana circa, comunicherà l’esito della richiesta e un SMS ti avviserà che l’operazione è andata a buon fine. A seguito dell’inserimento della richiesta di domiciliazione, in attesa dell’esito da parte della banca, potrai richiedere l’attivazione di una carta servizi con modalità di addebito su “conto corrente”, se tale modalità di pagamento è prevista per la specifica offerta. In attesa della validazione della domiciliazione, il primo canone dell’offerta e il costo di attivazione devono essere pagati al punto vendita con le usuali modalità di pagamento. Nel caso in cui, nel periodo che intercorre tra l’attivazione dell’offerta ed il primo rinnovo, l’autorizzazione da parte della banca non vada a buon fine, l’offerta non sarà rinnovata.\r\n\r\nUna volta attivata la domiciliazione avrai la possibilità di acquistare anche altre offerte domiciliandone il rinnovo su conto corrente.'),
(4, 'Verifica online il tuo traffico\r\n', 'Accedendo alla sezione MyTIM Mobile del nostro sito è possibile verificare il dettaglio dei consumi relativi al traffico effettuato.\r\n\r\nSe hai una linea prepagata: è possibile verificare il dettaglio del traffico effettuato a partire dal giorno precedente e fino agli ultimi 2 mesi rispetto alla data di consultazione.\r\n \r\nSe hai sottoscritto un abbonamento: oltre a verificare il saldo dei consumi in corso di fatturazione, è possibile verificare online e scaricare il pdf del traffico telefonico effettuato entro 90 gg. dalla data di scadenza della fattura di riferimento.'),
(5, 'Attivazione linea di casa\r\n', 'Richiedere l’attivazione di una linea telefonica di casa è molto semplice, puoi:\r\n\r\nrichiederla online\r\nchiamare il Servizio Clienti linea fissa 187\r\nrecarti presso un Negozio TIM.\r\nVerifica la modalità di attivazione consultando on line le varie offerte disponibili.\r\n\r\nI dati necessari sono:\r\n\r\nnome e cognome\r\ncodice fiscale\r\nindirizzo dell''abitazione per cui richiedi l''installazione della linea\r\nun recapito telefonico di cellulare\r\nindirizzo email (facoltativo).\r\nIl nostro personale tecnico ti contatterà quanto prima per concordare l’appuntamento per l’installazione dell’impianto telefonico.'),
(6, 'MyTIM Fisso e MyTIM Mobile, le aree clienti per gestire la tua linea\n', 'Hai un unico punto di accesso per gestire online la tua linea di casa e la tua linea mobile: MyTIM\r\nAll’interno della sezione MyTIM trovi :\r\nMyTIM Mobile (il nuovo nome dell’Area Clienti 119)\r\nMyTIM Fisso (il nuovo nome dell’Area Clienti 187)\r\nLe modalità di accesso alle Aree Clienti non cambiano.\r\nPuoi accedere a MyTIM Fisso utilizzando username e password dell’Area Clienti 187 o indirizzo mail e password della mail Alice.\r\nPuoi accedere a MyTIM Mobile utilizzando come username la linea mobile e la password di 8 cifre numeriche.');

-- --------------------------------------------------------

--
-- Struttura della tabella `assistance_faq`
--

CREATE TABLE IF NOT EXISTS `assistance_faq` (
  `id_faq` int(11) NOT NULL,
  `question` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `answer` text CHARACTER SET utf8 COLLATE utf8_bin,
  PRIMARY KEY (`id_faq`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;

--
-- Dump dei dati per la tabella `assistance_faq`
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
(21, 'Cosa puoi fare nella sezione MyTIM Fisso', 'Con MyTIM Fisso hai la possibilità di:\r\nVisualizzare i tuoi dati anagrafici, con possibilità di effettuare online alcune richieste come modificare indirizzo email e password, il trasloco, il subentro ecc.;\r\nConsultare online e stampare le ultime 6 fatture e richiedere e visualizzare il traffico in chiaro;\r\nPagare la fattura con carta di credito o gestire la domiciliazione bancaria;\r\nModificare l’indirizzo di spedizione della tua fattura direttamente via web (se lo ricevi via posta ordinaria);\r\nControllare lo stato di avanzamento delle tue richieste commerciali, amministrative e tecniche;\r\nRecuperare la password che hai dimenticato.\r\n \r\nInoltre all’interno della sezione MyTIM Fisso, selezionando la voce «Richiedi assistenza tecnica" puoi:\r\nEseguire la diagnosi online della linea telefonica, ADSL o Fibra di casa, segnalare un problema ai tecnici o risolvere on line i problemi più comuni su internet, posta elettronica;\r\nEseguire la diagnosi sui servizi TV attivi (TIM SKY, IPTV) ed eventualmente segnalare un problema ai tecnici;\r\nEssere avvisato di eventuali disservizi sulla Rete Fissa TIM nella tua zona, e richiedere l’invio di un SMS o di una email alla risoluzione del guasto;\r\nGestire le tue Pratiche e monitorarne lo stato di lavorazione.\r\n ');

-- --------------------------------------------------------

--
-- Struttura della tabella `assistance_for`
--

CREATE TABLE IF NOT EXISTS `assistance_for` (
  `id_device` int(11) NOT NULL,
  `id_assistance` int(11) NOT NULL,
  `id_entry` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_entry`),
  KEY `id device` (`id_device`),
  KEY `id assistance` (`id_assistance`)
) ENGINE=InnoDB  DEFAULT CHARSET=ascii COLLATE=ascii_bin AUTO_INCREMENT=13 ;

--
-- Dump dei dati per la tabella `assistance_for`
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
-- Struttura della tabella `assistance_to_faq`
--

CREATE TABLE IF NOT EXISTS `assistance_to_faq` (
  `id_assistance` int(11) NOT NULL,
  `id_FAQ` int(11) NOT NULL,
  `id_entry` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_entry`),
  KEY `id assistance` (`id_assistance`),
  KEY `id faq` (`id_FAQ`)
) ENGINE=InnoDB  DEFAULT CHARSET=ascii COLLATE=ascii_bin AUTO_INCREMENT=22 ;

--
-- Dump dei dati per la tabella `assistance_to_faq`
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
(6, 21, 21);

-- --------------------------------------------------------

--
-- Struttura della tabella `available_sl_service`
--

CREATE TABLE IF NOT EXISTS `available_sl_service` (
  `id_device` int(11) NOT NULL,
  `id_sl` int(11) NOT NULL,
  `id_entry` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_entry`),
  KEY `id device` (`id_device`),
  KEY `id smart life` (`id_sl`)
) ENGINE=InnoDB  DEFAULT CHARSET=ascii COLLATE=ascii_bin AUTO_INCREMENT=2 ;

--
-- Dump dei dati per la tabella `available_sl_service`
--

INSERT INTO `available_sl_service` (`id_device`, `id_sl`, `id_entry`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `category_content`
--

CREATE TABLE IF NOT EXISTS `category_content` (
  `category` varchar(255) COLLATE ascii_bin NOT NULL,
  `content` varchar(255) COLLATE ascii_bin NOT NULL,
  `id_entry` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_entry`),
  KEY `category` (`category`),
  KEY `content` (`content`) COMMENT 'ref integrity on content'
) ENGINE=InnoDB  DEFAULT CHARSET=ascii COLLATE=ascii_bin AUTO_INCREMENT=28 ;

--
-- Dump dei dati per la tabella `category_content`
--

INSERT INTO `category_content` (`category`, `content`, `id_entry`) VALUES
('Smartphone e telefoni', 'Apple iPhone 6s 16GB', 1),
('Smartphone e telefoni', 'LG K8', 2),
('Smartphone e telefoni', 'Samsung GALAXY A5 (2016)', 3),
('Smartphone e telefoni', 'Apple iPhone 5s 16GB', 4),
('Modem e Networking', 'D-Link SmartHome Starter Kit', 5),
('Modem e Networking', 'Philips Friends of Hue Bloom', 6),
('Servizi alla persona', 'Fidelity Card', 7),
('Servizi alla persona', 'Pagamenti', 8),
('Servizi alla persona', 'Trasporti', 9),
('Casa e Famiglia', 'Tim Tag', 10),
('Casa e Famiglia', 'Tim Home Connect', 11),
('Tv e Smart Living', 'Pack TIMvision&Chromecast', 12),
('Promozioni', 'Apple iPhone 6s 16GB', 13),
('Promozioni', 'Apple iPhone 5s 16GB', 14),
('Promozioni', 'D-Link SmartHome Starter Kit', 15),
('Promozioni', 'Tim Tag', 16),
('Promozioni', 'Tim Home Connect', 17),
('Controllo costi e pagamenti', 'La domiciliazione sul Conto Corrente per i clienti ricaricabili', 19),
('Controllo costi e pagamenti', 'Verifica online il tuo traffico', 20),
('In evidenza', 'Verifica online il tuo traffico', 21),
('In evidenza', 'Attivazione linea di casa', 22),
('In evidenza', 'MyTIM Fisso e MyTIM Mobile, le aree clienti per gestire la tua linea', 23),
('Controllo costi e pagamenti', 'Dettaglio delle chiamate per Clienti Ricaricabili', 24),
('Controllo costi e pagamenti', 'Scopri come consultare i consumi della tua linea con abbonamento', 25),
('Gestione linea e servizi', 'Attivazione linea di casa', 26),
('Gestione linea e servizi', 'MyTIM Fisso e MyTIM Mobile, le aree clienti per gestire la tua linea', 27);

-- --------------------------------------------------------

--
-- Struttura della tabella `device`
--

CREATE TABLE IF NOT EXISTS `device` (
  `id_device` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE ascii_bin NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_device`),
  UNIQUE KEY `device name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=ascii COLLATE=ascii_bin AUTO_INCREMENT=32423433 ;

--
-- Dump dei dati per la tabella `device`
--

INSERT INTO `device` (`id_device`, `name`, `description`, `price`) VALUES
(1, 'Apple iPhone 6s 16GB', 'Display Retina HD da 4,7" con 3D Touch. Alluminio serie 7000 e vetro più resistente. Chip A9 con architettura a 64 bit di livello desktop. Nuova fotocamera iSight da 12MP con Live Photos. Touch ID. Connessioni Wi-Fi e 4G LTE più veloci.1 Batteria a lunga durata.2 E ancora, iOS 9 e iCloud. Il tutto in un elegante guscio unibody.', 789.90),
(2, 'LG K8', 'SCEGLI IL TUO STILE\r\n\r\nLa nuova serie K di LG ti offre una gamma di smartphone che rispecchiano la tua personalità. LG K8 ti accompagna nei tuoi viaggi e ti sorprenderà con selfie dettagliati tutti da condividere con la velocità della rete 4G LTE\r\n\r\nDESIGN CON VETRO SMUSSATO\r\n\r\nDatti un tono! LG K8 ha un design che lascia a bocca aperta grazie al profilo del vetro smussato e alla forma arrotondata. In più è più ergonomico e garantisce una presa più salda grazie alla lavorazione della cover posteriore.\r\n\r\nFOTOCAMERA E FLASH VIRTUALE\r\n\r\nCattura i le situazioni più divertenti della giornata con la fotocamera da 8 Megapixel. E'' sufficiente un tocco sul display e K8 mette a fuoco e scatta immediatamente. Anche per i selfie puoi contare sulla fotocamera frontale da 5 Megapixel con la funzione flash virtuale che illumina il tuo volto, così i tuoi selfie saranno illuminati come si deve, mentre tutti gli altri... scatteranno selfie scuri!\r\n\r\nDISPLAY DA 5"\r\n\r\nGuarda le tue foto e i tuoi video sul display ampio da ben 5".', 179.90),
(3, 'Samsung GALAXY A5 (2016)', 'Un mix perfetto tra vetro e metallo\r\n\r\nLa combinazione tra metallo e Gorilla Glass rendono il nuovo Galaxy A5 2016 accattivante e alla moda. Goditi una presa ancora più sicura e confortevole accompagnata da un design snello e una cornice ancora più sottile.\r\n\r\nMaggiore potenza\r\n\r\nSperimenta le straordinarie prestazioni dell''hardware e la velocità di navigazione ultrarapida. Il processore Octa Core l''accesso alla rete 4G/LTE e la RAM da 2GB assicurano un caricamento perfetto delle pagine Internet, una transizione impeccabile dell''interfaccia utente e un multi-tasking ancora più rapido\r\n\r\nImmagini più nitide e luminose\r\n\r\nLe fotocamere anteriore e posteriore sono dotate di apertura f/1.9 per offrire immagini straordinariamente chiare, anche in condizioni di scarsa illuminazione. Grazie allo stabilizzatore ottico di immagine (OIS) potrai scattare immagini e realizzare video senza sfocature. Infine, dopo aver cliccato due volte il pulsante Home in pochi secondi sarai pronto a catturare i momenti più importanti.', 429.90),
(4, 'Apple iPhone 5s 16GB', 'Chip A7 con architettura a 64 bit, sensore di impronte digitali Touch ID,nuova fotocamera iSight da 8 megapixel e nuova videocamera FaceTime HD,reti 4G LTE1 ultraveloci, iOS 8 e iCloud: iPhone 5s è davvero all’avanguardia.Eppure è sottile e leggero come sempre', 479.90),
(5, 'D-Link SmartHome Starter Kit', 'Con lo Smart Home HD Starter Kit potrai impostare, controllare, monitorare e automatizzare la tua casa ovunque ti trovi.\r\nNel Kit sono inclusi:\r\n\r\nUn Monitor HD (DCS-935L) \r\nUn Wi-Fi Motion Sensor (DCH-S150)\r\nUna smart plug (DSP-W215) \r\nTramite l''App mydlink Home per smartphone e tablet hai a disposizione il controllo di tutti i dispositivi così da semplificarti la gestione della casa rendendola più sicura e intelligente.\r\n\r\nFacile configurazione e gestione dei tuoi dispositivi\r\n\r\nBasta semplicemente scaricare l’app mydlink Home e la configurazione guidata ti aiuterà a utilizzare al meglio tutti i dispositivi presenti nel kit in modo facile e intuitivo.\r\nCon l’app potrai creare tu stesso le regole per accendere e spegnere i tuoi elettrodomestici quando e ovunque vuoi. \r\n\r\nNotifiche automatiche e real time sul tuo smartphone\r\n\r\nL’app mydlink Home ti notificherà quando:\r\nUn movimento o un suono viene rilevato\r\nUn dispositivo è stato acceso o spento\r\nIl consumo elettrico è stato superato\r\nUn dispositivo non funziona correttamente o si surriscalda\r\nIl sensore di movimento a infrarossi passivo riduce di gran lunga i falsi allarmi garantendoti di essere avvisato solo quando necessario: rilevazione dei movimenti fino a 8 metri (100° orizzontale, 80° verticale).', 159.90),
(6, 'Philips Friends of Hue Bloom', 'Colora il tuo mondo di luce, che siano i colori luminosi del giorno o le sfumature dorate dell''autunno, lo starter kit Philips Friends of hue Bloom bianco ti consente di creare l''illuminazione che desideri tramite smartphone o altri dispositivi.', 179.95),
(7, 'Pack TIMvision&Chromecast', 'Con Chromecast porti TIMvision, i tuoi video, le foto e molto altro ancora su qualsiasi TV usando semplicemente uno smartphone o il tablet ed una connessione Internet Wi-Fi, tutto senza consumare GB.\r\n\r\nCon l’App TIMvision potrai vedere cartoni, cinema, serie TV, documentari sempre on demand. Creare il tuo palinsesto senza interruzioni pubblicitarie ed avere più di 8.000 titoli disponibili in un solo abbonamento mensile ed il programma inizia quando vuoi tu sulla TV di casa.\r\n\r\nNon devi fare altro che utilizzare il tuo smartphone, il tablet come un telecomando per riprodurre contenuti direttamente sulla tua TV, mettere in pausa e regolare il volume.\r\n\r\nSe sei cliente TIM, puoi acquistare il Pack TIMvision&Chromecast anche presso un Negozio TIM, hai TIMvision sempre incluso per i primi 3 mesi.\r\n\r\nChromecast è un dispositivo di streaming multimediale che, una volta inserito in una qualsiasi porta HDMI, ti permette di trasmettere i contenuti preferiti direttamente sullo schermo della TV di casa. È piccolo, leggero, economico, facile da installare ed ancora più semplice da usare.\r\n\r\nPuoi trasmettere le pagine di un sito web dal browser Chrome\r\no riprodurre i contenuti visualizzati sul tuo smartphone o tablet\r\ndirettamente sulla TV. Puoi riprodurre tutti i contenuti che trovi online.', 39.00);

-- --------------------------------------------------------

--
-- Struttura della tabella `device_to_promo`
--

CREATE TABLE IF NOT EXISTS `device_to_promo` (
  `id_device` int(11) NOT NULL,
  `id_promo` int(11) NOT NULL,
  `id_entry` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_entry`),
  KEY `id promo` (`id_promo`),
  KEY `id device` (`id_device`)
) ENGINE=InnoDB  DEFAULT CHARSET=ascii COLLATE=ascii_bin AUTO_INCREMENT=4 ;

--
-- Dump dei dati per la tabella `device_to_promo`
--

INSERT INTO `device_to_promo` (`id_device`, `id_promo`, `id_entry`) VALUES
(1, 1, 1),
(4, 2, 2),
(5, 3, 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `device_to_spec`
--

CREATE TABLE IF NOT EXISTS `device_to_spec` (
  `id_device` int(11) NOT NULL,
  `id_spec` int(11) NOT NULL,
  `id_entry` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_entry`),
  KEY `id_device` (`id_device`),
  KEY `id_specification` (`id_spec`)
) ENGINE=InnoDB  DEFAULT CHARSET=ascii COLLATE=ascii_bin AUTO_INCREMENT=86 ;

--
-- Dump dei dati per la tabella `device_to_spec`
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
(7, 79, 84);

-- --------------------------------------------------------

--
-- Struttura della tabella `for_device_1`
--

CREATE TABLE IF NOT EXISTS `for_device_1` (
  `id_sl` int(11) NOT NULL,
  `id_device` int(11) NOT NULL,
  `id_entry` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_entry`),
  KEY `id sl` (`id_sl`),
  KEY `id device` (`id_device`)
) ENGINE=InnoDB  DEFAULT CHARSET=ascii COLLATE=ascii_bin AUTO_INCREMENT=4 ;

--
-- Dump dei dati per la tabella `for_device_1`
--

INSERT INTO `for_device_1` (`id_sl`, `id_device`, `id_entry`) VALUES
(4, 5, 1),
(4, 6, 2),
(2, 3, 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `for_device_2`
--

CREATE TABLE IF NOT EXISTS `for_device_2` (
  `id_assistance` int(11) NOT NULL,
  `id_device` int(11) NOT NULL,
  `id_entry` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_entry`),
  KEY `id device` (`id_device`),
  KEY `id assistance` (`id_assistance`)
) ENGINE=InnoDB  DEFAULT CHARSET=ascii COLLATE=ascii_bin AUTO_INCREMENT=13 ;

--
-- Dump dei dati per la tabella `for_device_2`
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
-- Struttura della tabella `high_level_categories`
--

CREATE TABLE IF NOT EXISTS `high_level_categories` (
  `macro_group` varchar(255) COLLATE ascii_bin NOT NULL,
  `category` varchar(255) COLLATE ascii_bin NOT NULL,
  PRIMARY KEY (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;

--
-- Dump dei dati per la tabella `high_level_categories`
--

INSERT INTO `high_level_categories` (`macro_group`, `category`) VALUES
('SMART LIFE', 'Casa e Famiglia'),
('ASSISTENZA', 'Controllo costi e pagamenti'),
('ASSISTENZA', 'Gestione linea e servizi'),
('ASSISTENZA', 'In evidenza'),
('DISPOSITIVI', 'Modem e Networking'),
('DISPOSITIVI', 'Outlet'),
('PROMOZIONI', 'Promozioni'),
('SMART LIFE', 'Salute e Benessere'),
('SMART LIFE', 'Servizi alla persona'),
('ASSISTENZA', 'Smart Life'),
('DISPOSITIVI', 'Smartphone e telefoni'),
('ASSISTENZA', 'Supporto tecnico e configurazione'),
('SMART LIFE', 'TV & Entertainment'),
('DISPOSITIVI', 'Tablet e Computer'),
('DISPOSITIVI', 'Tv e Smart Living');

-- --------------------------------------------------------

--
-- Struttura della tabella `promotion`
--

CREATE TABLE IF NOT EXISTS `promotion` (
  `id_promo` int(11) NOT NULL,
  `new_price` decimal(10,2) DEFAULT NULL,
  `payment_instalments` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `other_promo` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id_promo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `promotion`
--

INSERT INTO `promotion` (`id_promo`, `new_price`, `payment_instalments`, `other_promo`) VALUES
(1, NULL, 'in 36 rate senza interessi\r\n21,94 €/mese (se hai una linea di casa TIM)', NULL),
(2, 429.90, NULL, NULL),
(3, NULL, 'In promozione a 120 € in 24 rate\r\n5 €/mese (se hai una linea di casa TIM)', NULL),
(100, NULL, NULL, '129 euro:\r\n RILEVATORE GPS\r\n+12 MESI DI SERVIZIO'),
(101, 36.00, '3 euro al mese a partire dal 25° mese', 'TIM Home Connect 24\r\n 24 mesi senza pensieri! '),
(102, 24.00, '3 euro al mese a partire dal 13° mese', 'TIM Home Connect 12\r\n12 mesi senza pensieri! '),
(103, 5.00, '3 euro al mese', 'TIM Home Connect Light\r\n L''offerta che si rinnova ogni mese!');

-- --------------------------------------------------------

--
-- Struttura della tabella `sl`
--

CREATE TABLE IF NOT EXISTS `sl` (
  `id_sl` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `description` text COLLATE utf8_bin NOT NULL,
  `price` int(11) DEFAULT NULL,
  `how_to` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_sl`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=6 ;

--
-- Dump dei dati per la tabella `sl`
--

INSERT INTO `sl` (`id_sl`, `name`, `description`, `price`, `how_to`) VALUES
(1, 'Fidelity Card', 'Salva nel TIM Wallet le tue carte fedeltà per averle sempre con te', NULL, 'Con TIM Wallet puoi virtualizzare le tue carte fedelta'' e portarle sempre con te. \r\nAccedi alla Vetrina Servizi e in pochi passaggi puoi acquisire tutte le tue carte fedeltà. \r\nInquadra la carta nel riquadro e attendi che venga riconosciuta. \r\nIl riconoscimento della tessera é automatico, tuttavia se la tessera non viene riconosciuta tra le carte presenti puoi comunque aggiungerla utilizzando la fotocamera del tuo smartphone: seleziona il tipo di codice riportato sulla tessera (codice a barre, QRCode o codice numerico) e inquadralo. Se il codice non viene riconosciuto automaticamente, può essere inserito anche manualmente. \r\nIn breve puoi vedere la tessera nel portafogli. \r\nPuoi mostrarla nei punti vendita abilitati direttamente dal tuo smartphone: se clicchi sull''immagine della carta in automatico ruota e ti mostra il codice a barre (attenzione: non tutti i punti vendita hanno i lettori di codice a barre abilitati!)'),
(2, 'Pagamenti', 'Con TIM Wallet puoi utilizzare il tuo smartphone per pagare in tutti i negozi abilitati.\r\nScopri subito TIM SmartPAY, la carta prepagata nata dalla partnership fra Intesa Sanpaolo e TIM dedicata a tutti i clienti TIM, oppure scegli la carta di pagamento che preferisci tra quelle disponibili di Intesa Sanpaolo, Mediolanum, BNL o Hello bank!.\r\n\r\nTIM SmartPAY è la carta di pagamento prepagata conveniente e sicura, realizzata in collaborazione con Intesa Sanpaolo e VISA. \r\nLa TIM SmartPAY è una carta dedicata ai clienti TIM.\r\n\r\nPuoi richiederla ed utilizzarla sin da subito per fare acquisti con il tuo smartphone NFC * e su Internet.', NULL, 'Scarica l’app TIM Wallet da Google Play su uno smartphone NFC Android.\r\n\r\nCollega la TIM SmartPAY o aggiungi la carta di pagamento che preferisci tra quelle disponibili nella vetrina.\r\n\r\nAl momento del pagamento seleziona la carta che vuoi utilizzare, premi “Paga” e avvicina lo smartphone al POS contactless. Ricevei la conferma che il pagamento è stato effettuato direttamente sul display dello smartphone.\r\nNEGOZI ABILITATI'),
(3, 'Trasporti', 'Compra un biglietto via SMS e pagalo direttamente con il tuo credito telefonico\r\n', NULL, 'Apri TIM Wallet e accedi alla Vetrina Servizi. \r\nSe la città che ti interessa é abilitata, clicca e acquista il biglietto. \r\nPaghi direttamente con il tuo credito telefonico (se sei un Cliente Ricaricabile) o con addebito in bolletta (se sei un Cliente con Abbonamento). \r\n\r\nAttenzione: ti verranno addebitati il costo del biglietto più il costo dell’SMS di richiesta (19,90 €cent IVA inclusa). \r\n\r\nRicevi un SMS, il biglietto è valido da quel momento senza necessità di ulteriori convalide. \r\nPuoi trovare il biglietto elettronico direttamente nel TIM Wallet nel tuo portafogli, puoi rinnovarlo quando scade. In caso di controllo, mostra l’SMS di conferma che hai ricevuto.\r\n\r\nA Milano puoi utilizzare anche la modalità QRCode. Dopo aver acquistato il biglietto della metropolitana e ricevuto l’SMS, ricevi anche il QRCode che permette di aprire i tornelli della metropolitana. E’ sufficiente visualizzare il QRCode e accostare il display dello smartphone all’apposito lettore.'),
(4, 'Tim Tag', 'TIMTag è il dispositivo che ti informa sulla posizione del tuo amico a quattro zampe e delle cose a te più care.\r\nSegui in tempo reale i suoi spostamenti sul tuo smartphone senza perderlo mai di vista.\r\n\r\nCon TIMTag hai un dispositivo di localizzazione GPS di ultima generazione, con 12 mesi di servizio TIMTag e una TIM Card inclusi e un'' App dedicata intuitiva e semplice da utilizzare!', NULL, 'Acquista il Pack TIMTag:\r\nAcquista subito online e ricevi direttamente a casa tua il pack oppure vai in uno dei negozi TIM.\r\n\r\nAttiva la TIM Card:\r\nRegistra la TIM Card che trovi nel Pack in un negozio TIM (l''offerta TIMTag si attiverà automaticamente dopo la registrazione).\r\n\r\nScarica l''APP TIMTag sul tuo Smartphone:\r\nInstalla l''app sul tuo smartphone ed associa il dispositivo di localizzazione (Android ed iOS).'),
(5, 'Tim Home Connect', 'TIM Home Connect è l’offerta pensata per essere utilizzata nei dispositivi di domotica presenti nella casa, la cui gestione prevede l''uso di una SIM\r\n\r\nCon Tim Home Connect infatti hai a disposizione minuti, MB e SMS da utilizzare per connettere e gestire il tuo antifurto, la tua caldaia o altri sistemi di domotica.\r\n\r\n \r\n', NULL, '1) Se sei già in possesso di una TIM Card, direttamente online cliccando sul tasto ATTIVA\r\n\r\n2) Presso i Negozi TIM');

-- --------------------------------------------------------

--
-- Struttura della tabella `sl_benefits`
--

CREATE TABLE IF NOT EXISTS `sl_benefits` (
  `id_benefit` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_benefit`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;

--
-- Dump dei dati per la tabella `sl_benefits`
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
(16, 'SMS', '100 SMS verso tutti\r\n');

-- --------------------------------------------------------

--
-- Struttura della tabella `sl_to_benefits`
--

CREATE TABLE IF NOT EXISTS `sl_to_benefits` (
  `id_sl` int(11) NOT NULL,
  `id_benefits` int(11) NOT NULL,
  `id_entry` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_entry`),
  KEY `id sl` (`id_sl`),
  KEY `id benefit` (`id_benefits`)
) ENGINE=InnoDB  DEFAULT CHARSET=ascii COLLATE=ascii_bin AUTO_INCREMENT=17 ;

--
-- Dump dei dati per la tabella `sl_to_benefits`
--

INSERT INTO `sl_to_benefits` (`id_sl`, `id_benefits`, `id_entry`) VALUES
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
(5, 16, 16);

-- --------------------------------------------------------

--
-- Struttura della tabella `sl_to_promo`
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
-- Dump dei dati per la tabella `sl_to_promo`
--

INSERT INTO `sl_to_promo` (`id_sl`, `id_promo`, `id_entry`) VALUES
(4, 100, 1),
(5, 101, 2),
(5, 102, 3),
(5, 103, 4);

-- --------------------------------------------------------

--
-- Struttura della tabella `technical_spec`
--

CREATE TABLE IF NOT EXISTS `technical_spec` (
  `id_spec` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `content` varchar(511) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_spec`)
) ENGINE=InnoDB  DEFAULT CHARSET=ascii COLLATE=ascii_bin AUTO_INCREMENT=81 ;

--
-- Dump dei dati per la tabella `technical_spec`
--

INSERT INTO `technical_spec` (`id_spec`, `name`, `content`) VALUES
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
(79, 'Sistema Operativo Supportato', 'Android 4.1 e versioni successive\r\niOS 7.0 e versioni successive\r\nWindows 7 e versioni successive\r\nMac OS X 10.7 e versioni successive\r\nChrome OS');

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `assistance_for`
--
ALTER TABLE `assistance_for`
  ADD CONSTRAINT `id assistance ref int` FOREIGN KEY (`id_assistance`) REFERENCES `assistance` (`id_assistance`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `id device ref int` FOREIGN KEY (`id_device`) REFERENCES `device` (`id_device`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `assistance_to_faq`
--
ALTER TABLE `assistance_to_faq`
  ADD CONSTRAINT `assistance_to_faq_ibfk_1` FOREIGN KEY (`id_assistance`) REFERENCES `assistance` (`id_assistance`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `assistance_to_faq_ibfk_2` FOREIGN KEY (`id_FAQ`) REFERENCES `assistance_faq` (`id_faq`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `available_sl_service`
--
ALTER TABLE `available_sl_service`
  ADD CONSTRAINT `available_sl_service_ibfk_1` FOREIGN KEY (`id_device`) REFERENCES `device` (`id_device`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `available_sl_service_ibfk_2` FOREIGN KEY (`id_sl`) REFERENCES `sl` (`id_sl`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `category_content`
--
ALTER TABLE `category_content`
  ADD CONSTRAINT `category_content_ibfk_1` FOREIGN KEY (`category`) REFERENCES `high_level_categories` (`category`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `device_to_promo`
--
ALTER TABLE `device_to_promo`
  ADD CONSTRAINT `device_to_promo_ibfk_1` FOREIGN KEY (`id_device`) REFERENCES `device` (`id_device`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `device_to_promo_ibfk_2` FOREIGN KEY (`id_promo`) REFERENCES `promotion` (`id_promo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `device_to_spec`
--
ALTER TABLE `device_to_spec`
  ADD CONSTRAINT `device id referential integrity` FOREIGN KEY (`id_device`) REFERENCES `device` (`id_device`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `device_to_spec_ibfk_1` FOREIGN KEY (`id_spec`) REFERENCES `technical_spec` (`id_spec`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `for_device_1`
--
ALTER TABLE `for_device_1`
  ADD CONSTRAINT `for_device_1_ibfk_1` FOREIGN KEY (`id_sl`) REFERENCES `sl` (`id_sl`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `for_device_1_ibfk_2` FOREIGN KEY (`id_device`) REFERENCES `device` (`id_device`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `for_device_2`
--
ALTER TABLE `for_device_2`
  ADD CONSTRAINT `for_device_2_ibfk_1` FOREIGN KEY (`id_device`) REFERENCES `device` (`id_device`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `for_device_2_ibfk_2` FOREIGN KEY (`id_assistance`) REFERENCES `assistance` (`id_assistance`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `sl_to_benefits`
--
ALTER TABLE `sl_to_benefits`
  ADD CONSTRAINT `sl_to_benefits_ibfk_1` FOREIGN KEY (`id_sl`) REFERENCES `sl` (`id_sl`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sl_to_benefits_ibfk_2` FOREIGN KEY (`id_benefits`) REFERENCES `sl_benefits` (`id_benefit`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `sl_to_promo`
--
ALTER TABLE `sl_to_promo`
  ADD CONSTRAINT `sl_to_promo_ibfk_1` FOREIGN KEY (`id_sl`) REFERENCES `sl` (`id_sl`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sl_to_promo_ibfk_2` FOREIGN KEY (`id_promo`) REFERENCES `promotion` (`id_promo`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
