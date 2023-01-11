CREATE TABLE `USER`
(
    `id`                INTEGER PRIMARY KEY AUTO_INCREMENT,
    `name`              VARCHAR(50)  NOT NULL,
    `email`               VARCHAR(256) NOT NULL,
    `email_verified_at` TIMESTAMP NULL,
    `password`          VARCHAR(255) NOT NULL,
    `remember_token`    BOOLEAN      NOT NULL,
    `created_at`        TIMESTAMP    NOT NULL,
    `updated_at`        TIMESTAMP    NOT NULL
);

CREATE TABLE `COMMENT`
(
    `id`         INTEGER PRIMARY KEY AUTO_INCREMENT,
    `content`    VARCHAR(300) NOT NULL,
    `created_at` TIMESTAMP    NOT NULL,
    `updated_at` TIMESTAMP    NOT NULL
);

CREATE TABLE `MAKE_COMMENT`
(
    `user_id`    INTEGER NOT NULL,
    `comment_id` INTEGER NOT NULL,
    FOREIGN KEY (`user_id`) REFERENCES `USER` (`id`),
    FOREIGN KEY (`comment_id`) REFERENCES `COMMENT` (`id`)
);

CREATE TABLE `REPLY_TO`
(
    `user_id`    INTEGER NOT NULL,
    `comment_id` INTEGER NOT NULL,
    FOREIGN KEY (`user_id`) REFERENCES `USER` (`id`),
    FOREIGN KEY (`comment_id`) REFERENCES `COMMENT` (`id`)
);

CREATE TABLE `PHOTO`
(
    `id`          INTEGER PRIMARY KEY AUTO_INCREMENT,
    `title`       VARCHAR(50)  NOT NULL,
    `description` VARCHAR(300) NOT NULL,
    `file`        VARCHAR(255) NOT NULL,
    `photo_date`  TIMESTAMP    NOT NULL,
    `resolution`  VARCHAR(50)  NOT NULL,
    `width`       INTEGER      NOT NULL,
    `height`      INTEGER      NOT NULL,
    `created_at`  TIMESTAMP    NOT NULL,
    `updated_at`  TIMESTAMP    NOT NULL
);

CREATE TABLE `HAS_COMMENT`
(
    `photo_id`   INTEGER NOT NULL,
    `comment_id` INTEGER NOT NULL,
    FOREIGN KEY (`photo_id`) REFERENCES `PHOTO` (`id`),
    FOREIGN KEY (`comment_id`) REFERENCES `COMMENT` (`id`)
);

CREATE TABLE `OWNER`
(
    `user_id`  INTEGER NOT NULL,
    `photo_id` INTEGER NOT NULL,
    FOREIGN KEY (`user_id`) REFERENCES `USER` (`id`),
    FOREIGN KEY (`photo_id`) REFERENCES `PHOTO` (`id`)
);

CREATE TABLE `PHOTO_USER`
(
    `user_id`  INTEGER NOT NULL,
    `photo_id` INTEGER NOT NULL,
    FOREIGN KEY (`user_id`) REFERENCES `USER` (`id`),
    FOREIGN KEY (`photo_id`) REFERENCES `PHOTO` (`id`)
);

CREATE TABLE `GROUP`
(
    `id`          INTEGER PRIMARY KEY AUTO_INCREMENT,
    `name`        VARCHAR(50)  NOT NULL,
    `description` VARCHAR(300) NOT NULL,
    `created_at`  TIMESTAMP    NOT NULL,
    `updated_at`  TIMESTAMP    NOT NULL
);

CREATE TABLE `GROUP_PHOTO`
(
    `group_id` INTEGER NOT NULL,
    `photo_id` INTEGER NOT NULL,
    FOREIGN KEY (`group_id`) REFERENCES `GROUP` (`id`),
    FOREIGN KEY (`photo_id`) REFERENCES `PHOTO` (`id`)
);

CREATE TABLE `GROUP_USER`
(
    `group_id` INTEGER NOT NULL,
    `user_id`  INTEGER NOT NULL,
    FOREIGN KEY (`group_id`) REFERENCES `GROUP` (`id`),
    FOREIGN KEY (`user_id`) REFERENCES `USER` (`id`)
);

CREATE TABLE `TAG`
(
    `id`         INTEGER PRIMARY KEY AUTO_INCREMENT,
    `name`       VARCHAR(50) NOT NULL,
    `created_at` TIMESTAMP   NOT NULL,
    `updated_at` TIMESTAMP   NOT NULL
);

CREATE TABLE `HAS`
(
    `photo_id` INTEGER NOT NULL,
    `tag_id`   INTEGER NOT NULL,
    FOREIGN KEY (`photo_id`) REFERENCES `PHOTO` (`id`),
    FOREIGN KEY (`tag_id`) REFERENCES `TAG` (`id`)
);

-- 1 Modifier la table photo pour que la colonne created_at aie pour valeur par défaut la date courante.
ALTER TABLE `PHOTO`
    MODIFY created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL;

-- 2 Ajouter ensuite une contrainte permettant de vérifier que la date de mise à jour est postérieure à la date de création.
ALTER TABLE `PHOTO`
    CHECK (updated_at > created_at);


-- 3 Modifier la table User pour ajouter une contrainte d'unicité sur la colonne email.
ALTER TABLE `USER`
    ADD UNIQUE (email);

-- 4 Modifier la table photo pour que la colonne width soit de type entier positif.
ALTER TABLE PHOTO
    MODIFY width INTEGER UNSIGNED NOT NULL;

-- 5 Modifier la table photo pour que la colonne  height aie un minimum de 10.
ALTER TABLE PHOTO
    MODIFY height INTEGER NOT NULL CHECK (height >= 10);

-- 6 Modifier votre base pour que les commentaires puissent être édités par plusieurs utilisateurs. Pour chaque édition d'un utilisateur, on souhaite conserver la date d'édition.
ALTER TABLE COMMENT
    ADD edited_by INTEGER NOT NULL,
ADD edited_at TIMESTAMP NOT NULL;

-- 6 Suite
CREATE TABLE `EDITED_COMMENT`
(
    `edited_by`    INTEGER NOT NULL,
    `edited_at` TIMESTAMP NOT NULL,
    `comment_id`   INTEGER NOT NULL,
    FOREIGN KEY (`comment_id`) REFERENCES `COMMENT` (`id`),
    FOREIGN KEY (`edited_by`) REFERENCES USER (id),
    FOREIGN KEY (`edited_at`) REFERENCES `COMMENT` (`edited_at`)
);