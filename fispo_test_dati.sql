-- phpMyAdmin SQL Dump
-- version 3.4.9
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generato il: Mag 20, 2012 alle 23:18
-- Versione del server: 5.5.20
-- Versione PHP: 5.3.9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `fispo`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `accounts`
--

DROP TABLE IF EXISTS `accounts`;
CREATE TABLE IF NOT EXISTS `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `confirmation_sent_at` datetime DEFAULT NULL,
  `unconfirmed_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_accounts_on_username` (`username`),
  KEY `index_accounts_on_email` (`email`),
  KEY `index_accounts_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dump dei dati per la tabella `accounts`
--

INSERT INTO `accounts` (`id`, `email`, `encrypted_password`, `reset_password_token`, `reset_password_sent_at`, `remember_created_at`, `sign_in_count`, `current_sign_in_at`, `last_sign_in_at`, `current_sign_in_ip`, `last_sign_in_ip`, `confirmation_token`, `confirmed_at`, `confirmation_sent_at`, `unconfirmed_email`, `created_at`, `updated_at`, `username`) VALUES
(3, 'admin@admin.com', '$2a$10$dPflI9s/.9y/YRrit3catuHME32W4.PJJglgNRKY96AgvudyWlLzm', NULL, NULL, NULL, 4, '2012-05-20 19:56:09', '2012-05-20 14:21:52', '127.0.0.1', '127.0.0.1', NULL, NULL, NULL, NULL, '2012-05-20 09:56:30', '2012-05-20 19:56:09', 'admin2');

-- --------------------------------------------------------

--
-- Struttura della tabella `contents`
--

DROP TABLE IF EXISTS `contents`;
CREATE TABLE IF NOT EXISTS `contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `edition_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `ordinamento` int(11) DEFAULT NULL,
  `se_sommario` tinyint(1) DEFAULT NULL,
  `riassunto` text COLLATE utf8_unicode_ci,
  `titolo` text COLLATE utf8_unicode_ci,
  `testo` text COLLATE utf8_unicode_ci,
  `riferimento` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `se_visible_web` tinyint(1) DEFAULT NULL,
  `data_scadenza` datetime DEFAULT NULL,
  `se_visible_data` tinyint(1) DEFAULT NULL,
  `se_visible_newsletter` tinyint(1) DEFAULT NULL,
  `se_protetto` tinyint(1) DEFAULT NULL,
  `immagine_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `titolo_no_format` text COLLATE utf8_unicode_ci,
  `testo_no_format` text COLLATE utf8_unicode_ci,
  `riassunto_no_format` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dump dei dati per la tabella `contents`
--

INSERT INTO `contents` (`id`, `edition_id`, `section_id`, `ordinamento`, `se_sommario`, `riassunto`, `titolo`, `testo`, `riferimento`, `se_visible_web`, `data_scadenza`, `se_visible_data`, `se_visible_newsletter`, `se_protetto`, `immagine_url`, `titolo_no_format`, `testo_no_format`, `riassunto_no_format`, `created_at`, `updated_at`) VALUES
(1, 2130, 3, 0, 0, 'La sentenza della Commissione Tributaria Provinciale di Ascoli Piceno n. 50_02_12, pronunciata il 22/02/2012 e depositata in segreteria il 02/05/2012, offre una lettura molto interessante e, ad avviso di chi scrive, corretta, in materia di disconoscimento della natura sportiva dilettantistica di una ASD, con conseguente disapplicazione delle agevolazioni ex l. n. 398/1991.', 'UNA INTERESSANTE SENTENZA IN MATERIA DI DISCONOSCIMENTO DELLA NATURA SPORTIVA DILETTANTISTICA', 'La sentenza della Commissione Tributaria Provinciale di Ascoli Piceno n. 50_02_12, pronunciata il 22/02/2012 e depositata in segreteria il 02/05/2012, offre una lettura molto interessante e, ad avviso di chi scrive, corretta, in materia di disconoscimento della natura sportiva dilettantistica di una ASD, con conseguente disapplicazione delle agevolazioni ex l. n. 398/1991.\r\nLa CTP dispone che, in presenza di riconoscimento sportivo rilasciato dal CONI attraverso l’iscrizione (ancorchè, nel caso specifico, tardiva rispetto all’esercizio oggetto di accertamento) l’Agenzia delle Entrate non può, ai sensi dell’art. 149 T.U.I.R., disconoscere la natura sportiva dilettantistica del sodalizio e, conseguentemente, disconoscere la spettanza dell’applicazione delle agevolazioni tributarie connesse a tale qualifica, prime fra tutte quelle previste dalla Legge 398/1991\r\n\r\n1.  La fattispecie oggetto di contestazione\r\n\r\nL’ASD accertata, che sin dalla sua costituzione ha sempre partecipato a campionati organizzati dalla FIGC, aveva perfezionato l’iscrizione al “registro CONI” nel corso dell’esercizio 2010.\r\n\r\nL’Agenzia delle  Entrate, sulla base di tale circostanza, ha contestato l’assenza di riconoscimento sportivo in relazione agli anni precedenti l’iscrizione e, in particolare, in relazione all’esercizio 2005/2006 oggetto della sentenza qui annotata.\r\nCome conseguenza della presunta assenza di riconoscimento ai fini sportivi l’Agenzia delle Entrate ha disconosciuto la spettanza delle agevolazioni ex l. n. 398/1991, contestando il mancato versamento dell’IVA “piena” sull’ammontare dei ricavi fatturati e ricostruendo un reddito di impresa pari ad oltre 135.000 € \r\n\r\nLa perdita dei benefici ex l. n. 398/1991 era motivata, in sede di accertamento, anche in relazione ad alcune contestazioni “minori” tra le quali l’esistenza di un paio di pagamenti effettuati in contanti per importi superiori al limite consentito.\r\n\r\n2.   Le motivazioni della sentenza \r\n\r\na)    In primo luogo la CTP accoglie le doglianza dell’ASD ricorrente in merito alla valenza retroattiva dell’iscrizione al registro CONI rilevando come, a seguito delle note vicende più volte evidenziate su questa Rivista (v. per tutte Newsletter n. 16/2011 del 22/09/11), per espressa presa di posizione del CONI stesso l’iscrizione al registro, ancorchè tardiva ma perfezionata antecedentemente al 31/12/2010, deve intendersi efficace, in presenza di regolare affiliazione a una FSN, anche per il passato.\r\n\r\nb)    A seguito di quanto sopra la CTP accoglie la richiesta della ricorrente relativamente all’illegittimità del contestato disconoscimento della natura sportiva dilettantistica del sodalizio e, conseguentemente, dell’applicabilità dell’esimente di cui all’ultimo comma dell’art. 149 T.U.I.R. in merito alla perdita di qualifica di Ente Non Commerciale.\r\n\r\nc)    Ne consegue la conferma della spettanza delle agevolazioni ex l. n. 398/1991 usufruite dall’ASD ricorrente e l’accoglimento delle ragioni del ricorso (fatta salva una contestazione “minore” relativa ad un omesso versamento IVA trimestrale).\r\n\r\nSin qui la parte, per così dire “lineare” della sentenza.\r\n\r\nMa la parte più interessante appare quella relativa all’accoglimento di altre due eccezioni sollevate in sede di ricorso:\r\n\r\nd)    la prima, relativa al principio di affidamento del contribuente il quale, confidando nel comportamento concludente delle autorità sportive - che, a seguito della perfezionata affiliazione, avevano sempre ammesso l’ASD a partecipare  alle manifestazioni federali (addirittura cogliendo una promozione in una serie superiore) - e seguendo le direttive sia federali sia del CONI, aveva utilizzato in perfetta buona fede le agevolazioni spettanti alle ASD;\r\n\r\ne)    la seconda, relativa al recepimento delle note “raccomandazioni” del Direttore dell’Agenzia delle Entrate Dott. Befera che ha invitato gli uffici a non cercare ad ogni costo “pseudo violazioni formali” per giustificare accertamenti deboli sotto il profilo sostanziale, raccomandazione applicata, nel caso di specie, alla fattispecie dei pochi pagamenti in contanti “sopra soglia”  che, per espressa valutazione della CTP, non hanno comportato danno alcuno all’Erario.\r\n\r\nOccorrerà seguire l’evolversi del contenzioso in caso di appello dell’Agenzia in C.T.R e, in questo caso, la tenuta delle conclusioni sopra evidenziate sub e), ma il principio merita di essere sottolineato dal momento che rappresenta, a quanto ci risulta, la prima presa di posizione in tal senso, presa di posizione che si condivide pienamente in linea di principio e che, ci si augura, possa essere seguita anche da altri organi di giurisdizione e, perché no, dagli stessi Uffici di controllo dell’Agenzia delle Entrate.\r\n\r\nFiscosport seguirà passo passo la vicenda e non mancherà di aggiornare i lettori sull’evoluzione della stessa nei gradi successivi del giudizio in caso di proposizione di appello da parte dell’Ufficio.\r\n\r\n* Giuliano Sinibaldi, Dottore Commercialista e Revisore Contabile in Pesaro\r\n', '', 0, '2012-03-30 13:35:00', 0, 0, 0, 'm1.png', 'Ing. Dott.  GERMANO REALE', '', 'collaboratore del wwf', '2012-03-30 13:37:21', '2012-05-20 16:26:51'),
(2, 1, 4, 0, 0, 'Il presente lavoro vuole analizzare le differenze tra le due diverse tipologie di proventi contemplate dall’art. 25 della l. n. 133/1999 che possono godere della non imponibilità ai fini IRES, ove conseguiti da associazioni e società sportive dilettantistiche. Le due fattispecie previste dalla norma sono le seguenti: a)  i proventi realizzati nello svolgimento di attività commerciali connesse agli scopi istituzionali;  b)  i proventi realizzati mediante raccolta pubblica di fondi effettuata in conformità all’articolo 143, comma 3, lettera a), del T.U.I.R., ovvero “raccolte pubbliche effettuate occasionalmente, anche mediante offerte di beni di modico valore o di servizi ai sovventori, in concomitanza di celebrazioni, ricorrenze o campagne di sensibilizzazione”', 'Attività commerciale connessa agli scopi istituzionali e raccolta pubblica di fondi: punti in comune, differenze e dubbi operativi', '1. Premessa\r\n\r\nIl presente lavoro vuole analizzare le differenze tra le due diverse tipologie di proventi contemplate dall’art. 25 della l. n. 133/1999 che possono godere della non imponibilità ai fini IRES, ove conseguiti da associazioni e società sportive dilettantistiche.\r\n\r\nLe due fattispecie previste dalla norma sono le seguenti:\r\n\r\na)  i proventi realizzati nello svolgimento di attività commerciali connesse agli scopi istituzionali;\r\nb)  i proventi realizzati mediante raccolta pubblica di fondi effettuata in conformità all’articolo 143, comma 3, lettera a), del T.U.I.R.1, ovvero “raccolte pubbliche effettuate occasionalmente, anche mediante offerte di beni di modico valore o di servizi ai sovventori, in concomitanza di celebrazioni, ricorrenze o campagne di sensibilizzazione”.\r\n\r\nL''importanza della differenziazione si pone in quanto, mentre da un lato le due tipologie hanno il medesimo trattamento ai fini IRES – ovvero di non imponibilità - è molto dibattuto il rispettivo trattamento ai fini IVA.\r\n\r\nSi rileva – tra l’altro – che anche la guida dell’Agenzia delle Entrate rischia di indurre l’operatore in errore, in quanto nel corso della trattazione viene fatto riferimento esclusivamente alla raccolta pubblica di fondi (lett. b), evidenziandone il non assoggettamento a IVA, ma non viene mai presa in considerazione l’altra fattispecie (lett. a) e non ne vengono evidenziate le differenze (vedasi il paragrafo “La raccolta dei fondi”, p. 25 della Guida AdE “Le agevolazioni fiscali a favore dell’attività sportiva dilettantistica”, anno 2007).\r\n\r\nPreliminarmente, è doveroso evidenziare che la normativa in oggetto – dedicata agli enti sportivi dilettantistici – rappresenta una limitazione rispetto alla più ampia portata della disciplina applicabile agli altri enti non commerciali, in quanto l’art. 143 del T.U.I.R. non pone alcun limite al conseguimento dei proventi derivanti dalla “raccolta pubblica di fondi”, mentre l’art. 25 della l. n. 133/1999 – come vedremo oltre – pone due limitazioni, una di carattere temporale e l’altra relativa all’importo massimo realizzabile.\r\n\r\n2. La fonte normativa\r\n\r\nL’art. 25, comma 1, della l. 13 maggio 1999, n.133 prevede che “Per le associazioni sportive dilettantistiche, …, che si avvalgono dell’opzione di cui all’articolo 1 della legge 16 dicembre 1991, n. 398, e successive modificazioni, non concorrono a formare il reddito imponibile, per un numero di eventi complessivamente non superiore a due per anno e per un importo non superiore al limite annuo complessivo (nda: euro 51.645,69) … :\r\na) i proventi realizzati dalle associazioni nello svolgimento di attività commerciali connesse agli scopi istituzionali;\r\nb) i proventi realizzati per il tramite della raccolta pubblica di fondi effettuata in conformità all’articolo 108, comma 2-bis (n.d.r. ora art. 143, comma 3), lettera a), del testo unico delle imposte sui redditi, approvato con decreto del Presidente della Repubblica 22 dicembre 1986, n. 917, e successive modificazioni, in materia di formazione del reddito complessivo.”\r\n\r\nIl d.m. n. 473/1999, all’art. 1, co. 3, primo periodo, fissa il carattere di “occasionalità” e “saltuarietà” dei due eventi: “Ai sensi dell''articolo 25, comma 1, della legge 13 maggio 1999, n. 133, non concorrono a formare il reddito imponibile delle associazioni sportive dilettantistiche indicate nel comma 1 i proventi derivanti dallo svolgimento di attività commerciali connesse agli scopi istituzionali e quelli realizzati a seguito di raccolte di fondi effettuate con qualsiasi modalità, purche'' le attività e le raccolte di fondi anzidette abbiano carattere di occasionalità e saltuarietà.”\r\n\r\nLa fattispecie è stata oggetto di approfondimento e chiarimenti da parte dell’Agenzia delle Entrate attraverso la Circ. n. 43E del 08/03/2000, avente ad oggetto “Disposizioni in materia di società sportive dilettantistiche. Articolo 25 della legge 13 maggio 1999, n.133 e relativo regolamento di attuazione del 26 novembre 1999, n.473.”\r\n\r\n3.  Proventi e raccolta pubblica di fondi: requisiti comuni e differenze\r\n\r\nAnalizziamo i requisiti comuni alle due fattispecie:\r\n\r\n1)  l’associazione/società sportiva dilettantistica deve avvalersi del regime forfetario previsto dalla l. n. 398/1991: questo significa che l’ente dovrà essere in possesso di partita iva e che dovrà altresì avere optato per la determinazione forfetaria dell’iva e del reddito;\r\n\r\n2)  deve trattarsi di “eventi” (il termine evento ha generalmente il significato di "qualcosa che accade in un certo punto ad un certo momento”), ovvero di particolari avvenimenti che presentino le seguenti caratteristiche:\r\n-  non superiori a due per anno;\r\n-  per un importo complessivamente non superiore a euro 51.645,69.\r\n\r\n3) 	le attività e le raccolte fondi devono avere i requisiti dell’occasionalità e della saltuarietà. \r\n\r\nRicordiamo, che, come chiaramente stabilito dall''art. 5, comma 5, del D.L. 26/11/99 n. 473, l’asd/ssd deve redigere, entro quattro mesi dalla chiusura del periodo d’imposta, un apposito rendiconto per ciascuno dei due eventi, con l’indicazione delle entrate e delle spese relative ad ogni manifestazione effettuata e una relazione illustrativa, separatamente dal rendiconto complessivo\r\n\r\nE’ necessario inoltre che, al fine di separare anche “visivamente” i proventi che non concorrono alla formazione del plafond, gli stessi siano debbano essere annotati separatamente nel registro IVA “minori” utilizzato dalle ASD in regime di l. n. 398/1991 (c.m. 43/E/2000, citata “si evidenzia la necessità dell’annotazione separata dei proventi dell’articolo 25, comma 1, lettere a) e b), al fine di consentire all’amministrazione finanziaria il riscontro ed il controllo degli anzidetti proventi.” \r\n\r\nPer quanto concerne le differenze tra le due tipologie, sono essenzialmente le seguenti:\r\n\r\na)  ”svolgimento di attività commerciali connesse agli scopi istituzionali” \r\nSi tratta, in generale di vera e propria attività commerciale, con la caratteristica della connessione alle finalità istituzionali dell’ente: ad esempio, una competizione sportiva aperta al pubblico con biglietteria, la vendita di gadget e magliette effettuata in occasione di gare, ecc. \r\nAttenzione: l’attività dovrà comunque avvenire durante un “evento” (ovvero non in modo continuativo bensì occasionale) e con il rispetto del doppio limite temporale (massimo 2 all’anno) ed economico (massimo € 51.645,69);\r\n\r\nb)  ”raccolta pubblica di fondi” \r\nDeve essere:\r\n-  occasionale;\r\n-  pubblica;\r\n-  concomitante con ricorrenze, campagne di sensibilizzazione, celebrazioni.\r\n\r\nPresentano ad esempio, tali caratteristiche, le raccolte in occasione di campagne di sensibilizzazione, fatte nelle piazze delle nostre città.\r\n\r\n4. Agevolazione IRES\r\n\r\nLa norma in analisi - lo ribadiamo - prevede l’agevolazione ai soli fini delle imposte sul reddito, ma con le seguenti discriminanti:\r\n\r\na)  attività commerciale connessa agli scopi istituzionali: non è imponibile se rientra nei limiti dei due eventi annui ed euro 51.645,69 annui; è invece normalmente imponibile ove venga superato anche uno solo dei due limiti.\r\n\r\nb)  raccolta pubblica di fondi: avremo la seguente casistica:\r\n- entro il limite dei due eventi ed euro 51.645,69 annui: non imponibile;\r\n- entro il limite dei due eventi, ma superiore a euro 51.645,69 annui: non imponibile fino alla concorrenza del limite, imponibile per l’eccedenza;\r\n- oltre i due eventi l’anno, anche se inferiore a euro 51.645,69: imponibile.\r\n\r\n5. Agevolazione IVA\r\n\r\nAi fini IVA, si ritiene opportuno segnalare che vi sono differenti orientamenti per quanto concerne l’ipotesi di cui alla lettera a), attività commerciale connessa agli scopi istituzionali. \r\n\r\nInfatti, da un lato, l’operazione è posta in essere da un soggetto in possesso di partita IVA (un requisito è infatti l’avere optato per la l. n. 398/1991), dall’altro lato, la norma parla di due eventi “occasionali” e “saltuari”. \r\n\r\nAl riguardo, la citata c.m. 43/2000, al paragrafo 1.3, recita: “Per quanto riguarda il trattamento tributario ai fini IVA, è evidente che le cessioni di beni e le prestazioni di servizi effettuate dalle associazioni sportive nell’ambito delle attività che presentano il carattere di occasionalità e saltuarietà sono, in base ai principi generali, escluse dal campo di applicazione dell’IVA.” \r\n\r\nData la delicatezza della materia, il trattamento ai fini IVA dei proventi di cui al presente intervento, formerà oggetto di un successivo approfondimento nella prossima Newsletter Fiscosport n.11/2012 del 31 maggio 2012. \r\n\r\n6.  Casistica\r\n\r\nAnalizziamo di seguito alcuni casi particolari, che presentano notevoli dubbi interpretativi, in riferimento allo svolgimento di attività commerciale connessa agli scopi istituzionali: \r\n\r\n1) 	i due eventi "non concorrono a formare il reddito imponibile", ma ai fini del superamento del plafond previsto dalla l. n. 398/1991, vanno considerati? \r\nLa risposta a tale questione è contenuta nella circolare 43E/2000,dove, al par. 2, si ricorda che il comma 5 dell’articolo 1 del regolamento n.473/1999, di attuazione della l. n. 133/1999, esclude dal computo di detto limite di importo di 360 milioni di lire (ora 250.000 euro), i proventi di cui alle lettere a) e b) del comma 1 dell’articolo 25 della legge n.133 del 1999; \r\n\r\n2)  cosa deve intendersi per "attività connesse"? \r\nCapiamo bene come possa essere importante, ai fini del raggiungimento del limite previsto dalla l. n. 398/1991, il considerare i proventi conseguiti in particolari eventi quali derivanti da attività connessa agli scopi istituzionali. \r\nInnanzitutto, occorre ricordare che deve trattarsi di “eventi”, ovvero di ricorrenze , manifestazioni che non abbiano il carattere della continuità. \r\nInoltre, occorre che l''attività sia “connessa” agli scopi istituzionali, ovvero che sia ad essa collegata all''attività principale statutariamente prevista, ad esempio: \r\n-  festa della promozione; \r\n-  torneo o manifestazione sportiva organizzati in occasione di particolari ricorrenze;\r\n-  saggi o tornei di fine anno. \r\nDubbi sussistono invece per l''organizzazione di una sagra gastronomica, oppure per lo svolgimento di una gita. \r\n\r\n3)  il limite di € 51.645,69 è cumulativo per i due eventi? \r\nGli operatori si chiedono: potrei fare anche un solo evento in cui incassare 50.000 € oppure devo incassare al massimo € 25.822,85 ad evento? Si ritiene che possa essere effettuato anche un solo intervento annuo, rispettando il limite di € 51.645,69: la norma infatti nulla dice circa l''esistenza di un limite per ciascun evento. ', '', 0, '2012-03-30 13:37:00', 0, 0, 0, 'f1.png', 'Dot.ssa  GENTILINI MATILDE', '', 'scrittrice di novelle', '2012-03-30 13:38:39', '2012-05-20 16:27:14'),
(3, 1, 1, NULL, 0, '“SANATORIA EAS e 5 per mille”: ISTITUITO IL CODICE TRIBUTO - A cura di Giuliano Sinibaldi *, Consulente Regionale Fiscosport Marche', 'È universalmente riconosciuto che un lettore che osserva il layout di una pagina viene distratto dal contenuto testuale se questo è leggibile. ', 'Nella scorsa Newsletter Fiscosport n. 9/2012 del 3 maggio 2012 avevamo dato notizia dell’entrata in vigore - a seguito della pubblicazione in G.U. della  l. 26 aprile 2012 n. 44, che ha convertito, con modificazioni, il d.l. 2 marzo 2012, n. 16 - della c.d.  “sanatoria degli adempimenti formali a regime” che consente agli Enti Associativi che non lo avessero ancora fatto, o che lo avessero fatto in ritardo, di presentare il modello EAS, ponendosi quindi nelle condizioni di poter legittimamente usufruire (ovviamente in presenza di tutti i requisiti richiesti dalla legge) delle agevolazioni ex art. 148, co. 8, T.U.I.R. e art. 4, co. 4, d.p.r. n. 633/1972 (c.d. “de-commercializzazione delle quote e corrispettivi specifici incassati da soci, associati e tesserati).\r\n\r\nLa “pillola" si chiudeva con l’indicazione che non era stato ancora istituito un codice tributo ad hoc e che, quindi, fino a diversa disposizione, poteva ritenersi utilizzabile  il codice “generico” 8911 utilizzato in materia di sanatoria per dichiarazioni omesse o tardive. \r\n\r\nCon la risoluzione n. 46/2012 del 11/05/2012, che si allega,  l’Agenzia delle Entrate ha ora istituito i codici tributo da utilizzare nel caso di specie. \r\n\r\nIn particolare:\r\n\r\na)    Per la regolarizzazione “generica” delle comunicazioni aventi ad oggetto “la fruizione di benefici di natura fiscale o l''accesso a regimi fiscali opzionali, subordinati all''obbligo di preventiva comunicazione ovvero ad altro adempimento di natura formale non tempestivamente eseguiti” è stato introdotto il  codice “8114” denominato “Sanzione di cui all’art. 11, comma 1, dlgs n. 471/1997, dovuta ai sensi dell’articolo 2, comma 1, del dl n. 16/2012 - RIMESSIONE IN BONIS”;\r\n\r\nE'' questo il codice che dovrà essere ultilizzato per la c.d. "sanatoria EAS".\r\nIn sede di compilazione del modello F24 il suddetto codice tributo è esposto nella sezione “Erario”, esclusivamente in corrispondenza delle somme indicate nella colonna “Importi a debito versati” con indicazione nel campo “Anno di riferimento” dell’anno per cui si effettua il versamento nel formato “AAAA”.\r\n\r\nb)    Per la remissione in termini del 5 per mille (consentita, ai sensi l’articolo 2, comma 2, del decreto legge 2 marzo 2012, n. 16, convertito, con modificazioni, dalla legge 26 aprile 2012, n. 44, fino al 30 di settembre) il codice tributo da utilizzare è il  “8115”, denominato “Sanzione di cui all’art. 11, comma 1, dlgs n. 471/1997, dovuta ai sensi dell’art. 2, comma 2, del dl n.16/2012 – RIMESSIONE IN BONIS 5 per mille” \r\n\r\nIn sede di compilazione del modello F24 il suddetto codice tributo è esposto nella sezione “Erario”, esclusivamente in corrispondenza delle somme indicate nella colonna “Importi a debito versati” con indicazione nel campo “Anno di riferimento” dell’anno per cui si effettua il versamento nel formato “AAAA”.\r\n\r\nLa risoluzione istituisce anche il codice tributo “8116”,  che concerne, tuttavia, la disciplina del c.d. “consolidato fiscale”, agevolazione che non interessa le società e associazioni sportive dilettantitstiche.', '', 0, '2012-03-30 13:38:00', 0, 0, 0, 'm2.png', 'Avv. GIULIANO RE', '', 'avvocato (in)civile ', '2012-03-30 13:39:35', '2012-05-20 15:12:49'),
(4, 1, 2, NULL, 0, 'Il brano standard del Lorem Ipsum usato sin dal sedicesimo secolo è riprodotto qui di seguito per coloro che fossero interessati. Anche le sezioni 1.10.32 e 1.10.33 del "de Finibus Bonorum et Malorum" di Cicerone sono riprodotte nella loro forma originale, accompagnate dalla traduzione inglese del 1914 di H. Rackham.', 'perchè lo si utilizza?', 'È universalmente riconosciuto che un lettore che osserva il layout di una pagina viene distratto dal contenuto testuale se questo è leggibile. Lo scopo dell’utilizzo del Lorem Ipsum è che offre una normale distribuzione delle lettere (al contrario di quanto avviene se si utilizzano brevi frasi ripetute, ad esempio “testo qui”), apparendo come un normale blocco di testo leggibile. Molti software di impaginazione e di web design utilizzano Lorem Ipsum come testo modello. Molte versioni del testo sono state prodotte negli anni, a volte casualmente, a volte di proposito (ad esempio inserendo passaggi ironici...', '', 0, '2012-03-30 13:39:00', 0, 0, 0, 'f3.png', 'GIUSEPPINA FEDERICI', '', 'consulente (in)consistente', '2012-03-30 13:40:27', '2012-05-20 16:52:49'),
(5, NULL, 2, NULL, 0, 'Lo scopo dell’utilizzo del Lorem Ipsum è che offre una normale distribuzione delle lettere (al contrario di quanto avviene se si utilizzano brevi frasi ripetute, ad esempio “testo qui”)', 'Si utilizza un dizionario di oltre 200 vocaboli latini, combinati con un insieme di modelli di strutture di periodi, per generare passaggi di testo verosimili.', 'Esistono innumerevoli variazioni dei passaggi del Lorem Ipsum, ma la maggior parte hanno subito delle variazioni del tempo, a causa dell’inserimento di passaggi ironici, o di sequenze casuali di caratteri palesemente poco verosimili. Se si decide di utilizzare un passaggio del Lorem Ipsum, è bene essere certi che non contenga nulla di imbarazzante. In genere, i generatori di testo segnaposto disponibili su internet tendono a ripetere paragrafi predefiniti, rendendo questo il primo vero generatore automatico su intenet. Infatti utilizza un dizionario di oltre 200 vocaboli latini, combinati con un insieme di modelli di strutture di periodi, per generare passaggi di testo verosimili. Il testo così generato è sempre privo di ripetizioni, parole imbarazzanti o fuori luogo ecc.', '', 0, '2012-03-30 13:40:00', 0, 0, 0, 'm3.png', 'GIUSEPPE LOSCO', '', 'carabiniere', '2012-03-30 13:41:30', '2012-05-20 16:19:48'),
(6, 1, 16, NULL, 0, 'vademecum 1 vademecum 1vademecum 1vademecum 1vademecum 1vademecum 1vademecum 1vademecum 1vademecum 1vademecum 1vademecum 1vademecum 1', ' 1vademecum', 'La Redazione di Fiscosport ha recentemente dedicato una serie di articoli al tema della redazione del bilancio da parte degli enti non profit, occupandosi dei principi generali di redazione, dei principi contabili specifici delle singole poste di bilancio, dei criteri generali di valutazione e degli schemi di redazione.\r\nA dimostrazione del grande interesse manifestato dagli operatori nei confronti di tali argomenti, giunge la pubblicazione della Risoluzione dell''Agenzia delle Entrate n. 126/E del 16 dicembre 2011, avente ad oggetto gli obblighi in materia di tenuta delle scritture contabili e di rendicontazione periodica a carico degli enti non commerciali.', '', 0, '2012-04-03 08:45:00', 0, 0, 0, 'f4.png', 'dott.ssa MARINA CALVI', '', 'consulente in tricologia', '2012-04-03 08:47:13', '2012-05-20 15:15:59'),
(7, 1, 16, NULL, 0, 'vade retro 2 !!! vade mecum ! ---vade retro 2 !!! vade mecum ! -vade retro 2 !!! vade mecum ! -vade retro 2 !!! vade mecum ! -vade retro 2 !!! vade mecum ! -vade retro 2 !!! vade mecum ! -', 'vade retro 2 !!! vade mecum ! -vade retro 2 !!! vade mecum ! -vade retro 2 !!! vade mecum ! -', 'La Circolare dell''Agenzia delle Entrate n. 20/E del 13/5/2011, al punto 5.9, esamina l''ipotesi di attività sportive svolte presso associazioni sportive, palestre e piscine, in virtù di accordi con i Comuni; nel caso prospettato il pagamento del corso viene effettuato mediante bollettino di c/c postale intestato al Comune ed è stato chiesto se tale bollettino, unitamente alla ricevuta complessivecum ! -', '', 0, '2012-04-03 08:47:00', 0, 0, 0, 'f2.png', 'RITA MITSUKO', '', 'Cantante', '2012-04-03 08:48:39', '2012-05-20 15:16:38'),
(8, 1, 18, 1, 0, 'questo modulo riguarda bla bla bla ', 'Modulo domanda codice fiscale per associazione', '', 'download.png', 0, '2012-05-20 19:56:00', 0, 0, 0, 'modulistica.gif', 'http://www.cavalloecavalli.it/images/stories/file/Moduli/1%20modulo_domanda_codice_fiscale_associazione.pdf', '', '', '2012-05-20 20:23:30', '2012-05-20 20:23:30'),
(9, 1, 18, 1, 0, 'questo modulo ...', 'Ricevuta detrazione attività sportiva', '', 'download.png', 0, '2012-05-20 19:56:00', 0, 0, 0, 'modulistica.gif', 'http://www.cavalloecavalli.it/images/stories/file/Moduli/3%20ricevuta_detrazione_attivita_sportiva.pdf', '', '', '2012-05-20 20:23:30', '2012-05-20 20:23:30');

-- --------------------------------------------------------

--
-- Struttura della tabella `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
CREATE TABLE IF NOT EXISTS `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dump dei dati per la tabella `schema_migrations`
--

INSERT INTO `schema_migrations` (`version`) VALUES
('20120320155652'),
('20120320171654'),
('20120320202907'),
('20120322152538'),
('20120322153048'),
('20120326135545'),
('20120326135635'),
('20120328160150'),
('20120328160235');

-- --------------------------------------------------------

--
-- Struttura della tabella `sections`
--

DROP TABLE IF EXISTS `sections`;
CREATE TABLE IF NOT EXISTS `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sezione` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `protetto` tinyint(1) DEFAULT NULL,
  `ordinamento` int(11) DEFAULT NULL,
  `top_section_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=19 ;

--
-- Dump dei dati per la tabella `sections`
--

INSERT INTO `sections` (`id`, `sezione`, `protetto`, `ordinamento`, `top_section_id`, `created_at`, `updated_at`) VALUES
(1, 'Indice', 0, 1, 1, '2012-03-30 11:45:22', '2012-03-30 11:45:22'),
(2, 'Approfondimenti', 0, 2, 1, '2012-03-30 11:45:54', '2012-03-30 12:56:46'),
(3, 'Lavoro', 0, 3, 3, '2012-03-30 11:46:26', '2012-03-30 11:46:26'),
(4, 'Previdenza', 0, 5, 3, '2012-03-30 11:46:46', '2012-03-30 11:46:46'),
(16, 'Vademecum', 0, 5, 2, '2012-03-30 12:17:28', '2012-05-20 16:27:43'),
(17, 'Normative', 0, 3, 4, '2012-05-20 16:30:49', '2012-05-20 16:30:49'),
(18, 'Modulistica', 0, 1, 2, '2012-05-20 19:55:31', '2012-05-20 19:55:31');

-- --------------------------------------------------------

--
-- Struttura della tabella `top_sections`
--

DROP TABLE IF EXISTS `top_sections`;
CREATE TABLE IF NOT EXISTS `top_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sezione_top` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ordinamento` int(11) DEFAULT NULL,
  `se_visibile` tinyint(1) DEFAULT NULL,
  `immagine` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `style` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dump dei dati per la tabella `top_sections`
--

INSERT INTO `top_sections` (`id`, `sezione_top`, `ordinamento`, `se_visibile`, `immagine`, `style`, `created_at`, `updated_at`) VALUES
(1, 'Sommario', 1, 1, '', '', '2012-03-30 11:41:29', '2012-03-30 11:41:29'),
(2, 'Guide e Vademecum', 2, 1, '', '', '2012-03-30 11:42:26', '2012-03-30 11:42:26'),
(3, 'Lavoro e Previdenza', 3, 1, '', '', '2012-03-30 11:42:53', '2012-03-30 11:42:53'),
(4, 'Circolari e Risoluzioni', 4, 1, '', '', '2012-03-30 11:44:20', '2012-03-30 11:44:20');

-- --------------------------------------------------------

--
-- Struttura della tabella `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `codice` int(11) DEFAULT NULL,
  `nome` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `titolo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `soc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sede` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `indirizzo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefono` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefono2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mail2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pwd` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `registrato` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `datascadenza` datetime DEFAULT NULL,
  `cap` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prov` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `sez` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iva_` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `codicefiscale` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `partitaiva` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `annotazioni` text COLLATE utf8_unicode_ci,
  `tariffa_precedente` float DEFAULT NULL,
  `sconto_precedente` text COLLATE utf8_unicode_ci,
  `iva_precedente` text COLLATE utf8_unicode_ci,
  `pagamento_precedente` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data_ultimo_pagamento` datetime DEFAULT NULL,
  `data_accredito` datetime DEFAULT NULL,
  `anno_competenza` int(11) DEFAULT NULL,
  `conferma_registrazione` tinyint(1) DEFAULT NULL,
  `abbonato` tinyint(1) DEFAULT NULL,
  `disabilitato` tinyint(1) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `crediti` int(11) DEFAULT NULL,
  `power_user` tinyint(1) DEFAULT NULL,
  `num_reg_coni` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `forum_redattore` tinyint(1) DEFAULT NULL,
  `forum_notifica` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `account_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
