--
-- Copyright (c) 2008 Red Hat, Inc.
--
-- This software is licensed to you under the GNU General Public License,
-- version 2 (GPLv2). There is NO WARRANTY for this software, express or
-- implied, including the implied warranties of MERCHANTABILITY or FITNESS
-- FOR A PARTICULAR PURPOSE. You should have received a copy of GPLv2
-- along with this software; if not, see
-- http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt.
--
-- Red Hat trademarks are not licensed under GPLv2. No permission is
-- granted to use or replicate Red Hat trademarks that are incorporated
-- in this software or its documentation.
--


CREATE TABLE rhnArchTypeActions
(
    arch_type_id    NUMBER NOT NULL
                        CONSTRAINT rhn_archtypeacts_atid_fk
                            REFERENCES rhnArchType (id),
    action_style    VARCHAR2(64) NOT NULL,
    action_type_id  NUMBER NOT NULL
                        CONSTRAINT rhn_archtypeacts_actid_fk
                            REFERENCES rhnActionType (id),
    created         DATE
                        DEFAULT (sysdate) NOT NULL,
    modified        DATE
                        DEFAULT (sysdate) NOT NULL
)
ENABLE ROW MOVEMENT
;

CREATE UNIQUE INDEX rhn_archtypeacts_atid_as_uq
    ON rhnArchTypeActions (arch_type_id, action_style)
    TABLESPACE [[64k_tbs]];

