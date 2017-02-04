-- phpMyAdmin SQL Dump
-- version 4.6.5.1
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:8889
-- Généré le :  Ven 03 Février 2017 à 21:10
-- Version du serveur :  5.6.34
-- Version de PHP :  7.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données :  `symfony`
--

-- --------------------------------------------------------

--
-- Structure de la table `film`
--

CREATE TABLE `film` (
  `id` int(11) NOT NULL,
  `titre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `realisateur` text COLLATE utf8_unicode_ci NOT NULL,
  `date` text COLLATE utf8_unicode_ci NOT NULL,
  `genre_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `film`
--

INSERT INTO `film` (`id`, `titre`, `description`, `realisateur`, `date`, `genre_id`) VALUES
(14, 'Le Mépris55', 'Scénariste à succès, Paul Javal travaille à une adaptation de «L\'Odyssée», qui doit être tournée par Fritz Lang. Il remarque bientôt que Lang est en désaccord avec Prokosch, le producteur américain. Ce dernier voudrait financer un film épique alors que le réalisateur souhaite faire un film psychologique. Camille, la femme de Paul, le rejoint à Cinecittà. Tous deux sont invités chez Prokosch, qui manifeste un vif intérêt pour la jeune femme. Paul la laisse partir avec l\'Américain, espérant se faire remarquer par lui. Camille, qui aime son mari, est déçue. Elle refuse de jouer le jeu et change brusquement d\'attitude vis-à-vis de Paul...', 'Jean-Luc Godard', '2012-01-01', 1),
(15, 'L\'Aurore', 'L\'amour rayonnant d\'un couple de paysans est menacé par une vamp venue de la ville. Murnau donne une magnifique ampleur à ce drame conjugal éternel. Un film muet d\'une modernité à couper le souffle.', 'F.W. Murnau', '2012-01-01', 1),
(16, 'Mulholland Drive', 'De Betty, la blonde ingénue, ou Rita, la brune amnésique, qui est l\'élue des dieux hollywoodiens ? Qui est la fille perdue ? Un grand film schizo et parano, grisant et vénéneux.', 'David Lynch', '2012-01-01', NULL),
(17, 'Chantons sous la pluie', 'Scénario de rêve, Gene claquette dans les flaques, Donald O\'Connor troue le décor, et les jambes de Charisse sont à jamais révélées. La paire Donen-Kelly touche la perfection.', 'Gene Kelly, Stanley Donen', '2012-01-01', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `genre`
--

CREATE TABLE `genre` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Livres` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `genre`
--

INSERT INTO `genre` (`id`, `nom`, `Livres`) VALUES
(1, 'Action', ''),
(2, 'Horreur', ''),
(3, 'Aventure', ''),
(4, 'Comédie', '');

-- --------------------------------------------------------

--
-- Structure de la table `livre`
--

CREATE TABLE `livre` (
  `id` int(11) NOT NULL,
  `titre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `auteur` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nombre_pages` int(11) NOT NULL,
  `genre_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `livre`
--

INSERT INTO `livre` (`id`, `titre`, `description`, `auteur`, `nombre_pages`, `genre_id`) VALUES
(1, 'Seigneur des anneaux', 'Après un long prologue décrivant les Hobbits et leurs mœurs, le passé de la Terre du Milieu et un rapide résumé des aventures de Bilbo Bessac, le livre I s\'ouvre sur le cent onzième anniversaire de ce dernier, soixante années après les événements décrits dans Le Hobbit. Au cours de la réception, Bilbo s\'éclipse grâce à l\'invisibilité que lui confère son anneau magique et quitte Hobbiteville, laissant tous ses biens, anneau compris, à son neveu et héritier désigné, Frodo Bessac. Dix-sept ans plus tard, leur vieil ami, le magicien Gandalf le Gris, révèle à Frodo que son anneau est en réalité l\'Anneau unique, instrument du pouvoir de Sauron, le Seigneur Sombre, qui l\'a perdu jadis ; s\'il devait le retrouver, son pouvoir deviendrait insurmontable. Gandalf presse Frodo de quitter le Comté, qui n\'est plus sûr pour lui, et de se mettre en route pour le refuge qu\'est Fendeval, la demeure d\'Elrond le Semi-elfe.\\r\\n\\r\\nFrodo vend sa demeure de Cul-de-Sac, dissimulant son départ sous le prétexte d\'un déménagement au Pays-de-Bouc, à la lisière orientale du Comté. Accompagné de son jardinier Sam Gamgie et d\'un jeune ami, Peregrin Touc (Pippin), il échappe de justesse à plusieurs reprises aux Cavaliers Noirs, serviteurs de Sauron chargés de retrouver l\'Anneau. Les trois compagnons atteignent le Pays-de-Bouc, à l\'est du Comté, où Meriadoc Brandibouc (Merry) se joint à eux, malgré la volonté de Frodo de ne pas exposer ses amis au danger. Les quatre hobbits poursuivent leur route vers l\'est, échappant aux dangers de la Vieille Forêt et des Coteaux des Tertres grâce à l\'énigmatique Tom Bombadil. À Brie, ils font la connaissance de l\'étrange Arpenteur, un ami de Gandalf, qui devient leur guide ; plus tard, il sera révélé qu\'il s\'agit d\'Aragorn fils d\'Arathorn, héritier d\'Isildur. Les Cavaliers Noirs, toujours à leurs trousses, parviennent à blesser Frodo près de la colline de Montauvent, mais grâce à l\'aide de l\'elfe Glorfindel, il parvient à franchir le gué de Bruinen. Les Cavaliers, qui le suivent de près, sont emportés par une crue soudaine de la rivière, et Frodo s\'évanouit.\\r\\n\\r\\nFrodo se réveille au début du livre II : il est à Fendeval, où Elrond l\'a soigné. Il y retrouve Bilbo et aperçoit Arwen, l\'Étoile du Soir, fille d\'Elrond et bien-aimée d\'Aragorn. S\'ensuit le Conseil d\'Elrond, auquel assistent des représentants des principales races de la Terre du Milieu (Elfes, Nains et Hommes). Gandalf leur apprend la trahison de Saruman, son supérieur dans l\'Ordre des Mages, qui recherche l\'Unique pour lui-même. Après avoir examiné toutes les possibilités qui s\'offrent à eux, les participants au Conseil décident que le seul moyen de vaincre Sauron est de détruire l\'Anneau en l\'amenant au cœur du Mordor, pays de Sauron, et en le jetant dans la lave des Failles du Destin, là où il fut forgé. Frodo se déclare volontaire pour accomplir cette tâche, et une « Fraternité de l\'Anneau » est formée pour l\'accompagner et l\'aider : elle comprend Frodo et ses trois compagnons hobbits, Gandalf, Aragorn, Boromir du Gondor, Gimli le nain et Legolas l\'elfe.\\r\\n\\r\\nLa compagnie voyage à travers l\'Eregion déserte, mais échoue à franchir les Montagnes de Brume par le col enneigé du Caradhras. Gandalf la conduit dans les mines de Moria, ancienne cité naine désormais peuplée par des gobelins, mais il tombe dans l\'abîme en affrontant sur le pont de Khazad-dûm un Balrog, antique créature démoniaque responsable de la ruine de la Moria. La Fraternité, désormais menée par Aragorn, quitte la Moria et entre dans le pays elfique de Lothlórien, gouverné par Celeborn et Galadriel. Là, Frodo et Sam regardent dans le miroir de Galadriel et voient des visions du passé, du présent et d\'un possible futur. Terrifié par l\'Œil de Sauron, Frodo propose de remettre l\'Anneau à Galadriel, mais celle-ci surmonte la tentation et refuse. Les compagnons quittent la Lórien à bord de trois bateaux et descendent le grand fleuve Anduin. Arrivés à hauteur des chutes de Rauros, Boromir tente de s\'emparer de l\'Anneau, et la Communauté est attaquée par des Orques. Au milieu de cette confusion, Frodo et Sam partent seuls en direction du Mordor.', 'J. R. R. Tolkien', 600, NULL),
(2, 'Harry Potter', 'L\'histoire, se situant dans les années 90, raconte la jeunesse d\'un sorcier, Harry Potter, orphelin élevé par une famille ordinaire qui le traite davantage en tant qu\'esclave que membre de leur famille, et qui découvre progressivement son identité de sorcier, son héritage tragique et la responsabilité qui lui revient.\\r\\n\\r\\nPendant l\'été 1991, peu avant son onzième anniversaire, Harry reçoit une lettre l\'invitant à se présenter lors de la rentrée des classes à l\'école de sorcellerie de Poudlard. Malgré les tentatives de son oncle et de sa tante pour l\'empêcher de s\'y rendre, Rubeus Hagrid, un « demi-géant » (sa mère étant une géante bien connue du ministère de la Magie pour ses nombreux meurtres et son père était un sorcier) envoyé par Albus Dumbledore, le directeur de Poudlard, va faire découvrir à Harry le monde des sorciers et l\'emmener à la gare de King\'s Cross de Londres, où il prendra le Poudlard Express (qui se situe sur la voie 9 3/4) qui le conduira jusqu\'à sa nouvelle école.\\r\\n\\r\\nHarry découvre ainsi non seulement l\'existence des sorciers, qui vivent parmi les « Moldus » (les personnes ne possédant aucun pouvoir magique) tout en se dissimulant d\'eux, mais aussi l\'immense célébrité dont il jouit parmi eux: il est en effet considéré comme « le Survivant » depuis que, dix ans plus tôt, ses parents, les sorciers Lily Evans et James Potter, ont été tués par Lord Voldemort, un puissant mage noir. Il s\'en est ensuite pris à Harry, mais a échoué car son sortilège a ricoché : Harry survit, alors que Lord Voldemort disparaît. Harry a gardé comme marque de l\'affrontement une cicatrice en forme d\'éclair sur le front.\\r\\n\\r\\nUne fois à Poudlard, Harry va apprendre à maîtriser et à utiliser les pouvoirs magiques qu\'il possède et va se faire deux amis inséparables : Ronald Weasley et Hermione Granger, qui l\'accompagneront dans toutes ses péripéties.\\r\\n\\r\\nChacun des romans se déroule le long d\'une année scolaire, tout au long de la jeunesse riche en aventures de Harry. Durant ces sept ans, le jeune sorcier va notamment assister au retour parmi les sorciers et à la seconde ascension vers le pouvoir de Lord Voldemort, et le combattre jusqu\'à l\'affrontement final.', 'J. K. Rowling', 450, NULL),
(3, 'L\'Étranger', 'Le roman met en scène un personnage-narrateur nommé Meursault, vivant à Alger en Algérie française. Le roman est découpé en deux parties.\\r\\n\\r\\nAu début de la première partie, Meursault reçoit un télégramme annonçant que sa mère, qu\'il a internée à l’hospice de Marengo vient de mourir. Il se rend en autocar à l’asile de vieillards, situé près d’Alger. Veillant la morte toute la nuit, il assiste le lendemain à la mise en bière et aux funérailles, sans avoir l\'attitude à attendre d’un fils endeuillé ; le héros ne pleure pas, il ne veut pas simuler un chagrin qu\'il ne ressent pas.\\r\\n\\r\\nLe lendemain de l\'enterrement, Meursault décide d\'aller nager à l\'établissement de bains du port, et y rencontre Marie, une dactylo qui avait travaillé dans la même entreprise que lui. Le soir, ils sortent voir un film de Fernandel au cinéma et passent le restant de la nuit ensemble. Le lendemain matin, son voisin, Raymond Sintès, un proxénète notoire, lui demande de l\'aider à écrire une lettre pour dénigrer sa maîtresse, une Maure envers laquelle il s\'est montré brutal ; il craint des représailles du frère de celle-ci. La semaine suivante, Raymond frappe et injurie sa maitresse dans son appartement. La police intervient et convoque Raymond au commissariat. Celui-ci utilise Meursault comme témoin de moralité. En sortant, il l\'invite, lui et Marie, à déjeuner le dimanche suivant à un cabanon au bord de la mer, qui appartient à un de ses amis, Masson. Lors de la journée, Marie demande à Meursault s\'il veut se marier avec elle. Il répond que ça n\'a pas d\'importance, mais qu\'il le veut bien.\\r\\n\\r\\nLe dimanche midi, après un repas bien arrosé, Meursault, Raymond et Masson se promènent sur la plage et croisent deux Arabes, dont le frère de la maîtresse de Raymond. Une bagarre éclate, au cours de laquelle Raymond est blessé au visage d\'un coup de couteau. Plus tard, Meursault, seul sur la plage accablée de chaleur et de soleil, rencontre à nouveau l’un des Arabes, qui, à sa vue, sort un couteau. Aveuglé par la sueur, ébloui par le reflet du soleil sur la lame, Meursault tire de sa poche le revolver que Raymond lui a confié et tue l\'Arabe d\'une seule balle. Puis, sans raison apparente, il tire quatre autres coups sur le corps inerte.\\r\\n\\r\\nDans la seconde moitié du roman, Meursault est arrêté et questionné. Ses propos sincères et naïfs mettent son avocat mal à l\'aise. Il ne manifeste aucun regret, mais de l\'ennui. Lors du procès, on l\'interroge davantage sur son comportement lors de l\'enterrement de sa mère que sur le meurtre. Meursault se sent exclu du procès. Il dit avoir commis son acte à cause du soleil, ce qui déclenche l\'hilarité de l\'audience. La sentence tombe : il est condamné à la guillotine. L’aumônier visite Meursault pour qu\'il se confie à Dieu dans ces derniers instants, Meursault refuse. Quand celui-ci lui dit qu\'il priera pour lui, il déclenche sa colère.\\r\\n\\r\\nAvant son départ, Meursault finit par trouver la paix dans la sérénité de la nuit.', 'Albert Camus', 100, NULL),
(4, 'Hamlet', 'Le prince Hamlet est le fils du premier roi de Danemark, également nommé « Hamlet ». Il est étudiant à l\'université de Wittenberg. Le spectre de son père le charge de venger son meurtre. Il y parvient enfin, mais seulement après que la famille royale a été évincée et que lui-même a été mortellement blessé par Laërte d\'un coup d\'épée empoisonnée.\\r\\n\\r\\nClaudius, oncle du prince Hamlet, est l\'actuel roi auto-proclamé du Danemark. Il s\'est marié avec la veuve de son frère, auquel il a succédé. Le spectre de ce dernier accuse Claudius de l\'avoir assassiné pendant son sommeil, en lui versant un poison mortel dans l\'oreille. La pièce organisée par le prince et la mort de Polonius lui apprend qu\'il est visé par le prince. Pour se défendre, il manipule Laërte et monte un complot pour tuer Hamlet. À la fin de la pièce, Claudius est tué par le prince Hamlet.\\r\\n\\r\\nGertrude, mère du prince Hamlet, reine du Danemark et veuve du roi défunt, se remarie peu après au frère de ce dernier, ce que le prince Hamlet, et toute l\'époque de Shakespeare, considèrent comme un inceste. Le spectre de son mari défunt l\'accuse de l\'avoir trompé avec Claudius avant que ce dernier le tue, mais ordonne à leur fils de laisser le ciel la punir. Le meurtre de Polonius par son fils l\'a profondément affligée. Elle meurt accidentellement en buvant le vin empoisonné destiné à Hamlet.\\r\\n\\r\\nPolonius, lord chambellan, conseiller du royaume et père de Laërte et d\'Ophélie, est l\'homme le plus apprécié du royaume ne donnant que des bonnes nouvelles et informations au roi et servant les intérêts du royaume. Il s\'inquiète de la relation amoureuse du prince Hamlet et d\'Ophélie, sa fille. Il craint qu\'Hamlet ne prenne sa virginité et ne l\'épouse pas. Il interdit cette relation à sa fille. Croyant Hamlet fou, il s\'obstinera à trouver la raison pour laquelle Hamlet est fou, mais cela lui coûtera la vie. Il est tué par Hamlet qui a fait erreur sur la personne en croyant tuer Claudius à travers une tapisserie alors qu\'il l\'espionnait en train de parler avec sa mère. Celle-ci, témoin du meurtre, sera bouleversée, Ophélie deviendra folle, et Laërte voudra venger son père.\\r\\n\\r\\nLaërte, fils de Polonius, profondément attaché à sa sœur Ophélie, est en France pendant la majeure partie de la pièce pour faire ses études. À la fin de la pièce, en raison de l\'implication d\'Hamlet dans la mort de son père, il fomente avec Claudius un duel dans lequel il tue Hamlet. Hamlet le tue de la même épée dont il ignore qu\'elle est empoisonnée.\\r\\n\\r\\nOphélie, fille de Polonius, sœur de Laërte, et Hamlet partagent une idylle bien qu\'ayant été implicitement mis en garde contre l\'impossibilité d\'un mariage. Hamlet l\'éconduit pour accréditer sa propre folie. La mort de son père la rend folle et elle est retrouvée mystérieusement morte noyée dans un ruisseau.\\r\\n\\r\\nHoratio, ami d\'Hamlet, n\'est pas impliqué dans les intrigues de la cour. C\'est lui qui annonce au prince l\'apparition du spectre de son père en compagnie des deux officiers, Marcellus et Bernardo (qui ont été les premiers à le voir). Il reste le seul à survivre à l\'heure du dénouement pour pouvoir porter l\'histoire d\'Hamlet à la postérité et pour participer à l\'arrivée de Fortinbras.\\r\\n\\r\\nRosencrantz et Guildenstern, amis d\'Hamlet, retournés par Claudius pour le surveiller. Hamlet les soupçonne rapidement. Après le meurtre de Polonius provoqué par le prince, ils sont chargés de l\'emmener en Angleterre, tout en ignorant que Claudius leur a donné une feuille pour que le prince soit exécuté. Mais Hamlet découvre le papier et le réécrit pour punir ses deux amis de leur trahison et profite d\'une attaque de pirates pour s\'échapper. Ils seront exécutés en Angleterre.\\r\\n\\r\\nFortinbras, prince norvégien, est le fils du roi de même nom tué au champ de bataille par le père d\'Hamlet. Le prince Fortinbras espère une vengeance. Arrivant trop tard pour combattre contre Hamlet, il annule la guerre et prend le pouvoir au royaume de Danemark.', 'William Shakespeare', 200, NULL),
(5, 'Odyssée', 'L’Odyssée (en grec ancien Ὀδύσσεια / Odússeia) est une épopée grecque antique attribuée à l’aède Homèrenote 1, qui l\'aurait composée après l’Iliade, vers la fin du viiie siècle av. J.-C. Elle est considérée comme l’un des plus grands chefs-d’œuvre de la littérature et, avec l’Iliade, comme l\'un des deux poèmes fondateurs de la civilisation européenne.\\r\\n\\r\\nL’Odyssée relate le retour chez lui du héros Ulysse, qui, après la guerre de Troie dans laquelle il a joué un rôle déterminant, met dix ans à revenir dans son île d\'Ithaque, pour y retrouver son épouse Pénélope, qu\'il délivre des prétendants, et son fils Télémaque. Au cours de son voyage sur mer, rendu périlleux par le courroux du dieu Poséidon, Ulysse rencontre de nombreux personnages mythologiques, comme la nymphe Calypso, la princesse Nausicaa, les Cyclopes, la magicienne Circé et les sirènes. L\'épopée contient aussi un certain nombre d\'épisodes qui complètent le récit de la guerre de Troie, par exemple la construction du cheval de Troie et la chute de la ville, qui ne sont pas évoquées dans l’Iliade. L’Odyssée compte douze mille cent neuf hexamètres dactyliques, répartis en vingt-quatre chants, et peut être divisée en trois grandes parties : la Télémachie (chants I-IV), les Récits d\'Ulysse (chants V-XII) et la Vengeance d\'Ulysse (chants XIII-XXIV)2,1.\\r\\n\\r\\nL’Odyssée a inspiré un grand nombre d\'œuvres littéraires et artistiques au cours des siècles, et le terme « odyssée » est devenu par antonomase un nom commun désignant un « récit de voyage plus ou moins mouvementé et rempli d\'aventures singulières »', 'Homère', 90, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `realisateur`
--

CREATE TABLE `realisateur` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `realisateur`
--

INSERT INTO `realisateur` (`id`, `nom`, `prenom`, `date`) VALUES
(1, 'du', 'con', '2017-02-06');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_8244BE224296D31F` (`genre_id`),
  ADD KEY `genre_id` (`genre_id`);

--
-- Index pour la table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `livre`
--
ALTER TABLE `livre`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_AC634F994296D31F` (`genre_id`);

--
-- Index pour la table `realisateur`
--
ALTER TABLE `realisateur`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `film`
--
ALTER TABLE `film`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT pour la table `genre`
--
ALTER TABLE `genre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `livre`
--
ALTER TABLE `livre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `realisateur`
--
ALTER TABLE `realisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `film`
--
ALTER TABLE `film`
  ADD CONSTRAINT `FK_8244BE224296D31F` FOREIGN KEY (`genre_id`) REFERENCES `realisateur` (`id`);

--
-- Contraintes pour la table `livre`
--
ALTER TABLE `livre`
  ADD CONSTRAINT `FK_AC634F994296D31F` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`);
