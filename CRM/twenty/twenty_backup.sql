--
-- PostgreSQL database dump
--

\restrict YrFlPaiVqQNVcGLj0Krwyheti5V4bHsvoowY7h8GyEXFtmweaQlgYXlB3aVrnUp

-- Dumped from database version 16.13 (Debian 16.13-1.pgdg13+1)
-- Dumped by pg_dump version 16.13 (Debian 16.13-1.pgdg13+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: core; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA core;


ALTER SCHEMA core OWNER TO postgres;

--
-- Name: workspace_5tvw23m2ae5qhvivd4el66s5c; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA workspace_5tvw23m2ae5qhvivd4el66s5c;


ALTER SCHEMA workspace_5tvw23m2ae5qhvivd4el66s5c OWNER TO postgres;

--
-- Name: unaccent; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;


--
-- Name: EXTENSION unaccent; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION unaccent IS 'text search dictionary that removes accents';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: agentChatMessage_role_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core."agentChatMessage_role_enum" AS ENUM (
    'user',
    'assistant'
);


ALTER TYPE core."agentChatMessage_role_enum" OWNER TO postgres;

--
-- Name: agentMessage_role_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core."agentMessage_role_enum" AS ENUM (
    'user',
    'assistant',
    'system'
);


ALTER TYPE core."agentMessage_role_enum" OWNER TO postgres;

--
-- Name: agentMessage_status_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core."agentMessage_status_enum" AS ENUM (
    'queued',
    'sent'
);


ALTER TYPE core."agentMessage_status_enum" OWNER TO postgres;

--
-- Name: calendarChannel_contactautocreationpolicy_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core."calendarChannel_contactautocreationpolicy_enum" AS ENUM (
    'AS_PARTICIPANT_AND_ORGANIZER',
    'AS_PARTICIPANT',
    'AS_ORGANIZER',
    'NONE'
);


ALTER TYPE core."calendarChannel_contactautocreationpolicy_enum" OWNER TO postgres;

--
-- Name: calendarChannel_syncstage_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core."calendarChannel_syncstage_enum" AS ENUM (
    'PENDING_CONFIGURATION',
    'CALENDAR_EVENT_LIST_FETCH_PENDING',
    'CALENDAR_EVENT_LIST_FETCH_SCHEDULED',
    'CALENDAR_EVENT_LIST_FETCH_ONGOING',
    'CALENDAR_EVENTS_IMPORT_PENDING',
    'CALENDAR_EVENTS_IMPORT_SCHEDULED',
    'CALENDAR_EVENTS_IMPORT_ONGOING',
    'FAILED'
);


ALTER TYPE core."calendarChannel_syncstage_enum" OWNER TO postgres;

--
-- Name: calendarChannel_syncstatus_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core."calendarChannel_syncstatus_enum" AS ENUM (
    'NOT_SYNCED',
    'ONGOING',
    'ACTIVE',
    'FAILED_INSUFFICIENT_PERMISSIONS',
    'FAILED_UNKNOWN'
);


ALTER TYPE core."calendarChannel_syncstatus_enum" OWNER TO postgres;

--
-- Name: calendarChannel_visibility_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core."calendarChannel_visibility_enum" AS ENUM (
    'METADATA',
    'SHARE_EVERYTHING'
);


ALTER TYPE core."calendarChannel_visibility_enum" OWNER TO postgres;

--
-- Name: commandMenuItem_availabilitytype_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core."commandMenuItem_availabilitytype_enum" AS ENUM (
    'GLOBAL',
    'GLOBAL_OBJECT_CONTEXT',
    'RECORD_SELECTION',
    'FALLBACK'
);


ALTER TYPE core."commandMenuItem_availabilitytype_enum" OWNER TO postgres;

--
-- Name: dataSource_type_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core."dataSource_type_enum" AS ENUM (
    'postgres'
);


ALTER TYPE core."dataSource_type_enum" OWNER TO postgres;

--
-- Name: emailingDomain_driver_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core."emailingDomain_driver_enum" AS ENUM (
    'AWS_SES'
);


ALTER TYPE core."emailingDomain_driver_enum" OWNER TO postgres;

--
-- Name: emailingDomain_status_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core."emailingDomain_status_enum" AS ENUM (
    'PENDING',
    'VERIFIED',
    'FAILED',
    'TEMPORARY_FAILURE'
);


ALTER TYPE core."emailingDomain_status_enum" OWNER TO postgres;

--
-- Name: indexMetadata_indextype_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core."indexMetadata_indextype_enum" AS ENUM (
    'BTREE',
    'GIN'
);


ALTER TYPE core."indexMetadata_indextype_enum" OWNER TO postgres;

--
-- Name: keyValuePair_type_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core."keyValuePair_type_enum" AS ENUM (
    'USER_VARIABLE',
    'FEATURE_FLAG',
    'CONFIG_VARIABLE'
);


ALTER TYPE core."keyValuePair_type_enum" OWNER TO postgres;

--
-- Name: messageChannel_contactautocreationpolicy_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core."messageChannel_contactautocreationpolicy_enum" AS ENUM (
    'SENT_AND_RECEIVED',
    'SENT',
    'NONE'
);


ALTER TYPE core."messageChannel_contactautocreationpolicy_enum" OWNER TO postgres;

--
-- Name: messageChannel_messagefolderimportpolicy_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core."messageChannel_messagefolderimportpolicy_enum" AS ENUM (
    'ALL_FOLDERS',
    'SELECTED_FOLDERS'
);


ALTER TYPE core."messageChannel_messagefolderimportpolicy_enum" OWNER TO postgres;

--
-- Name: messageChannel_pendinggroupemailsaction_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core."messageChannel_pendinggroupemailsaction_enum" AS ENUM (
    'GROUP_EMAILS_DELETION',
    'GROUP_EMAILS_IMPORT',
    'NONE'
);


ALTER TYPE core."messageChannel_pendinggroupemailsaction_enum" OWNER TO postgres;

--
-- Name: messageChannel_syncstage_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core."messageChannel_syncstage_enum" AS ENUM (
    'PENDING_CONFIGURATION',
    'MESSAGE_LIST_FETCH_PENDING',
    'MESSAGE_LIST_FETCH_SCHEDULED',
    'MESSAGE_LIST_FETCH_ONGOING',
    'MESSAGES_IMPORT_PENDING',
    'MESSAGES_IMPORT_SCHEDULED',
    'MESSAGES_IMPORT_ONGOING',
    'FAILED'
);


ALTER TYPE core."messageChannel_syncstage_enum" OWNER TO postgres;

--
-- Name: messageChannel_syncstatus_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core."messageChannel_syncstatus_enum" AS ENUM (
    'NOT_SYNCED',
    'ONGOING',
    'ACTIVE',
    'FAILED_INSUFFICIENT_PERMISSIONS',
    'FAILED_UNKNOWN'
);


ALTER TYPE core."messageChannel_syncstatus_enum" OWNER TO postgres;

--
-- Name: messageChannel_type_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core."messageChannel_type_enum" AS ENUM (
    'EMAIL',
    'SMS'
);


ALTER TYPE core."messageChannel_type_enum" OWNER TO postgres;

--
-- Name: messageChannel_visibility_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core."messageChannel_visibility_enum" AS ENUM (
    'METADATA',
    'SUBJECT',
    'SHARE_EVERYTHING'
);


ALTER TYPE core."messageChannel_visibility_enum" OWNER TO postgres;

--
-- Name: messageFolder_pendingsyncaction_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core."messageFolder_pendingsyncaction_enum" AS ENUM (
    'FOLDER_DELETION',
    'NONE'
);


ALTER TYPE core."messageFolder_pendingsyncaction_enum" OWNER TO postgres;

--
-- Name: navigationMenuItem_type_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core."navigationMenuItem_type_enum" AS ENUM (
    'VIEW',
    'FOLDER',
    'LINK',
    'OBJECT',
    'RECORD',
    'PAGE_LAYOUT'
);


ALTER TYPE core."navigationMenuItem_type_enum" OWNER TO postgres;

--
-- Name: pageLayoutTab_layoutmode_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core."pageLayoutTab_layoutmode_enum" AS ENUM (
    'GRID',
    'VERTICAL_LIST',
    'CANVAS'
);


ALTER TYPE core."pageLayoutTab_layoutmode_enum" OWNER TO postgres;

--
-- Name: pageLayoutWidget_type_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core."pageLayoutWidget_type_enum" AS ENUM (
    'VIEW',
    'IFRAME',
    'FIELD',
    'FIELDS',
    'GRAPH',
    'STANDALONE_RICH_TEXT',
    'TIMELINE',
    'TASKS',
    'NOTES',
    'FILES',
    'EMAILS',
    'CALENDAR',
    'FIELD_RICH_TEXT',
    'WORKFLOW',
    'WORKFLOW_VERSION',
    'WORKFLOW_RUN',
    'FRONT_COMPONENT',
    'RECORD_TABLE',
    'EMAIL_THREAD'
);


ALTER TYPE core."pageLayoutWidget_type_enum" OWNER TO postgres;

--
-- Name: pageLayout_type_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core."pageLayout_type_enum" AS ENUM (
    'RECORD_INDEX',
    'RECORD_PAGE',
    'DASHBOARD',
    'STANDALONE_PAGE'
);


ALTER TYPE core."pageLayout_type_enum" OWNER TO postgres;

--
-- Name: routeTrigger_httpmethod_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core."routeTrigger_httpmethod_enum" AS ENUM (
    'GET',
    'POST',
    'PUT',
    'PATCH',
    'DELETE'
);


ALTER TYPE core."routeTrigger_httpmethod_enum" OWNER TO postgres;

--
-- Name: rowLevelPermissionPredicateGroup_logicaloperator_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core."rowLevelPermissionPredicateGroup_logicaloperator_enum" AS ENUM (
    'AND',
    'OR'
);


ALTER TYPE core."rowLevelPermissionPredicateGroup_logicaloperator_enum" OWNER TO postgres;

--
-- Name: rowLevelPermissionPredicate_operand_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core."rowLevelPermissionPredicate_operand_enum" AS ENUM (
    'IS',
    'IS_NOT_NULL',
    'IS_NOT',
    'LESS_THAN_OR_EQUAL',
    'GREATER_THAN_OR_EQUAL',
    'IS_BEFORE',
    'IS_AFTER',
    'CONTAINS',
    'DOES_NOT_CONTAIN',
    'IS_EMPTY',
    'IS_NOT_EMPTY',
    'IS_RELATIVE',
    'IS_IN_PAST',
    'IS_IN_FUTURE',
    'IS_TODAY',
    'VECTOR_SEARCH'
);


ALTER TYPE core."rowLevelPermissionPredicate_operand_enum" OWNER TO postgres;

--
-- Name: twoFactorAuthenticationMethod_status_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core."twoFactorAuthenticationMethod_status_enum" AS ENUM (
    'PENDING',
    'VERIFIED'
);


ALTER TYPE core."twoFactorAuthenticationMethod_status_enum" OWNER TO postgres;

--
-- Name: twoFactorAuthenticationMethod_strategy_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core."twoFactorAuthenticationMethod_strategy_enum" AS ENUM (
    'TOTP'
);


ALTER TYPE core."twoFactorAuthenticationMethod_strategy_enum" OWNER TO postgres;

--
-- Name: viewField_aggregateoperation_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core."viewField_aggregateoperation_enum" AS ENUM (
    'MIN',
    'MAX',
    'AVG',
    'SUM',
    'COUNT',
    'COUNT_UNIQUE_VALUES',
    'COUNT_EMPTY',
    'COUNT_NOT_EMPTY',
    'COUNT_TRUE',
    'COUNT_FALSE',
    'PERCENTAGE_EMPTY',
    'PERCENTAGE_NOT_EMPTY'
);


ALTER TYPE core."viewField_aggregateoperation_enum" OWNER TO postgres;

--
-- Name: viewFilterGroup_logicaloperator_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core."viewFilterGroup_logicaloperator_enum" AS ENUM (
    'AND',
    'OR',
    'NOT'
);


ALTER TYPE core."viewFilterGroup_logicaloperator_enum" OWNER TO postgres;

--
-- Name: viewFilter_operand_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core."viewFilter_operand_enum" AS ENUM (
    'IS',
    'IS_NOT_NULL',
    'IS_NOT',
    'LESS_THAN_OR_EQUAL',
    'GREATER_THAN_OR_EQUAL',
    'IS_BEFORE',
    'IS_AFTER',
    'CONTAINS',
    'DOES_NOT_CONTAIN',
    'IS_EMPTY',
    'IS_NOT_EMPTY',
    'IS_RELATIVE',
    'IS_IN_PAST',
    'IS_IN_FUTURE',
    'IS_TODAY',
    'VECTOR_SEARCH'
);


ALTER TYPE core."viewFilter_operand_enum" OWNER TO postgres;

--
-- Name: viewSort_direction_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core."viewSort_direction_enum" AS ENUM (
    'ASC',
    'DESC'
);


ALTER TYPE core."viewSort_direction_enum" OWNER TO postgres;

--
-- Name: view_calendarlayout_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core.view_calendarlayout_enum AS ENUM (
    'DAY',
    'WEEK',
    'MONTH'
);


ALTER TYPE core.view_calendarlayout_enum OWNER TO postgres;

--
-- Name: view_kanbanaggregateoperation_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core.view_kanbanaggregateoperation_enum AS ENUM (
    'MIN',
    'MAX',
    'AVG',
    'SUM',
    'COUNT',
    'COUNT_UNIQUE_VALUES',
    'COUNT_EMPTY',
    'COUNT_NOT_EMPTY',
    'COUNT_TRUE',
    'COUNT_FALSE',
    'PERCENTAGE_EMPTY',
    'PERCENTAGE_NOT_EMPTY'
);


ALTER TYPE core.view_kanbanaggregateoperation_enum OWNER TO postgres;

--
-- Name: view_key_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core.view_key_enum AS ENUM (
    'INDEX'
);


ALTER TYPE core.view_key_enum OWNER TO postgres;

--
-- Name: view_openrecordin_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core.view_openrecordin_enum AS ENUM (
    'SIDE_PANEL',
    'RECORD_PAGE'
);


ALTER TYPE core.view_openrecordin_enum OWNER TO postgres;

--
-- Name: view_type_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core.view_type_enum AS ENUM (
    'TABLE',
    'KANBAN',
    'CALENDAR',
    'FIELDS_WIDGET',
    'TABLE_WIDGET'
);


ALTER TYPE core.view_type_enum OWNER TO postgres;

--
-- Name: view_visibility_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core.view_visibility_enum AS ENUM (
    'WORKSPACE',
    'UNLISTED'
);


ALTER TYPE core.view_visibility_enum OWNER TO postgres;

--
-- Name: workspaceSSOIdentityProvider_status_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core."workspaceSSOIdentityProvider_status_enum" AS ENUM (
    'Active',
    'Inactive',
    'Error'
);


ALTER TYPE core."workspaceSSOIdentityProvider_status_enum" OWNER TO postgres;

--
-- Name: workspaceSSOIdentityProvider_type_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core."workspaceSSOIdentityProvider_type_enum" AS ENUM (
    'OIDC',
    'SAML'
);


ALTER TYPE core."workspaceSSOIdentityProvider_type_enum" OWNER TO postgres;

--
-- Name: workspace_activationStatus_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core."workspace_activationStatus_enum" AS ENUM (
    'ONGOING_CREATION',
    'PENDING_CREATION',
    'ACTIVE',
    'INACTIVE',
    'SUSPENDED'
);


ALTER TYPE core."workspace_activationStatus_enum" OWNER TO postgres;

--
-- Name: _habitLog_createdBySource_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."_habitLog_createdBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."_habitLog_createdBySource_enum" OWNER TO postgres;

--
-- Name: _habitLog_status_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."_habitLog_status_enum" AS ENUM (
    'FULL',
    'MICRO',
    'MISSED'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."_habitLog_status_enum" OWNER TO postgres;

--
-- Name: _habitLog_updatedBySource_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."_habitLog_updatedBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."_habitLog_updatedBySource_enum" OWNER TO postgres;

--
-- Name: _habit_createdBySource_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."_habit_createdBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."_habit_createdBySource_enum" OWNER TO postgres;

--
-- Name: _habit_updatedBySource_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."_habit_updatedBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."_habit_updatedBySource_enum" OWNER TO postgres;

--
-- Name: attachment_createdBySource_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."attachment_createdBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."attachment_createdBySource_enum" OWNER TO postgres;

--
-- Name: attachment_fileCategory_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."attachment_fileCategory_enum" AS ENUM (
    'ARCHIVE',
    'AUDIO',
    'IMAGE',
    'PRESENTATION',
    'SPREADSHEET',
    'TEXT_DOCUMENT',
    'VIDEO',
    'OTHER'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."attachment_fileCategory_enum" OWNER TO postgres;

--
-- Name: attachment_updatedBySource_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."attachment_updatedBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."attachment_updatedBySource_enum" OWNER TO postgres;

--
-- Name: blocklist_createdBySource_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."blocklist_createdBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."blocklist_createdBySource_enum" OWNER TO postgres;

--
-- Name: blocklist_updatedBySource_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."blocklist_updatedBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."blocklist_updatedBySource_enum" OWNER TO postgres;

--
-- Name: calendarChannelEventAssociation_createdBySource_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."calendarChannelEventAssociation_createdBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."calendarChannelEventAssociation_createdBySource_enum" OWNER TO postgres;

--
-- Name: calendarChannelEventAssociation_updatedBySource_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."calendarChannelEventAssociation_updatedBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."calendarChannelEventAssociation_updatedBySource_enum" OWNER TO postgres;

--
-- Name: calendarChannel_contactAutoCreationPolicy_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."calendarChannel_contactAutoCreationPolicy_enum" AS ENUM (
    'AS_PARTICIPANT_AND_ORGANIZER',
    'AS_PARTICIPANT',
    'AS_ORGANIZER',
    'NONE'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."calendarChannel_contactAutoCreationPolicy_enum" OWNER TO postgres;

--
-- Name: calendarChannel_createdBySource_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."calendarChannel_createdBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."calendarChannel_createdBySource_enum" OWNER TO postgres;

--
-- Name: calendarChannel_syncStage_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."calendarChannel_syncStage_enum" AS ENUM (
    'CALENDAR_EVENT_LIST_FETCH_PENDING',
    'CALENDAR_EVENT_LIST_FETCH_SCHEDULED',
    'CALENDAR_EVENT_LIST_FETCH_ONGOING',
    'CALENDAR_EVENTS_IMPORT_PENDING',
    'CALENDAR_EVENTS_IMPORT_SCHEDULED',
    'CALENDAR_EVENTS_IMPORT_ONGOING',
    'FAILED',
    'PENDING_CONFIGURATION'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."calendarChannel_syncStage_enum" OWNER TO postgres;

--
-- Name: calendarChannel_syncStatus_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."calendarChannel_syncStatus_enum" AS ENUM (
    'ONGOING',
    'NOT_SYNCED',
    'ACTIVE',
    'FAILED_INSUFFICIENT_PERMISSIONS',
    'FAILED_UNKNOWN'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."calendarChannel_syncStatus_enum" OWNER TO postgres;

--
-- Name: calendarChannel_updatedBySource_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."calendarChannel_updatedBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."calendarChannel_updatedBySource_enum" OWNER TO postgres;

--
-- Name: calendarChannel_visibility_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."calendarChannel_visibility_enum" AS ENUM (
    'METADATA',
    'SHARE_EVERYTHING'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."calendarChannel_visibility_enum" OWNER TO postgres;

--
-- Name: calendarEventParticipant_createdBySource_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."calendarEventParticipant_createdBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."calendarEventParticipant_createdBySource_enum" OWNER TO postgres;

--
-- Name: calendarEventParticipant_responseStatus_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."calendarEventParticipant_responseStatus_enum" AS ENUM (
    'NEEDS_ACTION',
    'DECLINED',
    'TENTATIVE',
    'ACCEPTED'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."calendarEventParticipant_responseStatus_enum" OWNER TO postgres;

--
-- Name: calendarEventParticipant_updatedBySource_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."calendarEventParticipant_updatedBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."calendarEventParticipant_updatedBySource_enum" OWNER TO postgres;

--
-- Name: calendarEvent_createdBySource_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."calendarEvent_createdBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."calendarEvent_createdBySource_enum" OWNER TO postgres;

--
-- Name: calendarEvent_updatedBySource_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."calendarEvent_updatedBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."calendarEvent_updatedBySource_enum" OWNER TO postgres;

--
-- Name: company_createdBySource_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."company_createdBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."company_createdBySource_enum" OWNER TO postgres;

--
-- Name: company_updatedBySource_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."company_updatedBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."company_updatedBySource_enum" OWNER TO postgres;

--
-- Name: connectedAccount_createdBySource_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."connectedAccount_createdBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."connectedAccount_createdBySource_enum" OWNER TO postgres;

--
-- Name: connectedAccount_updatedBySource_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."connectedAccount_updatedBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."connectedAccount_updatedBySource_enum" OWNER TO postgres;

--
-- Name: dashboard_createdBySource_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."dashboard_createdBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."dashboard_createdBySource_enum" OWNER TO postgres;

--
-- Name: dashboard_updatedBySource_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."dashboard_updatedBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."dashboard_updatedBySource_enum" OWNER TO postgres;

--
-- Name: messageChannelMessageAssociationMessageFolder_createdBySource_e; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannelMessageAssociationMessageFolder_createdBySource_e" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannelMessageAssociationMessageFolder_createdBySource_e" OWNER TO postgres;

--
-- Name: messageChannelMessageAssociationMessageFolder_updatedBySource_e; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannelMessageAssociationMessageFolder_updatedBySource_e" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannelMessageAssociationMessageFolder_updatedBySource_e" OWNER TO postgres;

--
-- Name: messageChannelMessageAssociation_createdBySource_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannelMessageAssociation_createdBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannelMessageAssociation_createdBySource_enum" OWNER TO postgres;

--
-- Name: messageChannelMessageAssociation_direction_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannelMessageAssociation_direction_enum" AS ENUM (
    'INCOMING',
    'OUTGOING'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannelMessageAssociation_direction_enum" OWNER TO postgres;

--
-- Name: messageChannelMessageAssociation_updatedBySource_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannelMessageAssociation_updatedBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannelMessageAssociation_updatedBySource_enum" OWNER TO postgres;

--
-- Name: messageChannel_contactAutoCreationPolicy_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannel_contactAutoCreationPolicy_enum" AS ENUM (
    'SENT_AND_RECEIVED',
    'SENT',
    'NONE'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannel_contactAutoCreationPolicy_enum" OWNER TO postgres;

--
-- Name: messageChannel_createdBySource_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannel_createdBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannel_createdBySource_enum" OWNER TO postgres;

--
-- Name: messageChannel_messageFolderImportPolicy_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannel_messageFolderImportPolicy_enum" AS ENUM (
    'ALL_FOLDERS',
    'SELECTED_FOLDERS'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannel_messageFolderImportPolicy_enum" OWNER TO postgres;

--
-- Name: messageChannel_pendingGroupEmailsAction_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannel_pendingGroupEmailsAction_enum" AS ENUM (
    'GROUP_EMAILS_DELETION',
    'GROUP_EMAILS_IMPORT',
    'NONE'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannel_pendingGroupEmailsAction_enum" OWNER TO postgres;

--
-- Name: messageChannel_syncStage_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannel_syncStage_enum" AS ENUM (
    'MESSAGE_LIST_FETCH_PENDING',
    'MESSAGE_LIST_FETCH_SCHEDULED',
    'MESSAGE_LIST_FETCH_ONGOING',
    'MESSAGES_IMPORT_PENDING',
    'MESSAGES_IMPORT_SCHEDULED',
    'MESSAGES_IMPORT_ONGOING',
    'FAILED',
    'PENDING_CONFIGURATION'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannel_syncStage_enum" OWNER TO postgres;

--
-- Name: messageChannel_syncStatus_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannel_syncStatus_enum" AS ENUM (
    'ONGOING',
    'NOT_SYNCED',
    'ACTIVE',
    'FAILED_INSUFFICIENT_PERMISSIONS',
    'FAILED_UNKNOWN'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannel_syncStatus_enum" OWNER TO postgres;

--
-- Name: messageChannel_type_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannel_type_enum" AS ENUM (
    'EMAIL',
    'SMS'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannel_type_enum" OWNER TO postgres;

--
-- Name: messageChannel_updatedBySource_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannel_updatedBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannel_updatedBySource_enum" OWNER TO postgres;

--
-- Name: messageChannel_visibility_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannel_visibility_enum" AS ENUM (
    'METADATA',
    'SUBJECT',
    'SHARE_EVERYTHING'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannel_visibility_enum" OWNER TO postgres;

--
-- Name: messageFolder_createdBySource_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."messageFolder_createdBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."messageFolder_createdBySource_enum" OWNER TO postgres;

--
-- Name: messageFolder_pendingSyncAction_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."messageFolder_pendingSyncAction_enum" AS ENUM (
    'FOLDER_DELETION',
    'NONE'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."messageFolder_pendingSyncAction_enum" OWNER TO postgres;

--
-- Name: messageFolder_updatedBySource_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."messageFolder_updatedBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."messageFolder_updatedBySource_enum" OWNER TO postgres;

--
-- Name: messageParticipant_createdBySource_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."messageParticipant_createdBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."messageParticipant_createdBySource_enum" OWNER TO postgres;

--
-- Name: messageParticipant_role_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."messageParticipant_role_enum" AS ENUM (
    'FROM',
    'TO',
    'CC',
    'BCC'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."messageParticipant_role_enum" OWNER TO postgres;

--
-- Name: messageParticipant_updatedBySource_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."messageParticipant_updatedBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."messageParticipant_updatedBySource_enum" OWNER TO postgres;

--
-- Name: messageThread_createdBySource_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."messageThread_createdBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."messageThread_createdBySource_enum" OWNER TO postgres;

--
-- Name: messageThread_updatedBySource_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."messageThread_updatedBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."messageThread_updatedBySource_enum" OWNER TO postgres;

--
-- Name: message_createdBySource_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."message_createdBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."message_createdBySource_enum" OWNER TO postgres;

--
-- Name: message_direction_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c.message_direction_enum AS ENUM (
    'INCOMING',
    'OUTGOING'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c.message_direction_enum OWNER TO postgres;

--
-- Name: message_updatedBySource_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."message_updatedBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."message_updatedBySource_enum" OWNER TO postgres;

--
-- Name: noteTarget_createdBySource_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."noteTarget_createdBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."noteTarget_createdBySource_enum" OWNER TO postgres;

--
-- Name: noteTarget_updatedBySource_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."noteTarget_updatedBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."noteTarget_updatedBySource_enum" OWNER TO postgres;

--
-- Name: note_createdBySource_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."note_createdBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."note_createdBySource_enum" OWNER TO postgres;

--
-- Name: note_updatedBySource_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."note_updatedBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."note_updatedBySource_enum" OWNER TO postgres;

--
-- Name: opportunity_createdBySource_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."opportunity_createdBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."opportunity_createdBySource_enum" OWNER TO postgres;

--
-- Name: opportunity_stage_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c.opportunity_stage_enum AS ENUM (
    'NEW',
    'SCREENING',
    'MEETING',
    'PROPOSAL',
    'CUSTOMER'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c.opportunity_stage_enum OWNER TO postgres;

--
-- Name: opportunity_updatedBySource_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."opportunity_updatedBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."opportunity_updatedBySource_enum" OWNER TO postgres;

--
-- Name: person_createdBySource_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."person_createdBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."person_createdBySource_enum" OWNER TO postgres;

--
-- Name: person_updatedBySource_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."person_updatedBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."person_updatedBySource_enum" OWNER TO postgres;

--
-- Name: taskTarget_createdBySource_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."taskTarget_createdBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."taskTarget_createdBySource_enum" OWNER TO postgres;

--
-- Name: taskTarget_updatedBySource_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."taskTarget_updatedBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."taskTarget_updatedBySource_enum" OWNER TO postgres;

--
-- Name: task_createdBySource_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."task_createdBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."task_createdBySource_enum" OWNER TO postgres;

--
-- Name: task_status_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c.task_status_enum AS ENUM (
    'TODO',
    'IN_PROGRESS',
    'DONE'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c.task_status_enum OWNER TO postgres;

--
-- Name: task_updatedBySource_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."task_updatedBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."task_updatedBySource_enum" OWNER TO postgres;

--
-- Name: timelineActivity_createdBySource_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."timelineActivity_createdBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."timelineActivity_createdBySource_enum" OWNER TO postgres;

--
-- Name: timelineActivity_updatedBySource_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."timelineActivity_updatedBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."timelineActivity_updatedBySource_enum" OWNER TO postgres;

--
-- Name: workflowAutomatedTrigger_createdBySource_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."workflowAutomatedTrigger_createdBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."workflowAutomatedTrigger_createdBySource_enum" OWNER TO postgres;

--
-- Name: workflowAutomatedTrigger_type_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."workflowAutomatedTrigger_type_enum" AS ENUM (
    'DATABASE_EVENT',
    'CRON'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."workflowAutomatedTrigger_type_enum" OWNER TO postgres;

--
-- Name: workflowAutomatedTrigger_updatedBySource_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."workflowAutomatedTrigger_updatedBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."workflowAutomatedTrigger_updatedBySource_enum" OWNER TO postgres;

--
-- Name: workflowRun_createdBySource_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."workflowRun_createdBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."workflowRun_createdBySource_enum" OWNER TO postgres;

--
-- Name: workflowRun_status_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."workflowRun_status_enum" AS ENUM (
    'NOT_STARTED',
    'RUNNING',
    'COMPLETED',
    'FAILED',
    'ENQUEUED',
    'STOPPING',
    'STOPPED'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."workflowRun_status_enum" OWNER TO postgres;

--
-- Name: workflowRun_updatedBySource_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."workflowRun_updatedBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."workflowRun_updatedBySource_enum" OWNER TO postgres;

--
-- Name: workflowVersion_createdBySource_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."workflowVersion_createdBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."workflowVersion_createdBySource_enum" OWNER TO postgres;

--
-- Name: workflowVersion_status_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."workflowVersion_status_enum" AS ENUM (
    'DRAFT',
    'ACTIVE',
    'DEACTIVATED',
    'ARCHIVED'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."workflowVersion_status_enum" OWNER TO postgres;

--
-- Name: workflowVersion_updatedBySource_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."workflowVersion_updatedBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."workflowVersion_updatedBySource_enum" OWNER TO postgres;

--
-- Name: workflow_createdBySource_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."workflow_createdBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."workflow_createdBySource_enum" OWNER TO postgres;

--
-- Name: workflow_statuses_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c.workflow_statuses_enum AS ENUM (
    'DRAFT',
    'ACTIVE',
    'DEACTIVATED'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c.workflow_statuses_enum OWNER TO postgres;

--
-- Name: workflow_updatedBySource_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."workflow_updatedBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."workflow_updatedBySource_enum" OWNER TO postgres;

--
-- Name: workspaceMember_createdBySource_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."workspaceMember_createdBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."workspaceMember_createdBySource_enum" OWNER TO postgres;

--
-- Name: workspaceMember_dateFormat_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."workspaceMember_dateFormat_enum" AS ENUM (
    'SYSTEM',
    'MONTH_FIRST',
    'DAY_FIRST',
    'YEAR_FIRST'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."workspaceMember_dateFormat_enum" OWNER TO postgres;

--
-- Name: workspaceMember_numberFormat_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."workspaceMember_numberFormat_enum" AS ENUM (
    'SYSTEM',
    'COMMAS_AND_DOT',
    'SPACES_AND_COMMA',
    'DOTS_AND_COMMA',
    'APOSTROPHE_AND_DOT'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."workspaceMember_numberFormat_enum" OWNER TO postgres;

--
-- Name: workspaceMember_timeFormat_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."workspaceMember_timeFormat_enum" AS ENUM (
    'SYSTEM',
    'HOUR_24',
    'HOUR_12'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."workspaceMember_timeFormat_enum" OWNER TO postgres;

--
-- Name: workspaceMember_updatedBySource_enum; Type: TYPE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."workspaceMember_updatedBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_5tvw23m2ae5qhvivd4el66s5c."workspaceMember_updatedBySource_enum" OWNER TO postgres;

--
-- Name: unaccent_immutable(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.unaccent_immutable(input text) RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $$
        SELECT public.unaccent('public.unaccent'::regdictionary, input)
        $$;


ALTER FUNCTION public.unaccent_immutable(input text) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: _typeorm_generated_columns_and_materialized_views; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core._typeorm_generated_columns_and_materialized_views (
    type character varying NOT NULL,
    database character varying,
    schema character varying,
    "table" character varying,
    name character varying,
    value text
);


ALTER TABLE core._typeorm_generated_columns_and_materialized_views OWNER TO postgres;

--
-- Name: _typeorm_migrations; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core._typeorm_migrations (
    id integer NOT NULL,
    "timestamp" bigint NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE core._typeorm_migrations OWNER TO postgres;

--
-- Name: _typeorm_migrations_id_seq; Type: SEQUENCE; Schema: core; Owner: postgres
--

CREATE SEQUENCE core._typeorm_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE core._typeorm_migrations_id_seq OWNER TO postgres;

--
-- Name: _typeorm_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: core; Owner: postgres
--

ALTER SEQUENCE core._typeorm_migrations_id_seq OWNED BY core._typeorm_migrations.id;


--
-- Name: agent; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core.agent (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying NOT NULL,
    label character varying NOT NULL,
    icon character varying,
    description text,
    prompt text NOT NULL,
    "modelId" character varying DEFAULT 'default-smart-model'::character varying NOT NULL,
    "responseFormat" jsonb DEFAULT '{"type": "text"}'::jsonb,
    "workspaceId" uuid NOT NULL,
    "isCustom" boolean DEFAULT false NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "applicationId" uuid NOT NULL,
    "modelConfiguration" jsonb,
    "universalIdentifier" uuid NOT NULL,
    "evaluationInputs" text[] DEFAULT '{}'::text[] NOT NULL
);


ALTER TABLE core.agent OWNER TO postgres;

--
-- Name: agentChatThread; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."agentChatThread" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "userWorkspaceId" uuid NOT NULL,
    title character varying,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "totalInputTokens" integer DEFAULT 0 NOT NULL,
    "totalOutputTokens" integer DEFAULT 0 NOT NULL,
    "contextWindowTokens" integer,
    "totalInputCredits" bigint DEFAULT 0 NOT NULL,
    "totalOutputCredits" bigint DEFAULT 0 NOT NULL,
    "conversationSize" integer DEFAULT 0 NOT NULL,
    "activeStreamId" character varying,
    "workspaceId" uuid NOT NULL
);


ALTER TABLE core."agentChatThread" OWNER TO postgres;

--
-- Name: agentMessage; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."agentMessage" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "threadId" uuid NOT NULL,
    "turnId" uuid,
    "agentId" uuid,
    role core."agentMessage_role_enum" NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    status core."agentMessage_status_enum" DEFAULT 'sent'::core."agentMessage_status_enum" NOT NULL,
    "processedAt" timestamp with time zone,
    "workspaceId" uuid NOT NULL
);


ALTER TABLE core."agentMessage" OWNER TO postgres;

--
-- Name: agentMessagePart; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."agentMessagePart" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "messageId" uuid NOT NULL,
    "orderIndex" integer NOT NULL,
    type character varying NOT NULL,
    "textContent" text,
    "reasoningContent" text,
    "toolName" character varying,
    "toolCallId" character varying,
    "toolInput" jsonb,
    "toolOutput" jsonb,
    state character varying,
    "errorMessage" text,
    "errorDetails" jsonb,
    "sourceUrlSourceId" character varying,
    "sourceUrlUrl" character varying,
    "sourceUrlTitle" character varying,
    "sourceDocumentSourceId" character varying,
    "sourceDocumentMediaType" character varying,
    "sourceDocumentTitle" character varying,
    "sourceDocumentFilename" character varying,
    "fileFilename" character varying,
    "providerMetadata" jsonb,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "fileId" uuid,
    "workspaceId" uuid NOT NULL,
    "providerExecuted" boolean
);


ALTER TABLE core."agentMessagePart" OWNER TO postgres;

--
-- Name: agentTurn; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."agentTurn" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "threadId" uuid NOT NULL,
    "agentId" uuid,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "workspaceId" uuid NOT NULL
);


ALTER TABLE core."agentTurn" OWNER TO postgres;

--
-- Name: agentTurnEvaluation; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."agentTurnEvaluation" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "turnId" uuid NOT NULL,
    score integer NOT NULL,
    comment text,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "workspaceId" uuid NOT NULL
);


ALTER TABLE core."agentTurnEvaluation" OWNER TO postgres;

--
-- Name: apiKey; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."apiKey" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying NOT NULL,
    "expiresAt" timestamp with time zone NOT NULL,
    "revokedAt" timestamp with time zone,
    "workspaceId" uuid NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE core."apiKey" OWNER TO postgres;

--
-- Name: appToken; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."appToken" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "userId" uuid,
    "workspaceId" uuid,
    type text DEFAULT 'REFRESH_TOKEN'::text NOT NULL,
    value text,
    "expiresAt" timestamp with time zone NOT NULL,
    "deletedAt" timestamp with time zone,
    "revokedAt" timestamp with time zone,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    context jsonb
);


ALTER TABLE core."appToken" OWNER TO postgres;

--
-- Name: application; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core.application (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "universalIdentifier" uuid NOT NULL,
    name text NOT NULL,
    description text,
    version text,
    "sourceType" text DEFAULT 'local'::text NOT NULL,
    "sourcePath" text NOT NULL,
    "workspaceId" uuid NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "logicFunctionLayerId" uuid,
    "canBeUninstalled" boolean DEFAULT true NOT NULL,
    "defaultRoleId" uuid,
    "packageJsonChecksum" text,
    "packageJsonFileId" uuid,
    "yarnLockChecksum" text,
    "yarnLockFileId" uuid,
    "availablePackages" jsonb DEFAULT '{}'::jsonb NOT NULL,
    "settingsCustomTabFrontComponentId" uuid,
    "applicationRegistrationId" uuid,
    "isSdkLayerStale" boolean DEFAULT false NOT NULL
);


ALTER TABLE core.application OWNER TO postgres;

--
-- Name: applicationRegistration; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."applicationRegistration" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "universalIdentifier" uuid NOT NULL,
    name text NOT NULL,
    "oAuthClientId" text NOT NULL,
    "oAuthClientSecretHash" text,
    "oAuthRedirectUris" text[] DEFAULT '{}'::text[] NOT NULL,
    "oAuthScopes" text[] DEFAULT '{}'::text[] NOT NULL,
    "createdByUserId" uuid,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "workspaceId" uuid,
    "sourceType" text DEFAULT 'local'::text NOT NULL,
    "sourcePackage" text,
    "tarballFileId" uuid,
    "latestAvailableVersion" text,
    "isFeatured" boolean DEFAULT false NOT NULL,
    manifest jsonb,
    "isListed" boolean DEFAULT false NOT NULL,
    "isPreInstalled" boolean DEFAULT false NOT NULL,
    CONSTRAINT "CHK_NPM_HAS_SOURCE_PACKAGE" CHECK ((("sourceType" <> 'npm'::text) OR ("sourcePackage" IS NOT NULL)))
);


ALTER TABLE core."applicationRegistration" OWNER TO postgres;

--
-- Name: applicationRegistrationVariable; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."applicationRegistrationVariable" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    key text NOT NULL,
    "encryptedValue" text DEFAULT ''::text NOT NULL,
    description text DEFAULT ''::text NOT NULL,
    "isSecret" boolean DEFAULT true NOT NULL,
    "isRequired" boolean DEFAULT false NOT NULL,
    "applicationRegistrationId" uuid NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE core."applicationRegistrationVariable" OWNER TO postgres;

--
-- Name: applicationVariable; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."applicationVariable" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    key text NOT NULL,
    value text DEFAULT ''::text NOT NULL,
    description text DEFAULT ''::text NOT NULL,
    "isSecret" boolean DEFAULT false NOT NULL,
    "applicationId" uuid,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "workspaceId" uuid NOT NULL
);


ALTER TABLE core."applicationVariable" OWNER TO postgres;

--
-- Name: approvedAccessDomain; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."approvedAccessDomain" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    domain character varying NOT NULL,
    "isValidated" boolean DEFAULT false NOT NULL,
    "workspaceId" uuid NOT NULL
);


ALTER TABLE core."approvedAccessDomain" OWNER TO postgres;

--
-- Name: calendarChannel; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."calendarChannel" (
    "workspaceId" uuid NOT NULL,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    handle character varying NOT NULL,
    "syncStatus" core."calendarChannel_syncstatus_enum" DEFAULT 'NOT_SYNCED'::core."calendarChannel_syncstatus_enum" NOT NULL,
    "syncStage" core."calendarChannel_syncstage_enum" NOT NULL,
    visibility core."calendarChannel_visibility_enum" NOT NULL,
    "isContactAutoCreationEnabled" boolean DEFAULT true NOT NULL,
    "contactAutoCreationPolicy" core."calendarChannel_contactautocreationpolicy_enum" DEFAULT 'AS_PARTICIPANT_AND_ORGANIZER'::core."calendarChannel_contactautocreationpolicy_enum" NOT NULL,
    "isSyncEnabled" boolean DEFAULT true NOT NULL,
    "syncCursor" character varying,
    "syncedAt" timestamp with time zone,
    "syncStageStartedAt" timestamp with time zone,
    "throttleFailureCount" integer DEFAULT 0 NOT NULL,
    "connectedAccountId" uuid NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE core."calendarChannel" OWNER TO postgres;

--
-- Name: commandMenuItem; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."commandMenuItem" (
    "workspaceId" uuid NOT NULL,
    "universalIdentifier" uuid NOT NULL,
    "applicationId" uuid NOT NULL,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "workflowVersionId" uuid,
    label character varying NOT NULL,
    icon character varying,
    "isPinned" boolean DEFAULT false NOT NULL,
    "availabilityType" core."commandMenuItem_availabilitytype_enum" DEFAULT 'GLOBAL'::core."commandMenuItem_availabilitytype_enum" NOT NULL,
    "availabilityObjectMetadataId" uuid,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "frontComponentId" uuid,
    "conditionalAvailabilityExpression" character varying,
    "shortLabel" character varying,
    "position" double precision DEFAULT '0'::double precision NOT NULL,
    "engineComponentKey" character varying NOT NULL,
    "hotKeys" text[],
    payload jsonb,
    "pageLayoutId" uuid,
    CONSTRAINT "CHK_CMD_MENU_ITEM_ENGINE_KEY_COHERENCE" CHECK ((((("engineComponentKey")::text = 'TRIGGER_WORKFLOW_VERSION'::text) AND ("workflowVersionId" IS NOT NULL) AND ("frontComponentId" IS NULL) AND (payload IS NULL)) OR ((("engineComponentKey")::text = 'FRONT_COMPONENT_RENDERER'::text) AND ("frontComponentId" IS NOT NULL) AND ("workflowVersionId" IS NULL) AND (payload IS NULL)) OR ((("engineComponentKey")::text = 'NAVIGATION'::text) AND (payload IS NOT NULL) AND ("workflowVersionId" IS NULL) AND ("frontComponentId" IS NULL)) OR ((("engineComponentKey")::text <> ALL ((ARRAY['TRIGGER_WORKFLOW_VERSION'::character varying, 'FRONT_COMPONENT_RENDERER'::character varying, 'NAVIGATION'::character varying])::text[])) AND ("workflowVersionId" IS NULL) AND ("frontComponentId" IS NULL) AND (payload IS NULL))))
);


ALTER TABLE core."commandMenuItem" OWNER TO postgres;

--
-- Name: connectedAccount; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."connectedAccount" (
    "workspaceId" uuid NOT NULL,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    handle character varying NOT NULL,
    provider character varying NOT NULL,
    "accessToken" character varying,
    "refreshToken" character varying,
    "lastCredentialsRefreshedAt" timestamp with time zone,
    "authFailedAt" timestamp with time zone,
    "handleAliases" character varying[],
    scopes character varying[],
    "connectionParameters" jsonb,
    "lastSignedInAt" timestamp with time zone,
    "oidcTokenClaims" jsonb,
    "userWorkspaceId" uuid NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE core."connectedAccount" OWNER TO postgres;

--
-- Name: dataSource; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."dataSource" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    label character varying,
    url character varying,
    schema character varying,
    type core."dataSource_type_enum" DEFAULT 'postgres'::core."dataSource_type_enum" NOT NULL,
    "isRemote" boolean DEFAULT false NOT NULL,
    "workspaceId" uuid NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE core."dataSource" OWNER TO postgres;

--
-- Name: emailingDomain; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."emailingDomain" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    domain character varying NOT NULL,
    driver core."emailingDomain_driver_enum" NOT NULL,
    status core."emailingDomain_status_enum" DEFAULT 'PENDING'::core."emailingDomain_status_enum" NOT NULL,
    "verificationRecords" jsonb,
    "verifiedAt" timestamp with time zone,
    "workspaceId" uuid NOT NULL
);


ALTER TABLE core."emailingDomain" OWNER TO postgres;

--
-- Name: featureFlag; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."featureFlag" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    key text NOT NULL,
    "workspaceId" uuid NOT NULL,
    value boolean NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE core."featureFlag" OWNER TO postgres;

--
-- Name: fieldMetadata; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."fieldMetadata" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "objectMetadataId" uuid NOT NULL,
    type character varying NOT NULL,
    name character varying NOT NULL,
    label character varying NOT NULL,
    "defaultValue" jsonb,
    description text,
    icon character varying,
    "standardOverrides" jsonb,
    options jsonb,
    settings jsonb,
    "isCustom" boolean DEFAULT false NOT NULL,
    "isActive" boolean DEFAULT false NOT NULL,
    "isSystem" boolean DEFAULT false NOT NULL,
    "isUIReadOnly" boolean DEFAULT false NOT NULL,
    "isNullable" boolean DEFAULT true,
    "isUnique" boolean DEFAULT false,
    "workspaceId" uuid NOT NULL,
    "isLabelSyncedWithName" boolean DEFAULT false NOT NULL,
    "relationTargetFieldMetadataId" uuid,
    "relationTargetObjectMetadataId" uuid,
    "morphId" uuid,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "universalIdentifier" uuid NOT NULL,
    "applicationId" uuid NOT NULL,
    CONSTRAINT "CHK_FIELD_METADATA_MORPH_RELATION_REQUIRES_MORPH_ID" CHECK ((((type)::text <> 'MORPH_RELATION'::text) OR (((type)::text = 'MORPH_RELATION'::text) AND ("morphId" IS NOT NULL))))
);


ALTER TABLE core."fieldMetadata" OWNER TO postgres;

--
-- Name: fieldPermission; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."fieldPermission" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "roleId" uuid NOT NULL,
    "objectMetadataId" uuid NOT NULL,
    "fieldMetadataId" uuid NOT NULL,
    "canReadFieldValue" boolean,
    "canUpdateFieldValue" boolean,
    "workspaceId" uuid NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "universalIdentifier" uuid NOT NULL,
    "applicationId" uuid NOT NULL
);


ALTER TABLE core."fieldPermission" OWNER TO postgres;

--
-- Name: file; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core.file (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    size bigint NOT NULL,
    "workspaceId" uuid NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "applicationId" uuid,
    path character varying NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "isStaticAsset" boolean DEFAULT false NOT NULL,
    settings jsonb,
    "mimeType" character varying DEFAULT 'application/octet-stream'::character varying NOT NULL
);


ALTER TABLE core.file OWNER TO postgres;

--
-- Name: frontComponent; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."frontComponent" (
    "workspaceId" uuid NOT NULL,
    "universalIdentifier" uuid NOT NULL,
    "applicationId" uuid NOT NULL,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    description character varying,
    "sourceComponentPath" character varying NOT NULL,
    "builtComponentPath" character varying NOT NULL,
    "componentName" character varying NOT NULL,
    "builtComponentChecksum" character varying NOT NULL,
    "isHeadless" boolean DEFAULT false NOT NULL,
    "usesSdkClient" boolean DEFAULT false NOT NULL
);


ALTER TABLE core."frontComponent" OWNER TO postgres;

--
-- Name: indexFieldMetadata; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."indexFieldMetadata" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "indexMetadataId" uuid NOT NULL,
    "fieldMetadataId" uuid NOT NULL,
    "order" integer NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "workspaceId" uuid NOT NULL
);


ALTER TABLE core."indexFieldMetadata" OWNER TO postgres;

--
-- Name: indexMetadata; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."indexMetadata" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    name character varying NOT NULL,
    "workspaceId" uuid NOT NULL,
    "objectMetadataId" uuid NOT NULL,
    "isCustom" boolean DEFAULT false NOT NULL,
    "isUnique" boolean DEFAULT false NOT NULL,
    "indexWhereClause" text,
    "indexType" core."indexMetadata_indextype_enum" DEFAULT 'BTREE'::core."indexMetadata_indextype_enum" NOT NULL,
    "universalIdentifier" uuid NOT NULL,
    "applicationId" uuid NOT NULL
);


ALTER TABLE core."indexMetadata" OWNER TO postgres;

--
-- Name: keyValuePair; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."keyValuePair" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "userId" uuid,
    "workspaceId" uuid,
    key text NOT NULL,
    value jsonb,
    "textValueDeprecated" text,
    type core."keyValuePair_type_enum" DEFAULT 'USER_VARIABLE'::core."keyValuePair_type_enum" NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone
);


ALTER TABLE core."keyValuePair" OWNER TO postgres;

--
-- Name: logicFunction; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."logicFunction" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying NOT NULL,
    description character varying,
    runtime character varying DEFAULT 'nodejs22.x'::character varying NOT NULL,
    "timeoutSeconds" integer DEFAULT 300 NOT NULL,
    "workspaceId" uuid NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "universalIdentifier" uuid NOT NULL,
    "applicationId" uuid NOT NULL,
    checksum text,
    "sourceHandlerPath" character varying NOT NULL,
    "handlerName" character varying NOT NULL,
    "toolInputSchema" jsonb,
    "isTool" boolean DEFAULT false NOT NULL,
    "builtHandlerPath" character varying NOT NULL,
    "cronTriggerSettings" jsonb,
    "databaseEventTriggerSettings" jsonb,
    "httpRouteTriggerSettings" jsonb,
    "isBuildUpToDate" boolean DEFAULT true NOT NULL,
    CONSTRAINT "CHK_349d2959a97c0b14fa0bf7cadd" CHECK ((("timeoutSeconds" >= 1) AND ("timeoutSeconds" <= 900)))
);


ALTER TABLE core."logicFunction" OWNER TO postgres;

--
-- Name: logicFunctionLayer; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."logicFunctionLayer" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "packageJson" jsonb NOT NULL,
    "yarnLock" text NOT NULL,
    "yarnLockChecksum" text NOT NULL,
    "workspaceId" uuid NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "packageJsonChecksum" text,
    "availablePackages" jsonb DEFAULT '{}'::jsonb NOT NULL
);


ALTER TABLE core."logicFunctionLayer" OWNER TO postgres;

--
-- Name: messageChannel; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."messageChannel" (
    "workspaceId" uuid NOT NULL,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    visibility core."messageChannel_visibility_enum" NOT NULL,
    handle character varying NOT NULL,
    type core."messageChannel_type_enum" NOT NULL,
    "isContactAutoCreationEnabled" boolean DEFAULT true NOT NULL,
    "contactAutoCreationPolicy" core."messageChannel_contactautocreationpolicy_enum" DEFAULT 'SENT'::core."messageChannel_contactautocreationpolicy_enum" NOT NULL,
    "messageFolderImportPolicy" core."messageChannel_messagefolderimportpolicy_enum" DEFAULT 'ALL_FOLDERS'::core."messageChannel_messagefolderimportpolicy_enum" NOT NULL,
    "excludeNonProfessionalEmails" boolean DEFAULT true NOT NULL,
    "excludeGroupEmails" boolean DEFAULT true NOT NULL,
    "pendingGroupEmailsAction" core."messageChannel_pendinggroupemailsaction_enum" NOT NULL,
    "isSyncEnabled" boolean DEFAULT true NOT NULL,
    "syncCursor" character varying,
    "syncedAt" timestamp with time zone,
    "syncStatus" core."messageChannel_syncstatus_enum" DEFAULT 'NOT_SYNCED'::core."messageChannel_syncstatus_enum" NOT NULL,
    "syncStage" core."messageChannel_syncstage_enum" NOT NULL,
    "syncStageStartedAt" timestamp with time zone,
    "throttleFailureCount" integer DEFAULT 0 NOT NULL,
    "throttleRetryAfter" timestamp with time zone,
    "connectedAccountId" uuid NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE core."messageChannel" OWNER TO postgres;

--
-- Name: messageFolder; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."messageFolder" (
    "workspaceId" uuid NOT NULL,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying,
    "syncCursor" character varying,
    "isSentFolder" boolean NOT NULL,
    "isSynced" boolean NOT NULL,
    "parentFolderId" character varying,
    "externalId" character varying,
    "pendingSyncAction" core."messageFolder_pendingsyncaction_enum" DEFAULT 'NONE'::core."messageFolder_pendingsyncaction_enum" NOT NULL,
    "messageChannelId" uuid NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE core."messageFolder" OWNER TO postgres;

--
-- Name: navigationMenuItem; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."navigationMenuItem" (
    "workspaceId" uuid NOT NULL,
    "universalIdentifier" uuid NOT NULL,
    "applicationId" uuid NOT NULL,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "userWorkspaceId" uuid,
    "targetRecordId" uuid,
    "targetObjectMetadataId" uuid,
    "viewId" uuid,
    name text,
    "folderId" uuid,
    "position" double precision NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    link text,
    color text,
    icon text,
    type core."navigationMenuItem_type_enum" NOT NULL,
    "pageLayoutId" uuid,
    CONSTRAINT "CHK_navigation_menu_item_type_fields" CHECK (((type = 'FOLDER'::core."navigationMenuItem_type_enum") OR ((type = 'OBJECT'::core."navigationMenuItem_type_enum") AND ("targetObjectMetadataId" IS NOT NULL)) OR ((type = 'VIEW'::core."navigationMenuItem_type_enum") AND ("viewId" IS NOT NULL)) OR ((type = 'RECORD'::core."navigationMenuItem_type_enum") AND ("targetRecordId" IS NOT NULL) AND ("targetObjectMetadataId" IS NOT NULL)) OR ((type = 'LINK'::core."navigationMenuItem_type_enum") AND (link IS NOT NULL)) OR ((type = 'PAGE_LAYOUT'::core."navigationMenuItem_type_enum") AND ("pageLayoutId" IS NOT NULL))))
);


ALTER TABLE core."navigationMenuItem" OWNER TO postgres;

--
-- Name: objectMetadata; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."objectMetadata" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "dataSourceId" uuid,
    "nameSingular" character varying NOT NULL,
    "namePlural" character varying NOT NULL,
    "labelSingular" character varying NOT NULL,
    "labelPlural" character varying NOT NULL,
    description text,
    icon character varying,
    "standardOverrides" jsonb,
    "targetTableName" character varying NOT NULL,
    "isCustom" boolean DEFAULT false NOT NULL,
    "isRemote" boolean DEFAULT false NOT NULL,
    "isActive" boolean DEFAULT false NOT NULL,
    "isSystem" boolean DEFAULT false NOT NULL,
    "isUIReadOnly" boolean DEFAULT false NOT NULL,
    "isAuditLogged" boolean DEFAULT true NOT NULL,
    "isSearchable" boolean DEFAULT false NOT NULL,
    "duplicateCriteria" jsonb,
    shortcut character varying,
    "labelIdentifierFieldMetadataId" uuid,
    "imageIdentifierFieldMetadataId" uuid,
    "isLabelSyncedWithName" boolean DEFAULT false NOT NULL,
    "workspaceId" uuid NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "applicationId" uuid NOT NULL,
    "universalIdentifier" uuid NOT NULL,
    color text
);


ALTER TABLE core."objectMetadata" OWNER TO postgres;

--
-- Name: objectPermission; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."objectPermission" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "roleId" uuid NOT NULL,
    "objectMetadataId" uuid NOT NULL,
    "canReadObjectRecords" boolean,
    "canUpdateObjectRecords" boolean,
    "canSoftDeleteObjectRecords" boolean,
    "canDestroyObjectRecords" boolean,
    "workspaceId" uuid NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "universalIdentifier" uuid NOT NULL,
    "applicationId" uuid NOT NULL
);


ALTER TABLE core."objectPermission" OWNER TO postgres;

--
-- Name: pageLayout; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."pageLayout" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying NOT NULL,
    "workspaceId" uuid NOT NULL,
    type core."pageLayout_type_enum" DEFAULT 'RECORD_PAGE'::core."pageLayout_type_enum" NOT NULL,
    "objectMetadataId" uuid,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "universalIdentifier" uuid NOT NULL,
    "applicationId" uuid NOT NULL,
    "defaultTabToFocusOnMobileAndSidePanelId" uuid
);


ALTER TABLE core."pageLayout" OWNER TO postgres;

--
-- Name: pageLayoutTab; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."pageLayoutTab" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    title character varying NOT NULL,
    "workspaceId" uuid NOT NULL,
    "position" double precision DEFAULT '0'::double precision NOT NULL,
    "pageLayoutId" uuid NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "universalIdentifier" uuid NOT NULL,
    "applicationId" uuid NOT NULL,
    icon character varying,
    "layoutMode" core."pageLayoutTab_layoutmode_enum" DEFAULT 'GRID'::core."pageLayoutTab_layoutmode_enum" NOT NULL,
    overrides jsonb,
    "isActive" boolean DEFAULT true NOT NULL
);


ALTER TABLE core."pageLayoutTab" OWNER TO postgres;

--
-- Name: pageLayoutWidget; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."pageLayoutWidget" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "pageLayoutTabId" uuid NOT NULL,
    "workspaceId" uuid NOT NULL,
    title character varying NOT NULL,
    type core."pageLayoutWidget_type_enum" DEFAULT 'VIEW'::core."pageLayoutWidget_type_enum" NOT NULL,
    "objectMetadataId" uuid,
    "gridPosition" jsonb NOT NULL,
    configuration jsonb NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "universalIdentifier" uuid NOT NULL,
    "applicationId" uuid NOT NULL,
    "conditionalDisplay" jsonb,
    "position" jsonb,
    overrides jsonb,
    "isActive" boolean DEFAULT true NOT NULL,
    "conditionalAvailabilityExpression" character varying
);


ALTER TABLE core."pageLayoutWidget" OWNER TO postgres;

--
-- Name: permissionFlag; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."permissionFlag" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "roleId" uuid NOT NULL,
    flag character varying NOT NULL,
    "workspaceId" uuid NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "universalIdentifier" uuid NOT NULL,
    "applicationId" uuid NOT NULL
);


ALTER TABLE core."permissionFlag" OWNER TO postgres;

--
-- Name: postgresCredentials; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."postgresCredentials" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "user" character varying NOT NULL,
    "passwordHash" character varying NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "workspaceId" uuid NOT NULL
);


ALTER TABLE core."postgresCredentials" OWNER TO postgres;

--
-- Name: publicDomain; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."publicDomain" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    domain character varying NOT NULL,
    "isValidated" boolean DEFAULT false NOT NULL,
    "workspaceId" uuid NOT NULL
);


ALTER TABLE core."publicDomain" OWNER TO postgres;

--
-- Name: role; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core.role (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    label character varying NOT NULL,
    "canUpdateAllSettings" boolean DEFAULT false NOT NULL,
    "canAccessAllTools" boolean DEFAULT false NOT NULL,
    "canReadAllObjectRecords" boolean DEFAULT false NOT NULL,
    "canUpdateAllObjectRecords" boolean DEFAULT false NOT NULL,
    "canSoftDeleteAllObjectRecords" boolean DEFAULT false NOT NULL,
    "canDestroyAllObjectRecords" boolean DEFAULT false NOT NULL,
    description text,
    icon character varying,
    "workspaceId" uuid NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "isEditable" boolean DEFAULT true NOT NULL,
    "canBeAssignedToUsers" boolean DEFAULT true NOT NULL,
    "canBeAssignedToAgents" boolean DEFAULT true NOT NULL,
    "canBeAssignedToApiKeys" boolean DEFAULT true NOT NULL,
    "universalIdentifier" uuid NOT NULL,
    "applicationId" uuid NOT NULL
);


ALTER TABLE core.role OWNER TO postgres;

--
-- Name: roleTarget; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."roleTarget" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "workspaceId" uuid NOT NULL,
    "roleId" uuid NOT NULL,
    "userWorkspaceId" uuid,
    "agentId" uuid,
    "apiKeyId" uuid,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "universalIdentifier" uuid NOT NULL,
    "applicationId" uuid NOT NULL,
    CONSTRAINT "CHK_role_target_single_entity" CHECK (((("agentId" IS NOT NULL) AND ("userWorkspaceId" IS NULL) AND ("apiKeyId" IS NULL)) OR (("agentId" IS NULL) AND ("userWorkspaceId" IS NOT NULL) AND ("apiKeyId" IS NULL)) OR (("agentId" IS NULL) AND ("userWorkspaceId" IS NULL) AND ("apiKeyId" IS NOT NULL))))
);


ALTER TABLE core."roleTarget" OWNER TO postgres;

--
-- Name: rowLevelPermissionPredicate; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."rowLevelPermissionPredicate" (
    "universalIdentifier" uuid NOT NULL,
    "applicationId" uuid NOT NULL,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "fieldMetadataId" uuid NOT NULL,
    "objectMetadataId" uuid NOT NULL,
    operand core."rowLevelPermissionPredicate_operand_enum" DEFAULT 'CONTAINS'::core."rowLevelPermissionPredicate_operand_enum" NOT NULL,
    value jsonb,
    "subFieldName" text,
    "workspaceMemberFieldMetadataId" uuid,
    "workspaceMemberSubFieldName" text,
    "rowLevelPermissionPredicateGroupId" uuid,
    "positionInRowLevelPermissionPredicateGroup" double precision,
    "workspaceId" uuid NOT NULL,
    "roleId" uuid NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone
);


ALTER TABLE core."rowLevelPermissionPredicate" OWNER TO postgres;

--
-- Name: rowLevelPermissionPredicateGroup; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."rowLevelPermissionPredicateGroup" (
    "universalIdentifier" uuid NOT NULL,
    "applicationId" uuid NOT NULL,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "parentRowLevelPermissionPredicateGroupId" uuid,
    "logicalOperator" core."rowLevelPermissionPredicateGroup_logicaloperator_enum" DEFAULT 'AND'::core."rowLevelPermissionPredicateGroup_logicaloperator_enum" NOT NULL,
    "positionInRowLevelPermissionPredicateGroup" double precision,
    "workspaceId" uuid NOT NULL,
    "roleId" uuid NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "objectMetadataId" uuid NOT NULL
);


ALTER TABLE core."rowLevelPermissionPredicateGroup" OWNER TO postgres;

--
-- Name: searchFieldMetadata; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."searchFieldMetadata" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "objectMetadataId" uuid NOT NULL,
    "fieldMetadataId" uuid NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "workspaceId" uuid NOT NULL
);


ALTER TABLE core."searchFieldMetadata" OWNER TO postgres;

--
-- Name: skill; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core.skill (
    "universalIdentifier" uuid NOT NULL,
    "applicationId" uuid NOT NULL,
    "workspaceId" uuid NOT NULL,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying NOT NULL,
    label character varying NOT NULL,
    icon character varying,
    description text,
    content text NOT NULL,
    "isCustom" boolean DEFAULT false NOT NULL,
    "isActive" boolean DEFAULT true NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE core.skill OWNER TO postgres;

--
-- Name: twoFactorAuthenticationMethod; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."twoFactorAuthenticationMethod" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "userWorkspaceId" uuid NOT NULL,
    secret text NOT NULL,
    status core."twoFactorAuthenticationMethod_status_enum" NOT NULL,
    strategy core."twoFactorAuthenticationMethod_strategy_enum" NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "workspaceId" uuid NOT NULL
);


ALTER TABLE core."twoFactorAuthenticationMethod" OWNER TO postgres;

--
-- Name: upgradeMigration; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."upgradeMigration" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying NOT NULL,
    status character varying NOT NULL,
    attempt integer DEFAULT 1 NOT NULL,
    "executedByVersion" character varying NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "workspaceId" uuid,
    "errorMessage" text,
    "isInitial" boolean DEFAULT false NOT NULL
);


ALTER TABLE core."upgradeMigration" OWNER TO postgres;

--
-- Name: user; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."user" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "firstName" character varying DEFAULT ''::character varying NOT NULL,
    "lastName" character varying DEFAULT ''::character varying NOT NULL,
    email character varying NOT NULL,
    "defaultAvatarUrl" character varying,
    "isEmailVerified" boolean DEFAULT false NOT NULL,
    disabled boolean DEFAULT false NOT NULL,
    "passwordHash" character varying,
    "canImpersonate" boolean DEFAULT false NOT NULL,
    "canAccessFullAdminPanel" boolean DEFAULT false NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    locale character varying DEFAULT 'en'::character varying NOT NULL
);


ALTER TABLE core."user" OWNER TO postgres;

--
-- Name: userWorkspace; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."userWorkspace" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "userId" uuid NOT NULL,
    "workspaceId" uuid NOT NULL,
    "defaultAvatarUrl" character varying,
    locale character varying DEFAULT 'en'::character varying NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone
);


ALTER TABLE core."userWorkspace" OWNER TO postgres;

--
-- Name: view; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core.view (
    "universalIdentifier" uuid NOT NULL,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name text DEFAULT ''::text NOT NULL,
    "objectMetadataId" uuid NOT NULL,
    type core.view_type_enum DEFAULT 'TABLE'::core.view_type_enum NOT NULL,
    key core.view_key_enum,
    icon text NOT NULL,
    "position" double precision DEFAULT '0'::double precision NOT NULL,
    "isCompact" boolean DEFAULT false NOT NULL,
    "isCustom" boolean DEFAULT false NOT NULL,
    "openRecordIn" core.view_openrecordin_enum DEFAULT 'SIDE_PANEL'::core.view_openrecordin_enum NOT NULL,
    "kanbanAggregateOperation" core.view_kanbanaggregateoperation_enum,
    "kanbanAggregateOperationFieldMetadataId" uuid,
    "workspaceId" uuid NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "anyFieldFilterValue" text,
    "calendarLayout" core.view_calendarlayout_enum,
    "calendarFieldMetadataId" uuid,
    "applicationId" uuid NOT NULL,
    visibility core.view_visibility_enum DEFAULT 'WORKSPACE'::core.view_visibility_enum NOT NULL,
    "createdByUserWorkspaceId" uuid,
    "mainGroupByFieldMetadataId" uuid,
    "shouldHideEmptyGroups" boolean DEFAULT false NOT NULL,
    CONSTRAINT "CHK_VIEW_CALENDAR_INTEGRITY" CHECK (((type <> 'CALENDAR'::core.view_type_enum) OR (("calendarLayout" IS NOT NULL) AND ("calendarFieldMetadataId" IS NOT NULL))))
);


ALTER TABLE core.view OWNER TO postgres;

--
-- Name: viewField; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."viewField" (
    "universalIdentifier" uuid NOT NULL,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "fieldMetadataId" uuid NOT NULL,
    "isVisible" boolean DEFAULT true NOT NULL,
    size integer DEFAULT 0 NOT NULL,
    "position" double precision DEFAULT '0'::double precision NOT NULL,
    "aggregateOperation" core."viewField_aggregateoperation_enum",
    "viewId" uuid NOT NULL,
    "workspaceId" uuid NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "applicationId" uuid NOT NULL,
    "viewFieldGroupId" uuid,
    overrides jsonb,
    "isActive" boolean DEFAULT true NOT NULL
);


ALTER TABLE core."viewField" OWNER TO postgres;

--
-- Name: viewFieldGroup; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."viewFieldGroup" (
    "workspaceId" uuid NOT NULL,
    "universalIdentifier" uuid NOT NULL,
    "applicationId" uuid NOT NULL,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name text NOT NULL,
    "position" double precision DEFAULT '0'::double precision NOT NULL,
    "isVisible" boolean DEFAULT true NOT NULL,
    "viewId" uuid NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    overrides jsonb,
    "isActive" boolean DEFAULT true NOT NULL
);


ALTER TABLE core."viewFieldGroup" OWNER TO postgres;

--
-- Name: viewFilter; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."viewFilter" (
    "universalIdentifier" uuid NOT NULL,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "fieldMetadataId" uuid NOT NULL,
    operand core."viewFilter_operand_enum" DEFAULT 'CONTAINS'::core."viewFilter_operand_enum" NOT NULL,
    value jsonb NOT NULL,
    "viewFilterGroupId" uuid,
    "positionInViewFilterGroup" double precision,
    "subFieldName" text,
    "viewId" uuid NOT NULL,
    "workspaceId" uuid NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "applicationId" uuid NOT NULL
);


ALTER TABLE core."viewFilter" OWNER TO postgres;

--
-- Name: viewFilterGroup; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."viewFilterGroup" (
    "universalIdentifier" uuid NOT NULL,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "parentViewFilterGroupId" uuid,
    "logicalOperator" core."viewFilterGroup_logicaloperator_enum" DEFAULT 'AND'::core."viewFilterGroup_logicaloperator_enum" NOT NULL,
    "positionInViewFilterGroup" double precision,
    "viewId" uuid NOT NULL,
    "workspaceId" uuid NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "applicationId" uuid NOT NULL
);


ALTER TABLE core."viewFilterGroup" OWNER TO postgres;

--
-- Name: viewGroup; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."viewGroup" (
    "universalIdentifier" uuid NOT NULL,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "isVisible" boolean DEFAULT true NOT NULL,
    "fieldValue" text NOT NULL,
    "position" double precision DEFAULT '0'::double precision NOT NULL,
    "viewId" uuid NOT NULL,
    "workspaceId" uuid NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "applicationId" uuid NOT NULL
);


ALTER TABLE core."viewGroup" OWNER TO postgres;

--
-- Name: viewSort; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."viewSort" (
    "universalIdentifier" uuid NOT NULL,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "fieldMetadataId" uuid NOT NULL,
    direction core."viewSort_direction_enum" DEFAULT 'ASC'::core."viewSort_direction_enum" NOT NULL,
    "viewId" uuid NOT NULL,
    "workspaceId" uuid NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "applicationId" uuid NOT NULL
);


ALTER TABLE core."viewSort" OWNER TO postgres;

--
-- Name: webhook; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core.webhook (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "targetUrl" character varying NOT NULL,
    operations text[] DEFAULT '{*.*}'::text[] NOT NULL,
    description character varying,
    secret character varying NOT NULL,
    "workspaceId" uuid NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "universalIdentifier" uuid NOT NULL,
    "applicationId" uuid NOT NULL
);


ALTER TABLE core.webhook OWNER TO postgres;

--
-- Name: workspace; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core.workspace (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "displayName" character varying,
    logo character varying,
    "inviteHash" character varying,
    "deletedAt" timestamp with time zone,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "allowImpersonation" boolean DEFAULT true NOT NULL,
    "isPublicInviteLinkEnabled" boolean DEFAULT true NOT NULL,
    "activationStatus" core."workspace_activationStatus_enum" DEFAULT 'INACTIVE'::core."workspace_activationStatus_enum" NOT NULL,
    "metadataVersion" integer DEFAULT 1 NOT NULL,
    "databaseSchema" character varying,
    subdomain character varying NOT NULL,
    "customDomain" character varying,
    "isGoogleAuthEnabled" boolean DEFAULT true NOT NULL,
    "isTwoFactorAuthenticationEnforced" boolean DEFAULT false NOT NULL,
    "isPasswordAuthEnabled" boolean DEFAULT true NOT NULL,
    "isMicrosoftAuthEnabled" boolean DEFAULT true NOT NULL,
    "isCustomDomainEnabled" boolean DEFAULT false NOT NULL,
    "defaultRoleId" uuid,
    "trashRetentionDays" integer DEFAULT 14 NOT NULL,
    "routerModel" character varying DEFAULT 'auto'::character varying NOT NULL,
    "isGoogleAuthBypassEnabled" boolean DEFAULT false NOT NULL,
    "isPasswordAuthBypassEnabled" boolean DEFAULT false NOT NULL,
    "isMicrosoftAuthBypassEnabled" boolean DEFAULT false NOT NULL,
    "workspaceCustomApplicationId" uuid NOT NULL,
    "editableProfileFields" character varying[] DEFAULT '{email,profilePicture,firstName,lastName}'::character varying[],
    "fastModel" character varying DEFAULT 'default-fast-model'::character varying NOT NULL,
    "smartModel" character varying DEFAULT 'default-smart-model'::character varying NOT NULL,
    "eventLogRetentionDays" integer DEFAULT 90 NOT NULL,
    "suspendedAt" timestamp with time zone,
    "aiAdditionalInstructions" text,
    "logoFileId" uuid,
    "enabledAiModelIds" character varying[] DEFAULT '{}'::character varying[] NOT NULL,
    "useRecommendedModels" boolean DEFAULT true NOT NULL,
    CONSTRAINT onboarded_workspace_requires_default_role CHECK ((("activationStatus" = ANY (ARRAY['PENDING_CREATION'::core."workspace_activationStatus_enum", 'ONGOING_CREATION'::core."workspace_activationStatus_enum"])) OR ("defaultRoleId" IS NOT NULL)))
);


ALTER TABLE core.workspace OWNER TO postgres;

--
-- Name: workspaceSSOIdentityProvider; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."workspaceSSOIdentityProvider" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying NOT NULL,
    status core."workspaceSSOIdentityProvider_status_enum" DEFAULT 'Active'::core."workspaceSSOIdentityProvider_status_enum" NOT NULL,
    "workspaceId" uuid NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    type core."workspaceSSOIdentityProvider_type_enum" DEFAULT 'OIDC'::core."workspaceSSOIdentityProvider_type_enum" NOT NULL,
    issuer character varying NOT NULL,
    "clientID" character varying,
    "clientSecret" character varying,
    "ssoURL" character varying,
    certificate character varying,
    fingerprint character varying
);


ALTER TABLE core."workspaceSSOIdentityProvider" OWNER TO postgres;

--
-- Name: _habit; Type: TABLE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TABLE workspace_5tvw23m2ae5qhvivd4el66s5c._habit (
    name text,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "createdBySource" workspace_5tvw23m2ae5qhvivd4el66s5c."_habit_createdBySource_enum" DEFAULT 'MANUAL'::workspace_5tvw23m2ae5qhvivd4el66s5c."_habit_createdBySource_enum" NOT NULL,
    "createdByWorkspaceMemberId" uuid,
    "createdByName" text DEFAULT ''::text NOT NULL,
    "createdByContext" jsonb,
    "deletedAt" timestamp with time zone,
    "position" double precision DEFAULT '0'::double precision NOT NULL,
    "searchVector" tsvector GENERATED ALWAYS AS (to_tsvector('simple'::regconfig, COALESCE(public.unaccent_immutable(name), ''::text))) STORED,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedBySource" workspace_5tvw23m2ae5qhvivd4el66s5c."_habit_updatedBySource_enum" DEFAULT 'MANUAL'::workspace_5tvw23m2ae5qhvivd4el66s5c."_habit_updatedBySource_enum" NOT NULL,
    "updatedByWorkspaceMemberId" uuid,
    "updatedByName" text DEFAULT ''::text NOT NULL,
    "updatedByContext" jsonb,
    title text,
    "mainGoal" text,
    "microStep" text,
    "recurrenceRule" text,
    "deadlineType" text,
    "deadlineValue" text
);


ALTER TABLE workspace_5tvw23m2ae5qhvivd4el66s5c._habit OWNER TO postgres;

--
-- Name: _habitLog; Type: TABLE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TABLE workspace_5tvw23m2ae5qhvivd4el66s5c."_habitLog" (
    name text,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "createdBySource" workspace_5tvw23m2ae5qhvivd4el66s5c."_habitLog_createdBySource_enum" DEFAULT 'MANUAL'::workspace_5tvw23m2ae5qhvivd4el66s5c."_habitLog_createdBySource_enum" NOT NULL,
    "createdByWorkspaceMemberId" uuid,
    "createdByName" text DEFAULT ''::text NOT NULL,
    "createdByContext" jsonb,
    "deletedAt" timestamp with time zone,
    "position" double precision DEFAULT '0'::double precision NOT NULL,
    "searchVector" tsvector GENERATED ALWAYS AS (to_tsvector('simple'::regconfig, COALESCE(public.unaccent_immutable(name), ''::text))) STORED,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedBySource" workspace_5tvw23m2ae5qhvivd4el66s5c."_habitLog_updatedBySource_enum" DEFAULT 'MANUAL'::workspace_5tvw23m2ae5qhvivd4el66s5c."_habitLog_updatedBySource_enum" NOT NULL,
    "updatedByWorkspaceMemberId" uuid,
    "updatedByName" text DEFAULT ''::text NOT NULL,
    "updatedByContext" jsonb,
    "habitId" uuid,
    date timestamp with time zone,
    status workspace_5tvw23m2ae5qhvivd4el66s5c."_habitLog_status_enum",
    notes text
);


ALTER TABLE workspace_5tvw23m2ae5qhvivd4el66s5c."_habitLog" OWNER TO postgres;

--
-- Name: attachment; Type: TABLE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TABLE workspace_5tvw23m2ae5qhvivd4el66s5c.attachment (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    name text,
    file jsonb,
    "fullPath" text,
    "fileCategory" workspace_5tvw23m2ae5qhvivd4el66s5c."attachment_fileCategory_enum" DEFAULT 'OTHER'::workspace_5tvw23m2ae5qhvivd4el66s5c."attachment_fileCategory_enum" NOT NULL,
    "createdBySource" workspace_5tvw23m2ae5qhvivd4el66s5c."attachment_createdBySource_enum" DEFAULT 'MANUAL'::workspace_5tvw23m2ae5qhvivd4el66s5c."attachment_createdBySource_enum" NOT NULL,
    "createdByWorkspaceMemberId" uuid,
    "createdByName" text DEFAULT 'System'::text NOT NULL,
    "createdByContext" jsonb,
    "updatedBySource" workspace_5tvw23m2ae5qhvivd4el66s5c."attachment_updatedBySource_enum" DEFAULT 'MANUAL'::workspace_5tvw23m2ae5qhvivd4el66s5c."attachment_updatedBySource_enum" NOT NULL,
    "updatedByWorkspaceMemberId" uuid,
    "updatedByName" text DEFAULT 'System'::text NOT NULL,
    "updatedByContext" jsonb,
    "position" double precision DEFAULT '0'::double precision NOT NULL,
    "searchVector" tsvector GENERATED ALWAYS AS (to_tsvector('simple'::regconfig, COALESCE(public.unaccent_immutable(name), ''::text))) STORED,
    "targetTaskId" uuid,
    "targetNoteId" uuid,
    "targetPersonId" uuid,
    "targetCompanyId" uuid,
    "targetOpportunityId" uuid,
    "targetDashboardId" uuid,
    "targetWorkflowId" uuid,
    "targetHabitId" uuid,
    "targetHabitLogId" uuid
);


ALTER TABLE workspace_5tvw23m2ae5qhvivd4el66s5c.attachment OWNER TO postgres;

--
-- Name: blocklist; Type: TABLE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TABLE workspace_5tvw23m2ae5qhvivd4el66s5c.blocklist (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "createdBySource" workspace_5tvw23m2ae5qhvivd4el66s5c."blocklist_createdBySource_enum" DEFAULT 'MANUAL'::workspace_5tvw23m2ae5qhvivd4el66s5c."blocklist_createdBySource_enum" NOT NULL,
    "createdByWorkspaceMemberId" uuid,
    "createdByName" text DEFAULT 'System'::text NOT NULL,
    "createdByContext" jsonb,
    "updatedBySource" workspace_5tvw23m2ae5qhvivd4el66s5c."blocklist_updatedBySource_enum" DEFAULT 'MANUAL'::workspace_5tvw23m2ae5qhvivd4el66s5c."blocklist_updatedBySource_enum" NOT NULL,
    "updatedByWorkspaceMemberId" uuid,
    "updatedByName" text DEFAULT 'System'::text NOT NULL,
    "updatedByContext" jsonb,
    "position" double precision DEFAULT '0'::double precision NOT NULL,
    "searchVector" tsvector GENERATED ALWAYS AS (to_tsvector('simple'::regconfig, COALESCE(public.unaccent_immutable(handle), ''::text))) STORED,
    handle text,
    "workspaceMemberId" uuid
);


ALTER TABLE workspace_5tvw23m2ae5qhvivd4el66s5c.blocklist OWNER TO postgres;

--
-- Name: calendarChannel; Type: TABLE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TABLE workspace_5tvw23m2ae5qhvivd4el66s5c."calendarChannel" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "createdBySource" workspace_5tvw23m2ae5qhvivd4el66s5c."calendarChannel_createdBySource_enum" DEFAULT 'MANUAL'::workspace_5tvw23m2ae5qhvivd4el66s5c."calendarChannel_createdBySource_enum" NOT NULL,
    "createdByWorkspaceMemberId" uuid,
    "createdByName" text DEFAULT 'System'::text NOT NULL,
    "createdByContext" jsonb,
    "updatedBySource" workspace_5tvw23m2ae5qhvivd4el66s5c."calendarChannel_updatedBySource_enum" DEFAULT 'MANUAL'::workspace_5tvw23m2ae5qhvivd4el66s5c."calendarChannel_updatedBySource_enum" NOT NULL,
    "updatedByWorkspaceMemberId" uuid,
    "updatedByName" text DEFAULT 'System'::text NOT NULL,
    "updatedByContext" jsonb,
    "position" double precision DEFAULT '0'::double precision NOT NULL,
    "searchVector" tsvector GENERATED ALWAYS AS (to_tsvector('simple'::regconfig, COALESCE(public.unaccent_immutable(handle), ''::text))) STORED,
    handle text,
    visibility workspace_5tvw23m2ae5qhvivd4el66s5c."calendarChannel_visibility_enum" DEFAULT 'SHARE_EVERYTHING'::workspace_5tvw23m2ae5qhvivd4el66s5c."calendarChannel_visibility_enum" NOT NULL,
    "isContactAutoCreationEnabled" boolean DEFAULT true NOT NULL,
    "contactAutoCreationPolicy" workspace_5tvw23m2ae5qhvivd4el66s5c."calendarChannel_contactAutoCreationPolicy_enum" DEFAULT 'AS_PARTICIPANT_AND_ORGANIZER'::workspace_5tvw23m2ae5qhvivd4el66s5c."calendarChannel_contactAutoCreationPolicy_enum" NOT NULL,
    "isSyncEnabled" boolean DEFAULT true NOT NULL,
    "syncCursor" text,
    "syncStatus" workspace_5tvw23m2ae5qhvivd4el66s5c."calendarChannel_syncStatus_enum",
    "syncStage" workspace_5tvw23m2ae5qhvivd4el66s5c."calendarChannel_syncStage_enum" DEFAULT 'PENDING_CONFIGURATION'::workspace_5tvw23m2ae5qhvivd4el66s5c."calendarChannel_syncStage_enum" NOT NULL,
    "syncStageStartedAt" timestamp with time zone,
    "syncedAt" timestamp with time zone,
    "throttleFailureCount" double precision DEFAULT '0'::double precision NOT NULL,
    "connectedAccountId" uuid
);


ALTER TABLE workspace_5tvw23m2ae5qhvivd4el66s5c."calendarChannel" OWNER TO postgres;

--
-- Name: calendarChannelEventAssociation; Type: TABLE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TABLE workspace_5tvw23m2ae5qhvivd4el66s5c."calendarChannelEventAssociation" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "createdBySource" workspace_5tvw23m2ae5qhvivd4el66s5c."calendarChannelEventAssociation_createdBySource_enum" DEFAULT 'MANUAL'::workspace_5tvw23m2ae5qhvivd4el66s5c."calendarChannelEventAssociation_createdBySource_enum" NOT NULL,
    "createdByWorkspaceMemberId" uuid,
    "createdByName" text DEFAULT 'System'::text NOT NULL,
    "createdByContext" jsonb,
    "updatedBySource" workspace_5tvw23m2ae5qhvivd4el66s5c."calendarChannelEventAssociation_updatedBySource_enum" DEFAULT 'MANUAL'::workspace_5tvw23m2ae5qhvivd4el66s5c."calendarChannelEventAssociation_updatedBySource_enum" NOT NULL,
    "updatedByWorkspaceMemberId" uuid,
    "updatedByName" text DEFAULT 'System'::text NOT NULL,
    "updatedByContext" jsonb,
    "position" double precision DEFAULT '0'::double precision NOT NULL,
    "searchVector" tsvector GENERATED ALWAYS AS (to_tsvector('simple'::regconfig, COALESCE(public.unaccent_immutable("eventExternalId"), ''::text))) STORED,
    "eventExternalId" text,
    "recurringEventExternalId" text,
    "calendarChannelId" uuid NOT NULL,
    "calendarEventId" uuid
);


ALTER TABLE workspace_5tvw23m2ae5qhvivd4el66s5c."calendarChannelEventAssociation" OWNER TO postgres;

--
-- Name: calendarEvent; Type: TABLE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TABLE workspace_5tvw23m2ae5qhvivd4el66s5c."calendarEvent" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "createdBySource" workspace_5tvw23m2ae5qhvivd4el66s5c."calendarEvent_createdBySource_enum" DEFAULT 'MANUAL'::workspace_5tvw23m2ae5qhvivd4el66s5c."calendarEvent_createdBySource_enum" NOT NULL,
    "createdByWorkspaceMemberId" uuid,
    "createdByName" text DEFAULT 'System'::text NOT NULL,
    "createdByContext" jsonb,
    "updatedBySource" workspace_5tvw23m2ae5qhvivd4el66s5c."calendarEvent_updatedBySource_enum" DEFAULT 'MANUAL'::workspace_5tvw23m2ae5qhvivd4el66s5c."calendarEvent_updatedBySource_enum" NOT NULL,
    "updatedByWorkspaceMemberId" uuid,
    "updatedByName" text DEFAULT 'System'::text NOT NULL,
    "updatedByContext" jsonb,
    "position" double precision DEFAULT '0'::double precision NOT NULL,
    "searchVector" tsvector GENERATED ALWAYS AS (to_tsvector('simple'::regconfig, COALESCE(public.unaccent_immutable(title), ''::text))) STORED,
    title text,
    "isCanceled" boolean DEFAULT false NOT NULL,
    "isFullDay" boolean DEFAULT false NOT NULL,
    "startsAt" timestamp with time zone,
    "endsAt" timestamp with time zone,
    "externalCreatedAt" timestamp with time zone,
    "externalUpdatedAt" timestamp with time zone,
    description text,
    location text,
    "iCalUid" text,
    "conferenceSolution" text,
    "conferenceLinkPrimaryLinkLabel" text,
    "conferenceLinkPrimaryLinkUrl" text,
    "conferenceLinkSecondaryLinks" jsonb
);


ALTER TABLE workspace_5tvw23m2ae5qhvivd4el66s5c."calendarEvent" OWNER TO postgres;

--
-- Name: calendarEventParticipant; Type: TABLE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TABLE workspace_5tvw23m2ae5qhvivd4el66s5c."calendarEventParticipant" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "createdBySource" workspace_5tvw23m2ae5qhvivd4el66s5c."calendarEventParticipant_createdBySource_enum" DEFAULT 'MANUAL'::workspace_5tvw23m2ae5qhvivd4el66s5c."calendarEventParticipant_createdBySource_enum" NOT NULL,
    "createdByWorkspaceMemberId" uuid,
    "createdByName" text DEFAULT 'System'::text NOT NULL,
    "createdByContext" jsonb,
    "updatedBySource" workspace_5tvw23m2ae5qhvivd4el66s5c."calendarEventParticipant_updatedBySource_enum" DEFAULT 'MANUAL'::workspace_5tvw23m2ae5qhvivd4el66s5c."calendarEventParticipant_updatedBySource_enum" NOT NULL,
    "updatedByWorkspaceMemberId" uuid,
    "updatedByName" text DEFAULT 'System'::text NOT NULL,
    "updatedByContext" jsonb,
    "position" double precision DEFAULT '0'::double precision NOT NULL,
    "searchVector" tsvector GENERATED ALWAYS AS (to_tsvector('simple'::regconfig, COALESCE(public.unaccent_immutable(handle), ''::text))) STORED,
    handle text,
    "displayName" text,
    "isOrganizer" boolean DEFAULT false NOT NULL,
    "responseStatus" workspace_5tvw23m2ae5qhvivd4el66s5c."calendarEventParticipant_responseStatus_enum" DEFAULT 'NEEDS_ACTION'::workspace_5tvw23m2ae5qhvivd4el66s5c."calendarEventParticipant_responseStatus_enum" NOT NULL,
    "calendarEventId" uuid,
    "personId" uuid,
    "workspaceMemberId" uuid
);


ALTER TABLE workspace_5tvw23m2ae5qhvivd4el66s5c."calendarEventParticipant" OWNER TO postgres;

--
-- Name: company; Type: TABLE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TABLE workspace_5tvw23m2ae5qhvivd4el66s5c.company (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    name text,
    "domainNamePrimaryLinkLabel" text,
    "domainNamePrimaryLinkUrl" text,
    "domainNameSecondaryLinks" jsonb,
    "addressAddressStreet1" text,
    "addressAddressStreet2" text,
    "addressAddressCity" text,
    "addressAddressPostcode" text,
    "addressAddressState" text,
    "addressAddressCountry" text,
    "addressAddressLat" numeric,
    "addressAddressLng" numeric,
    employees double precision,
    "linkedinLinkPrimaryLinkLabel" text,
    "linkedinLinkPrimaryLinkUrl" text,
    "linkedinLinkSecondaryLinks" jsonb,
    "xLinkPrimaryLinkLabel" text,
    "xLinkPrimaryLinkUrl" text,
    "xLinkSecondaryLinks" jsonb,
    "annualRecurringRevenueAmountMicros" numeric,
    "annualRecurringRevenueCurrencyCode" text,
    "idealCustomerProfile" boolean DEFAULT false NOT NULL,
    "position" double precision DEFAULT '0'::double precision NOT NULL,
    "createdBySource" workspace_5tvw23m2ae5qhvivd4el66s5c."company_createdBySource_enum" DEFAULT 'MANUAL'::workspace_5tvw23m2ae5qhvivd4el66s5c."company_createdBySource_enum" NOT NULL,
    "createdByWorkspaceMemberId" uuid,
    "createdByName" text DEFAULT 'System'::text NOT NULL,
    "createdByContext" jsonb,
    "updatedBySource" workspace_5tvw23m2ae5qhvivd4el66s5c."company_updatedBySource_enum" DEFAULT 'MANUAL'::workspace_5tvw23m2ae5qhvivd4el66s5c."company_updatedBySource_enum" NOT NULL,
    "updatedByWorkspaceMemberId" uuid,
    "updatedByName" text DEFAULT 'System'::text NOT NULL,
    "updatedByContext" jsonb,
    "searchVector" tsvector GENERATED ALWAYS AS (to_tsvector('simple'::regconfig, ((((((COALESCE(public.unaccent_immutable(name), ''::text) || ' '::text) || COALESCE(public.unaccent_immutable("domainNamePrimaryLinkLabel"), ''::text)) || ' '::text) || COALESCE(public.unaccent_immutable("domainNamePrimaryLinkUrl"), ''::text)) || ' '::text) || COALESCE(public.unaccent_immutable(translate(regexp_replace(("domainNameSecondaryLinks")::text, '"(label|url)"\s*:\s*'::text, ''::text, 'g'::text), '[]{}",:'::text, '        '::text)), ''::text)))) STORED,
    "accountOwnerId" uuid
);


ALTER TABLE workspace_5tvw23m2ae5qhvivd4el66s5c.company OWNER TO postgres;

--
-- Name: connectedAccount; Type: TABLE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TABLE workspace_5tvw23m2ae5qhvivd4el66s5c."connectedAccount" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "createdBySource" workspace_5tvw23m2ae5qhvivd4el66s5c."connectedAccount_createdBySource_enum" DEFAULT 'MANUAL'::workspace_5tvw23m2ae5qhvivd4el66s5c."connectedAccount_createdBySource_enum" NOT NULL,
    "createdByWorkspaceMemberId" uuid,
    "createdByName" text DEFAULT 'System'::text NOT NULL,
    "createdByContext" jsonb,
    "updatedBySource" workspace_5tvw23m2ae5qhvivd4el66s5c."connectedAccount_updatedBySource_enum" DEFAULT 'MANUAL'::workspace_5tvw23m2ae5qhvivd4el66s5c."connectedAccount_updatedBySource_enum" NOT NULL,
    "updatedByWorkspaceMemberId" uuid,
    "updatedByName" text DEFAULT 'System'::text NOT NULL,
    "updatedByContext" jsonb,
    "position" double precision DEFAULT '0'::double precision NOT NULL,
    "searchVector" tsvector GENERATED ALWAYS AS (to_tsvector('simple'::regconfig, COALESCE(public.unaccent_immutable(handle), ''::text))) STORED,
    handle text,
    provider text DEFAULT 'google'::text NOT NULL,
    "accessToken" text,
    "refreshToken" text,
    "lastSyncHistoryId" text,
    "authFailedAt" timestamp with time zone,
    "lastCredentialsRefreshedAt" timestamp with time zone,
    "handleAliases" text,
    scopes text[],
    "connectionParameters" jsonb,
    "accountOwnerId" uuid
);


ALTER TABLE workspace_5tvw23m2ae5qhvivd4el66s5c."connectedAccount" OWNER TO postgres;

--
-- Name: dashboard; Type: TABLE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TABLE workspace_5tvw23m2ae5qhvivd4el66s5c.dashboard (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    title text,
    "position" double precision DEFAULT '0'::double precision NOT NULL,
    "pageLayoutId" uuid,
    "createdBySource" workspace_5tvw23m2ae5qhvivd4el66s5c."dashboard_createdBySource_enum" DEFAULT 'MANUAL'::workspace_5tvw23m2ae5qhvivd4el66s5c."dashboard_createdBySource_enum" NOT NULL,
    "createdByWorkspaceMemberId" uuid,
    "createdByName" text DEFAULT 'System'::text NOT NULL,
    "createdByContext" jsonb,
    "updatedBySource" workspace_5tvw23m2ae5qhvivd4el66s5c."dashboard_updatedBySource_enum" DEFAULT 'MANUAL'::workspace_5tvw23m2ae5qhvivd4el66s5c."dashboard_updatedBySource_enum" NOT NULL,
    "updatedByWorkspaceMemberId" uuid,
    "updatedByName" text DEFAULT 'System'::text NOT NULL,
    "updatedByContext" jsonb,
    "searchVector" tsvector GENERATED ALWAYS AS (to_tsvector('simple'::regconfig, COALESCE(public.unaccent_immutable(title), ''::text))) STORED
);


ALTER TABLE workspace_5tvw23m2ae5qhvivd4el66s5c.dashboard OWNER TO postgres;

--
-- Name: message; Type: TABLE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TABLE workspace_5tvw23m2ae5qhvivd4el66s5c.message (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "createdBySource" workspace_5tvw23m2ae5qhvivd4el66s5c."message_createdBySource_enum" DEFAULT 'MANUAL'::workspace_5tvw23m2ae5qhvivd4el66s5c."message_createdBySource_enum" NOT NULL,
    "createdByWorkspaceMemberId" uuid,
    "createdByName" text DEFAULT 'System'::text NOT NULL,
    "createdByContext" jsonb,
    "updatedBySource" workspace_5tvw23m2ae5qhvivd4el66s5c."message_updatedBySource_enum" DEFAULT 'MANUAL'::workspace_5tvw23m2ae5qhvivd4el66s5c."message_updatedBySource_enum" NOT NULL,
    "updatedByWorkspaceMemberId" uuid,
    "updatedByName" text DEFAULT 'System'::text NOT NULL,
    "updatedByContext" jsonb,
    "position" double precision DEFAULT '0'::double precision NOT NULL,
    "searchVector" tsvector GENERATED ALWAYS AS (to_tsvector('simple'::regconfig, COALESCE(public.unaccent_immutable(subject), ''::text))) STORED,
    "headerMessageId" text,
    direction workspace_5tvw23m2ae5qhvivd4el66s5c.message_direction_enum DEFAULT 'INCOMING'::workspace_5tvw23m2ae5qhvivd4el66s5c.message_direction_enum NOT NULL,
    subject text,
    text text,
    "receivedAt" timestamp with time zone,
    "messageThreadId" uuid
);


ALTER TABLE workspace_5tvw23m2ae5qhvivd4el66s5c.message OWNER TO postgres;

--
-- Name: messageChannel; Type: TABLE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TABLE workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannel" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "createdBySource" workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannel_createdBySource_enum" DEFAULT 'MANUAL'::workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannel_createdBySource_enum" NOT NULL,
    "createdByWorkspaceMemberId" uuid,
    "createdByName" text DEFAULT 'System'::text NOT NULL,
    "createdByContext" jsonb,
    "updatedBySource" workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannel_updatedBySource_enum" DEFAULT 'MANUAL'::workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannel_updatedBySource_enum" NOT NULL,
    "updatedByWorkspaceMemberId" uuid,
    "updatedByName" text DEFAULT 'System'::text NOT NULL,
    "updatedByContext" jsonb,
    "position" double precision DEFAULT '0'::double precision NOT NULL,
    "searchVector" tsvector GENERATED ALWAYS AS (to_tsvector('simple'::regconfig, COALESCE(public.unaccent_immutable(handle), ''::text))) STORED,
    visibility workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannel_visibility_enum" DEFAULT 'SHARE_EVERYTHING'::workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannel_visibility_enum" NOT NULL,
    handle text,
    type workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannel_type_enum" DEFAULT 'EMAIL'::workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannel_type_enum" NOT NULL,
    "isContactAutoCreationEnabled" boolean DEFAULT true NOT NULL,
    "contactAutoCreationPolicy" workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannel_contactAutoCreationPolicy_enum" DEFAULT 'SENT'::workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannel_contactAutoCreationPolicy_enum" NOT NULL,
    "messageFolderImportPolicy" workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannel_messageFolderImportPolicy_enum" DEFAULT 'ALL_FOLDERS'::workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannel_messageFolderImportPolicy_enum" NOT NULL,
    "excludeNonProfessionalEmails" boolean DEFAULT true NOT NULL,
    "excludeGroupEmails" boolean DEFAULT true NOT NULL,
    "pendingGroupEmailsAction" workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannel_pendingGroupEmailsAction_enum" DEFAULT 'NONE'::workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannel_pendingGroupEmailsAction_enum" NOT NULL,
    "isSyncEnabled" boolean DEFAULT true NOT NULL,
    "syncCursor" text,
    "syncedAt" timestamp with time zone,
    "syncStatus" workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannel_syncStatus_enum",
    "syncStage" workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannel_syncStage_enum" DEFAULT 'PENDING_CONFIGURATION'::workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannel_syncStage_enum" NOT NULL,
    "syncStageStartedAt" timestamp with time zone,
    "throttleFailureCount" double precision DEFAULT '0'::double precision NOT NULL,
    "throttleRetryAfter" timestamp with time zone,
    "connectedAccountId" uuid
);


ALTER TABLE workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannel" OWNER TO postgres;

--
-- Name: messageChannelMessageAssociation; Type: TABLE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TABLE workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannelMessageAssociation" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "createdBySource" workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannelMessageAssociation_createdBySource_enum" DEFAULT 'MANUAL'::workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannelMessageAssociation_createdBySource_enum" NOT NULL,
    "createdByWorkspaceMemberId" uuid,
    "createdByName" text DEFAULT 'System'::text NOT NULL,
    "createdByContext" jsonb,
    "updatedBySource" workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannelMessageAssociation_updatedBySource_enum" DEFAULT 'MANUAL'::workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannelMessageAssociation_updatedBySource_enum" NOT NULL,
    "updatedByWorkspaceMemberId" uuid,
    "updatedByName" text DEFAULT 'System'::text NOT NULL,
    "updatedByContext" jsonb,
    "position" double precision DEFAULT '0'::double precision NOT NULL,
    "searchVector" tsvector GENERATED ALWAYS AS (to_tsvector('simple'::regconfig, COALESCE(public.unaccent_immutable("messageExternalId"), ''::text))) STORED,
    "messageExternalId" text,
    "messageThreadExternalId" text,
    direction workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannelMessageAssociation_direction_enum" DEFAULT 'INCOMING'::workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannelMessageAssociation_direction_enum" NOT NULL,
    "messageChannelId" uuid,
    "messageId" uuid,
    "messageThreadId" uuid
);


ALTER TABLE workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannelMessageAssociation" OWNER TO postgres;

--
-- Name: messageChannelMessageAssociationMessageFolder; Type: TABLE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TABLE workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannelMessageAssociationMessageFolder" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "createdBySource" workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannelMessageAssociationMessageFolder_createdBySource_e" DEFAULT 'MANUAL'::workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannelMessageAssociationMessageFolder_createdBySource_e" NOT NULL,
    "createdByWorkspaceMemberId" uuid,
    "createdByName" text DEFAULT 'System'::text NOT NULL,
    "createdByContext" jsonb,
    "updatedBySource" workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannelMessageAssociationMessageFolder_updatedBySource_e" DEFAULT 'MANUAL'::workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannelMessageAssociationMessageFolder_updatedBySource_e" NOT NULL,
    "updatedByWorkspaceMemberId" uuid,
    "updatedByName" text DEFAULT 'System'::text NOT NULL,
    "updatedByContext" jsonb,
    "position" double precision DEFAULT '0'::double precision NOT NULL,
    "searchVector" tsvector GENERATED ALWAYS AS (to_tsvector('simple'::regconfig, NULL::text)) STORED,
    "messageFolderId" uuid NOT NULL,
    "messageChannelMessageAssociationId" uuid
);


ALTER TABLE workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannelMessageAssociationMessageFolder" OWNER TO postgres;

--
-- Name: messageFolder; Type: TABLE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TABLE workspace_5tvw23m2ae5qhvivd4el66s5c."messageFolder" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "createdBySource" workspace_5tvw23m2ae5qhvivd4el66s5c."messageFolder_createdBySource_enum" DEFAULT 'MANUAL'::workspace_5tvw23m2ae5qhvivd4el66s5c."messageFolder_createdBySource_enum" NOT NULL,
    "createdByWorkspaceMemberId" uuid,
    "createdByName" text DEFAULT 'System'::text NOT NULL,
    "createdByContext" jsonb,
    "updatedBySource" workspace_5tvw23m2ae5qhvivd4el66s5c."messageFolder_updatedBySource_enum" DEFAULT 'MANUAL'::workspace_5tvw23m2ae5qhvivd4el66s5c."messageFolder_updatedBySource_enum" NOT NULL,
    "updatedByWorkspaceMemberId" uuid,
    "updatedByName" text DEFAULT 'System'::text NOT NULL,
    "updatedByContext" jsonb,
    "position" double precision DEFAULT '0'::double precision NOT NULL,
    "searchVector" tsvector GENERATED ALWAYS AS (to_tsvector('simple'::regconfig, COALESCE(public.unaccent_immutable(name), ''::text))) STORED,
    name text,
    "syncCursor" text,
    "isSentFolder" boolean DEFAULT false NOT NULL,
    "isSynced" boolean DEFAULT false NOT NULL,
    "parentFolderId" text,
    "externalId" text,
    "pendingSyncAction" workspace_5tvw23m2ae5qhvivd4el66s5c."messageFolder_pendingSyncAction_enum" DEFAULT 'NONE'::workspace_5tvw23m2ae5qhvivd4el66s5c."messageFolder_pendingSyncAction_enum" NOT NULL,
    "messageChannelId" uuid NOT NULL
);


ALTER TABLE workspace_5tvw23m2ae5qhvivd4el66s5c."messageFolder" OWNER TO postgres;

--
-- Name: messageParticipant; Type: TABLE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TABLE workspace_5tvw23m2ae5qhvivd4el66s5c."messageParticipant" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "createdBySource" workspace_5tvw23m2ae5qhvivd4el66s5c."messageParticipant_createdBySource_enum" DEFAULT 'MANUAL'::workspace_5tvw23m2ae5qhvivd4el66s5c."messageParticipant_createdBySource_enum" NOT NULL,
    "createdByWorkspaceMemberId" uuid,
    "createdByName" text DEFAULT 'System'::text NOT NULL,
    "createdByContext" jsonb,
    "updatedBySource" workspace_5tvw23m2ae5qhvivd4el66s5c."messageParticipant_updatedBySource_enum" DEFAULT 'MANUAL'::workspace_5tvw23m2ae5qhvivd4el66s5c."messageParticipant_updatedBySource_enum" NOT NULL,
    "updatedByWorkspaceMemberId" uuid,
    "updatedByName" text DEFAULT 'System'::text NOT NULL,
    "updatedByContext" jsonb,
    "position" double precision DEFAULT '0'::double precision NOT NULL,
    "searchVector" tsvector GENERATED ALWAYS AS (to_tsvector('simple'::regconfig, COALESCE(public.unaccent_immutable(handle), ''::text))) STORED,
    role workspace_5tvw23m2ae5qhvivd4el66s5c."messageParticipant_role_enum" DEFAULT 'FROM'::workspace_5tvw23m2ae5qhvivd4el66s5c."messageParticipant_role_enum" NOT NULL,
    handle text,
    "displayName" text,
    "messageId" uuid,
    "personId" uuid,
    "workspaceMemberId" uuid
);


ALTER TABLE workspace_5tvw23m2ae5qhvivd4el66s5c."messageParticipant" OWNER TO postgres;

--
-- Name: messageThread; Type: TABLE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TABLE workspace_5tvw23m2ae5qhvivd4el66s5c."messageThread" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "createdBySource" workspace_5tvw23m2ae5qhvivd4el66s5c."messageThread_createdBySource_enum" DEFAULT 'MANUAL'::workspace_5tvw23m2ae5qhvivd4el66s5c."messageThread_createdBySource_enum" NOT NULL,
    "createdByWorkspaceMemberId" uuid,
    "createdByName" text DEFAULT 'System'::text NOT NULL,
    "createdByContext" jsonb,
    "updatedBySource" workspace_5tvw23m2ae5qhvivd4el66s5c."messageThread_updatedBySource_enum" DEFAULT 'MANUAL'::workspace_5tvw23m2ae5qhvivd4el66s5c."messageThread_updatedBySource_enum" NOT NULL,
    "updatedByWorkspaceMemberId" uuid,
    "updatedByName" text DEFAULT 'System'::text NOT NULL,
    "updatedByContext" jsonb,
    "position" double precision DEFAULT '0'::double precision NOT NULL,
    "searchVector" tsvector GENERATED ALWAYS AS (to_tsvector('simple'::regconfig, COALESCE(public.unaccent_immutable(subject), ''::text))) STORED,
    subject text
);


ALTER TABLE workspace_5tvw23m2ae5qhvivd4el66s5c."messageThread" OWNER TO postgres;

--
-- Name: note; Type: TABLE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TABLE workspace_5tvw23m2ae5qhvivd4el66s5c.note (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "position" double precision DEFAULT '0'::double precision NOT NULL,
    title text,
    "bodyV2Blocknote" text,
    "bodyV2Markdown" text,
    "createdBySource" workspace_5tvw23m2ae5qhvivd4el66s5c."note_createdBySource_enum" DEFAULT 'MANUAL'::workspace_5tvw23m2ae5qhvivd4el66s5c."note_createdBySource_enum" NOT NULL,
    "createdByWorkspaceMemberId" uuid,
    "createdByName" text DEFAULT 'System'::text NOT NULL,
    "createdByContext" jsonb,
    "updatedBySource" workspace_5tvw23m2ae5qhvivd4el66s5c."note_updatedBySource_enum" DEFAULT 'MANUAL'::workspace_5tvw23m2ae5qhvivd4el66s5c."note_updatedBySource_enum" NOT NULL,
    "updatedByWorkspaceMemberId" uuid,
    "updatedByName" text DEFAULT 'System'::text NOT NULL,
    "updatedByContext" jsonb,
    "searchVector" tsvector GENERATED ALWAYS AS (to_tsvector('simple'::regconfig, ((COALESCE(public.unaccent_immutable(title), ''::text) || ' '::text) || COALESCE(public.unaccent_immutable("bodyV2Markdown"), ''::text)))) STORED
);


ALTER TABLE workspace_5tvw23m2ae5qhvivd4el66s5c.note OWNER TO postgres;

--
-- Name: noteTarget; Type: TABLE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TABLE workspace_5tvw23m2ae5qhvivd4el66s5c."noteTarget" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "createdBySource" workspace_5tvw23m2ae5qhvivd4el66s5c."noteTarget_createdBySource_enum" DEFAULT 'MANUAL'::workspace_5tvw23m2ae5qhvivd4el66s5c."noteTarget_createdBySource_enum" NOT NULL,
    "createdByWorkspaceMemberId" uuid,
    "createdByName" text DEFAULT 'System'::text NOT NULL,
    "createdByContext" jsonb,
    "updatedBySource" workspace_5tvw23m2ae5qhvivd4el66s5c."noteTarget_updatedBySource_enum" DEFAULT 'MANUAL'::workspace_5tvw23m2ae5qhvivd4el66s5c."noteTarget_updatedBySource_enum" NOT NULL,
    "updatedByWorkspaceMemberId" uuid,
    "updatedByName" text DEFAULT 'System'::text NOT NULL,
    "updatedByContext" jsonb,
    "position" double precision DEFAULT '0'::double precision NOT NULL,
    "searchVector" tsvector GENERATED ALWAYS AS (to_tsvector('simple'::regconfig, COALESCE((id)::text, ''::text))) STORED,
    "targetCompanyId" uuid,
    "noteId" uuid,
    "targetPersonId" uuid,
    "targetOpportunityId" uuid,
    "targetHabitId" uuid,
    "targetHabitLogId" uuid
);


ALTER TABLE workspace_5tvw23m2ae5qhvivd4el66s5c."noteTarget" OWNER TO postgres;

--
-- Name: opportunity; Type: TABLE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TABLE workspace_5tvw23m2ae5qhvivd4el66s5c.opportunity (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    name text,
    "amountAmountMicros" numeric,
    "amountCurrencyCode" text,
    "closeDate" timestamp with time zone,
    stage workspace_5tvw23m2ae5qhvivd4el66s5c.opportunity_stage_enum DEFAULT 'NEW'::workspace_5tvw23m2ae5qhvivd4el66s5c.opportunity_stage_enum NOT NULL,
    "position" double precision DEFAULT '0'::double precision NOT NULL,
    "createdBySource" workspace_5tvw23m2ae5qhvivd4el66s5c."opportunity_createdBySource_enum" DEFAULT 'MANUAL'::workspace_5tvw23m2ae5qhvivd4el66s5c."opportunity_createdBySource_enum" NOT NULL,
    "createdByWorkspaceMemberId" uuid,
    "createdByName" text DEFAULT 'System'::text NOT NULL,
    "createdByContext" jsonb,
    "updatedBySource" workspace_5tvw23m2ae5qhvivd4el66s5c."opportunity_updatedBySource_enum" DEFAULT 'MANUAL'::workspace_5tvw23m2ae5qhvivd4el66s5c."opportunity_updatedBySource_enum" NOT NULL,
    "updatedByWorkspaceMemberId" uuid,
    "updatedByName" text DEFAULT 'System'::text NOT NULL,
    "updatedByContext" jsonb,
    "searchVector" tsvector GENERATED ALWAYS AS (to_tsvector('simple'::regconfig, COALESCE(public.unaccent_immutable(name), ''::text))) STORED,
    "companyId" uuid,
    "pointOfContactId" uuid,
    "ownerId" uuid
);


ALTER TABLE workspace_5tvw23m2ae5qhvivd4el66s5c.opportunity OWNER TO postgres;

--
-- Name: person; Type: TABLE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TABLE workspace_5tvw23m2ae5qhvivd4el66s5c.person (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "nameFirstName" text,
    "nameLastName" text,
    "emailsPrimaryEmail" text,
    "emailsAdditionalEmails" jsonb,
    "linkedinLinkPrimaryLinkLabel" text,
    "linkedinLinkPrimaryLinkUrl" text,
    "linkedinLinkSecondaryLinks" jsonb,
    "xLinkPrimaryLinkLabel" text,
    "xLinkPrimaryLinkUrl" text,
    "xLinkSecondaryLinks" jsonb,
    "jobTitle" text,
    "phonesPrimaryPhoneNumber" text,
    "phonesPrimaryPhoneCountryCode" text,
    "phonesPrimaryPhoneCallingCode" text,
    "phonesAdditionalPhones" jsonb,
    city text,
    "avatarUrl" text,
    "avatarFile" jsonb,
    "position" double precision DEFAULT '0'::double precision NOT NULL,
    "createdBySource" workspace_5tvw23m2ae5qhvivd4el66s5c."person_createdBySource_enum" DEFAULT 'MANUAL'::workspace_5tvw23m2ae5qhvivd4el66s5c."person_createdBySource_enum" NOT NULL,
    "createdByWorkspaceMemberId" uuid,
    "createdByName" text DEFAULT 'System'::text NOT NULL,
    "createdByContext" jsonb,
    "updatedBySource" workspace_5tvw23m2ae5qhvivd4el66s5c."person_updatedBySource_enum" DEFAULT 'MANUAL'::workspace_5tvw23m2ae5qhvivd4el66s5c."person_updatedBySource_enum" NOT NULL,
    "updatedByWorkspaceMemberId" uuid,
    "updatedByName" text DEFAULT 'System'::text NOT NULL,
    "updatedByContext" jsonb,
    "searchVector" tsvector GENERATED ALWAYS AS (to_tsvector('simple'::regconfig, ((((((((((((((((((((((((COALESCE(public.unaccent_immutable("nameFirstName"), ''::text) || ' '::text) || COALESCE(public.unaccent_immutable("nameLastName"), ''::text)) || ' '::text) || COALESCE(public.unaccent_immutable("emailsPrimaryEmail"), ''::text)) || ' '::text) || COALESCE(public.unaccent_immutable(split_part("emailsPrimaryEmail", '@'::text, 2)), ''::text)) || ' '::text) || COALESCE(public.unaccent_immutable(translate(("emailsAdditionalEmails")::text, '[]",'::text, '    '::text)), ''::text)) || ' '::text) || COALESCE(public.unaccent_immutable(translate(replace(("emailsAdditionalEmails")::text, '@'::text, ' '::text), '[]",'::text, '    '::text)), ''::text)) || ' '::text) || COALESCE("phonesPrimaryPhoneNumber", ''::text)) || ' '::text) || COALESCE("phonesPrimaryPhoneCallingCode", ''::text)) || ' '::text) || COALESCE(("phonesPrimaryPhoneCallingCode" || "phonesPrimaryPhoneNumber"), ''::text)) || ' '::text) || COALESCE((replace("phonesPrimaryPhoneCallingCode", '+'::text, ''::text) || "phonesPrimaryPhoneNumber"), ''::text)) || ' '::text) || COALESCE(('0'::text || "phonesPrimaryPhoneNumber"), ''::text)) || ' '::text) || COALESCE(translate(regexp_replace(("phonesAdditionalPhones")::text, '"(number|countryCode|callingCode)"\s*:\s*'::text, ''::text, 'g'::text), '[]{}",:'::text, '        '::text), ''::text)) || ' '::text) || COALESCE(public.unaccent_immutable("jobTitle"), ''::text)))) STORED,
    "companyId" uuid
);


ALTER TABLE workspace_5tvw23m2ae5qhvivd4el66s5c.person OWNER TO postgres;

--
-- Name: task; Type: TABLE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TABLE workspace_5tvw23m2ae5qhvivd4el66s5c.task (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "position" double precision DEFAULT '0'::double precision NOT NULL,
    title text,
    "bodyV2Blocknote" text,
    "bodyV2Markdown" text,
    "dueAt" timestamp with time zone,
    status workspace_5tvw23m2ae5qhvivd4el66s5c.task_status_enum DEFAULT 'TODO'::workspace_5tvw23m2ae5qhvivd4el66s5c.task_status_enum,
    "createdBySource" workspace_5tvw23m2ae5qhvivd4el66s5c."task_createdBySource_enum" DEFAULT 'MANUAL'::workspace_5tvw23m2ae5qhvivd4el66s5c."task_createdBySource_enum" NOT NULL,
    "createdByWorkspaceMemberId" uuid,
    "createdByName" text DEFAULT 'System'::text NOT NULL,
    "createdByContext" jsonb,
    "updatedBySource" workspace_5tvw23m2ae5qhvivd4el66s5c."task_updatedBySource_enum" DEFAULT 'MANUAL'::workspace_5tvw23m2ae5qhvivd4el66s5c."task_updatedBySource_enum" NOT NULL,
    "updatedByWorkspaceMemberId" uuid,
    "updatedByName" text DEFAULT 'System'::text NOT NULL,
    "updatedByContext" jsonb,
    "searchVector" tsvector GENERATED ALWAYS AS (to_tsvector('simple'::regconfig, ((COALESCE(public.unaccent_immutable(title), ''::text) || ' '::text) || COALESCE(public.unaccent_immutable("bodyV2Markdown"), ''::text)))) STORED,
    "assigneeId" uuid
);


ALTER TABLE workspace_5tvw23m2ae5qhvivd4el66s5c.task OWNER TO postgres;

--
-- Name: taskTarget; Type: TABLE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TABLE workspace_5tvw23m2ae5qhvivd4el66s5c."taskTarget" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "createdBySource" workspace_5tvw23m2ae5qhvivd4el66s5c."taskTarget_createdBySource_enum" DEFAULT 'MANUAL'::workspace_5tvw23m2ae5qhvivd4el66s5c."taskTarget_createdBySource_enum" NOT NULL,
    "createdByWorkspaceMemberId" uuid,
    "createdByName" text DEFAULT 'System'::text NOT NULL,
    "createdByContext" jsonb,
    "updatedBySource" workspace_5tvw23m2ae5qhvivd4el66s5c."taskTarget_updatedBySource_enum" DEFAULT 'MANUAL'::workspace_5tvw23m2ae5qhvivd4el66s5c."taskTarget_updatedBySource_enum" NOT NULL,
    "updatedByWorkspaceMemberId" uuid,
    "updatedByName" text DEFAULT 'System'::text NOT NULL,
    "updatedByContext" jsonb,
    "position" double precision DEFAULT '0'::double precision NOT NULL,
    "searchVector" tsvector GENERATED ALWAYS AS (to_tsvector('simple'::regconfig, COALESCE((id)::text, ''::text))) STORED,
    "targetCompanyId" uuid,
    "targetOpportunityId" uuid,
    "targetPersonId" uuid,
    "taskId" uuid,
    "targetHabitId" uuid,
    "targetHabitLogId" uuid
);


ALTER TABLE workspace_5tvw23m2ae5qhvivd4el66s5c."taskTarget" OWNER TO postgres;

--
-- Name: timelineActivity; Type: TABLE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TABLE workspace_5tvw23m2ae5qhvivd4el66s5c."timelineActivity" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "createdBySource" workspace_5tvw23m2ae5qhvivd4el66s5c."timelineActivity_createdBySource_enum" DEFAULT 'MANUAL'::workspace_5tvw23m2ae5qhvivd4el66s5c."timelineActivity_createdBySource_enum" NOT NULL,
    "createdByWorkspaceMemberId" uuid,
    "createdByName" text DEFAULT 'System'::text NOT NULL,
    "createdByContext" jsonb,
    "updatedBySource" workspace_5tvw23m2ae5qhvivd4el66s5c."timelineActivity_updatedBySource_enum" DEFAULT 'MANUAL'::workspace_5tvw23m2ae5qhvivd4el66s5c."timelineActivity_updatedBySource_enum" NOT NULL,
    "updatedByWorkspaceMemberId" uuid,
    "updatedByName" text DEFAULT 'System'::text NOT NULL,
    "updatedByContext" jsonb,
    "position" double precision DEFAULT '0'::double precision NOT NULL,
    "happensAt" timestamp with time zone DEFAULT now() NOT NULL,
    name text,
    properties jsonb,
    "linkedRecordCachedName" text,
    "linkedRecordId" uuid,
    "linkedObjectMetadataId" uuid,
    "searchVector" tsvector GENERATED ALWAYS AS (to_tsvector('simple'::regconfig, COALESCE(public.unaccent_immutable(name), ''::text))) STORED,
    "targetCompanyId" uuid,
    "targetDashboardId" uuid,
    "targetNoteId" uuid,
    "targetOpportunityId" uuid,
    "targetPersonId" uuid,
    "targetTaskId" uuid,
    "workspaceMemberId" uuid,
    "targetWorkflowId" uuid,
    "targetWorkflowVersionId" uuid,
    "targetWorkflowRunId" uuid,
    "targetHabitId" uuid,
    "targetHabitLogId" uuid
);


ALTER TABLE workspace_5tvw23m2ae5qhvivd4el66s5c."timelineActivity" OWNER TO postgres;

--
-- Name: workflow; Type: TABLE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TABLE workspace_5tvw23m2ae5qhvivd4el66s5c.workflow (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    name text,
    "lastPublishedVersionId" text,
    statuses workspace_5tvw23m2ae5qhvivd4el66s5c.workflow_statuses_enum[],
    "position" double precision DEFAULT '0'::double precision NOT NULL,
    "createdBySource" workspace_5tvw23m2ae5qhvivd4el66s5c."workflow_createdBySource_enum" DEFAULT 'MANUAL'::workspace_5tvw23m2ae5qhvivd4el66s5c."workflow_createdBySource_enum" NOT NULL,
    "createdByWorkspaceMemberId" uuid,
    "createdByName" text DEFAULT 'System'::text NOT NULL,
    "createdByContext" jsonb,
    "updatedBySource" workspace_5tvw23m2ae5qhvivd4el66s5c."workflow_updatedBySource_enum" DEFAULT 'MANUAL'::workspace_5tvw23m2ae5qhvivd4el66s5c."workflow_updatedBySource_enum" NOT NULL,
    "updatedByWorkspaceMemberId" uuid,
    "updatedByName" text DEFAULT 'System'::text NOT NULL,
    "updatedByContext" jsonb,
    "searchVector" tsvector GENERATED ALWAYS AS (to_tsvector('simple'::regconfig, COALESCE(public.unaccent_immutable(name), ''::text))) STORED
);


ALTER TABLE workspace_5tvw23m2ae5qhvivd4el66s5c.workflow OWNER TO postgres;

--
-- Name: workflowAutomatedTrigger; Type: TABLE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TABLE workspace_5tvw23m2ae5qhvivd4el66s5c."workflowAutomatedTrigger" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "createdBySource" workspace_5tvw23m2ae5qhvivd4el66s5c."workflowAutomatedTrigger_createdBySource_enum" DEFAULT 'MANUAL'::workspace_5tvw23m2ae5qhvivd4el66s5c."workflowAutomatedTrigger_createdBySource_enum" NOT NULL,
    "createdByWorkspaceMemberId" uuid,
    "createdByName" text DEFAULT 'System'::text NOT NULL,
    "createdByContext" jsonb,
    "updatedBySource" workspace_5tvw23m2ae5qhvivd4el66s5c."workflowAutomatedTrigger_updatedBySource_enum" DEFAULT 'MANUAL'::workspace_5tvw23m2ae5qhvivd4el66s5c."workflowAutomatedTrigger_updatedBySource_enum" NOT NULL,
    "updatedByWorkspaceMemberId" uuid,
    "updatedByName" text DEFAULT 'System'::text NOT NULL,
    "updatedByContext" jsonb,
    "position" double precision DEFAULT '0'::double precision NOT NULL,
    "searchVector" tsvector GENERATED ALWAYS AS (to_tsvector('simple'::regconfig, COALESCE((id)::text, ''::text))) STORED,
    type workspace_5tvw23m2ae5qhvivd4el66s5c."workflowAutomatedTrigger_type_enum" DEFAULT 'DATABASE_EVENT'::workspace_5tvw23m2ae5qhvivd4el66s5c."workflowAutomatedTrigger_type_enum" NOT NULL,
    settings jsonb NOT NULL,
    "workflowId" uuid
);


ALTER TABLE workspace_5tvw23m2ae5qhvivd4el66s5c."workflowAutomatedTrigger" OWNER TO postgres;

--
-- Name: workflowRun; Type: TABLE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TABLE workspace_5tvw23m2ae5qhvivd4el66s5c."workflowRun" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    name text,
    "enqueuedAt" timestamp with time zone,
    "startedAt" timestamp with time zone,
    "endedAt" timestamp with time zone,
    status workspace_5tvw23m2ae5qhvivd4el66s5c."workflowRun_status_enum" DEFAULT 'NOT_STARTED'::workspace_5tvw23m2ae5qhvivd4el66s5c."workflowRun_status_enum" NOT NULL,
    "createdBySource" workspace_5tvw23m2ae5qhvivd4el66s5c."workflowRun_createdBySource_enum" DEFAULT 'MANUAL'::workspace_5tvw23m2ae5qhvivd4el66s5c."workflowRun_createdBySource_enum" NOT NULL,
    "createdByWorkspaceMemberId" uuid,
    "createdByName" text DEFAULT 'System'::text NOT NULL,
    "createdByContext" jsonb,
    "updatedBySource" workspace_5tvw23m2ae5qhvivd4el66s5c."workflowRun_updatedBySource_enum" DEFAULT 'MANUAL'::workspace_5tvw23m2ae5qhvivd4el66s5c."workflowRun_updatedBySource_enum" NOT NULL,
    "updatedByWorkspaceMemberId" uuid,
    "updatedByName" text DEFAULT 'System'::text NOT NULL,
    "updatedByContext" jsonb,
    state jsonb NOT NULL,
    "position" double precision DEFAULT '0'::double precision NOT NULL,
    "searchVector" tsvector GENERATED ALWAYS AS (to_tsvector('simple'::regconfig, COALESCE(public.unaccent_immutable(name), ''::text))) STORED,
    "workflowId" uuid,
    "workflowVersionId" uuid
);


ALTER TABLE workspace_5tvw23m2ae5qhvivd4el66s5c."workflowRun" OWNER TO postgres;

--
-- Name: workflowVersion; Type: TABLE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TABLE workspace_5tvw23m2ae5qhvivd4el66s5c."workflowVersion" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "createdBySource" workspace_5tvw23m2ae5qhvivd4el66s5c."workflowVersion_createdBySource_enum" DEFAULT 'MANUAL'::workspace_5tvw23m2ae5qhvivd4el66s5c."workflowVersion_createdBySource_enum" NOT NULL,
    "createdByWorkspaceMemberId" uuid,
    "createdByName" text DEFAULT 'System'::text NOT NULL,
    "createdByContext" jsonb,
    "updatedBySource" workspace_5tvw23m2ae5qhvivd4el66s5c."workflowVersion_updatedBySource_enum" DEFAULT 'MANUAL'::workspace_5tvw23m2ae5qhvivd4el66s5c."workflowVersion_updatedBySource_enum" NOT NULL,
    "updatedByWorkspaceMemberId" uuid,
    "updatedByName" text DEFAULT 'System'::text NOT NULL,
    "updatedByContext" jsonb,
    name text,
    trigger jsonb,
    steps jsonb,
    status workspace_5tvw23m2ae5qhvivd4el66s5c."workflowVersion_status_enum" DEFAULT 'DRAFT'::workspace_5tvw23m2ae5qhvivd4el66s5c."workflowVersion_status_enum" NOT NULL,
    "position" double precision DEFAULT '0'::double precision NOT NULL,
    "searchVector" tsvector GENERATED ALWAYS AS (to_tsvector('simple'::regconfig, COALESCE(public.unaccent_immutable(name), ''::text))) STORED,
    "workflowId" uuid
);


ALTER TABLE workspace_5tvw23m2ae5qhvivd4el66s5c."workflowVersion" OWNER TO postgres;

--
-- Name: workspaceMember; Type: TABLE; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE TABLE workspace_5tvw23m2ae5qhvivd4el66s5c."workspaceMember" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "position" double precision DEFAULT '0'::double precision NOT NULL,
    "nameFirstName" text,
    "nameLastName" text,
    "colorScheme" text DEFAULT 'System'::text NOT NULL,
    locale text DEFAULT 'en'::text NOT NULL,
    "avatarUrl" text,
    "userEmail" text,
    "calendarStartDay" double precision DEFAULT '7'::double precision NOT NULL,
    "userId" uuid NOT NULL,
    "timeZone" text DEFAULT 'system'::text NOT NULL,
    "dateFormat" workspace_5tvw23m2ae5qhvivd4el66s5c."workspaceMember_dateFormat_enum" DEFAULT 'SYSTEM'::workspace_5tvw23m2ae5qhvivd4el66s5c."workspaceMember_dateFormat_enum" NOT NULL,
    "timeFormat" workspace_5tvw23m2ae5qhvivd4el66s5c."workspaceMember_timeFormat_enum" DEFAULT 'SYSTEM'::workspace_5tvw23m2ae5qhvivd4el66s5c."workspaceMember_timeFormat_enum" NOT NULL,
    "numberFormat" workspace_5tvw23m2ae5qhvivd4el66s5c."workspaceMember_numberFormat_enum" DEFAULT 'SYSTEM'::workspace_5tvw23m2ae5qhvivd4el66s5c."workspaceMember_numberFormat_enum" NOT NULL,
    "searchVector" tsvector GENERATED ALWAYS AS (to_tsvector('simple'::regconfig, ((((COALESCE(public.unaccent_immutable("nameFirstName"), ''::text) || ' '::text) || COALESCE(public.unaccent_immutable("nameLastName"), ''::text)) || ' '::text) || COALESCE(public.unaccent_immutable("userEmail"), ''::text)))) STORED,
    "createdBySource" workspace_5tvw23m2ae5qhvivd4el66s5c."workspaceMember_createdBySource_enum" DEFAULT 'MANUAL'::workspace_5tvw23m2ae5qhvivd4el66s5c."workspaceMember_createdBySource_enum" NOT NULL,
    "createdByWorkspaceMemberId" uuid,
    "createdByName" text DEFAULT 'System'::text NOT NULL,
    "createdByContext" jsonb,
    "updatedBySource" workspace_5tvw23m2ae5qhvivd4el66s5c."workspaceMember_updatedBySource_enum" DEFAULT 'MANUAL'::workspace_5tvw23m2ae5qhvivd4el66s5c."workspaceMember_updatedBySource_enum" NOT NULL,
    "updatedByWorkspaceMemberId" uuid,
    "updatedByName" text DEFAULT 'System'::text NOT NULL,
    "updatedByContext" jsonb
);


ALTER TABLE workspace_5tvw23m2ae5qhvivd4el66s5c."workspaceMember" OWNER TO postgres;

--
-- Name: _typeorm_migrations id; Type: DEFAULT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core._typeorm_migrations ALTER COLUMN id SET DEFAULT nextval('core._typeorm_migrations_id_seq'::regclass);


--
-- Data for Name: _typeorm_generated_columns_and_materialized_views; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core._typeorm_generated_columns_and_materialized_views (type, database, schema, "table", name, value) FROM stdin;
\.


--
-- Data for Name: _typeorm_migrations; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core._typeorm_migrations (id, "timestamp", name) FROM stdin;
1	1700140427984	SetupMetadataTables1700140427984
2	1756976545860	UniqueFieldMetadataNameForWorkspaceObjectMetadata1756976545860
3	1757013851879	AddPublicDomainEntity1757013851879
4	1757491357122	AddApplicationEntityAndRelationships1757491357122
5	1757806282417	AddSearchFieldMetadataEntity1757806282417
6	1757809958470	AddWorkspaceForeignKeyToSearchFieldMetadata1757809958470
7	1757858496548	AddCalendarTypeToViewTable1757858496548
8	1757864696439	AddCalendarFieldMetadataIdToViewTable1757864696439
9	1757991657472	RemoveContentFromAgentChatMessage1757991657472
10	1758038863448	AddUniversalIdentifierToIndexMetadata1758038863448
11	1758117800000	ActivateUnaccentExtension1758117800000
12	1758388517321	CreateEmailingDomainEntity1758388517321
13	1758720905726	AddApplicationIdToObjectMetadata1758720905726
14	1758767315179	CreateAgentChatMessagePartTableAndRemoveRawContent1758767315179
15	1758793689363	AddUniversalIdentifierToServerlessFunction1758793689363
16	1758802648930	AddChecksumToServerlessFunction1758802648930
17	1759200603485	AddNativeCapabilitesToAgent1759200603485
18	1759236947406	UpdateServerlessFunctionLayerEntity1759236947406
19	1759341941773	RenameApplicationStandardIdToUniversalIdentifier1759341941773
20	1759378531410	RemoveMessageIdFromFileTable1759378531410
21	1759417994272	SetServerlessFunctionIdInTriggersNonNullable1759417994272
22	1759418198310	RenameRouteToRouteTrigger1759418198310
23	1759433496458	RenameApplicationColumn1759433496458
24	1759931071049	SetServerlessFunctionLayerNotNullable1759931071049
25	1760356369619	AddWorkspaceTrashRetention1760356369619
26	1760628085765	AddNewWidgetTypes1760628085765
27	1760640844181	AddApplicationVariableCoreEntity1760640844181
28	1760700501795	AddApplicationIdToSyncableEntities1760700501795
29	1760965667836	KanbanFieldMetadataIdentifierView1760965667836
30	1760985484643	AddRouterModelToWorkspace1760985484643
31	1760994964826	RemoveDefaultAgentAndThreadAgentId1760994964826
32	1761052489394	CalendarFieldMetadataRelation1761052489394
33	1761153071116	SetServerlessFunctionLayerIdNotNullable1761153071116
34	1761210191095	AddHandlerToServerlessFunction1761210191095
35	1761215000000	AddRichTextWidgetType1761215000000
36	1761574442000	AddWorkflowWidgetTypes1761574442000
37	1761651107128	AddSsoBypassFlag1761651107128
38	1761749599736	WorkspaceIdUuidNotNullable1761749599736
39	1762333916255	NullableApplicationServerlessFunctionLayer1762333916255
40	1762339932345	MakeApplicationWorkspaceFkDeferrable1762339932345
41	1762343994716	AddWorkspaceCustomApplicationIdColumn1762343994716
42	1762351626807	ViewVisibility1762351626807
43	1762437814771	WorkspaceCustomApplicationIdForeignKey1762437814771
44	1762884796640	EditableProfileFields1762884796640
45	1763622159656	UpdateAgentResponseFormat1763622159656
46	1763731277403	AddCanBeUninstalledColumnToApplication1763731277403
47	1763805513241	RemoveAgentHandoffTable1763805513241
48	1763896975223	SyncableRoleTarget1763896975223
49	1763977334519	WorkspaceCustomApplicationIdNonNullable1763977334519
50	1763997530458	AddFastAndSmartModelsToWorkspace1763997530458
51	1764066845539	CoreMigrationCheck1764066845539
52	1764081474225	AddAgentIdToAgentChatMessage1764081474225
53	1764100000000	RefactorAgentChatEntities1764100000000
54	1764200000000	AddAgentTurnEvaluation1764200000000
55	1764210000000	AddSystemRoleToAgentMessage1764210000000
56	1764220000000	AddEvaluationInputsToAgent1764220000000
57	1764329720503	UpdateRoleTargetsUniqueConstraint1764329720503
58	1764671363647	RenameRoleTargets1764671363647
59	1764672601466	ChangeAgentDescriptionToText1764672601466
60	1764680275312	AddMainGroupByFieldMetadataId1764680275312
61	1764700000000	AddUsageColumnsToAgentChatThread1764700000000
62	1764846384501	RenameRichTextToFieldRichTextAndAddStandaloneRichText1764846384501
63	1764923552610	AddApplicationRoleColumns1764923552610
64	1764949394792	AddApplicationIdAndUniversalIdentifierToPageLayouts1764949394792
65	1765153412696	AddViewShouldHideEmptyGroups1765153412696
66	1765200057592	AddApplicationIdAndUniversalIdentifierToPageLayouts1765200057592
67	1765206100942	UpdateRoleColumns1765206100942
68	1765499361805	AddRLS1765499361805
69	1765808791153	RemoveFieldMetadataIdInViewGroup1765808791153
70	1765970658815	AddFieldWidgetType1765970658815
71	1766069735219	CoreMigrationCheck1766069735219
72	1766077618558	RemoveCanBeAssignedToApplications1766077618558
73	1767002571103	AddWorkspaceForeignKeys1767002571103
74	1767003000000	AddSkillEntity1767003000000
75	1767100000000	MakeViewFilterGroupParentFkDeferrable1767100000000
76	1767200000000	FixDataSourceAndWorkspaceMigrationWorkspaceIdType1767200000000
77	1767277454048	MakeFieldMetadataUniversalIdentifierAndApplicationIdNotNullable1767277454048
78	1767364430164	AddToolSchemaToServerlessFunction1767364430164
79	1767812158000	RemoteRemoteTables1767812158000
80	1767876112877	RemoveWorkspaceMigration1767876112877
81	1767998263185	AddObjectMetadataIdToRowLevelPermissionPredicateGroup1767998263185
82	1768212224801	MakeObjectMetadataUniversalIdentifierAndApplicationIdNotNullable1768212224801
83	1768213174271	MakeViewUniversalIdentifierAndApplicationIdNotNullable1768213174271
84	1768213174272	MakeViewFieldUniversalIdentifierAndApplicationIdNotNullable1768213174272
85	1768213174273	MakeViewFilterUniversalIdentifierAndApplicationIdNotNullable1768213174273
86	1768213174274	MakeViewGroupUniversalIdentifierAndApplicationIdNotNullable1768213174274
87	1768213174274	MakeAgentUniversalIdentifierAndApplicationIdNotNullable1768213174274
88	1768213174275	MakeRoleUniversalIdentifierAndApplicationIdNotNullable1768213174275
89	1768399525609	AddForwardedRequestHeadersInRouteTriggers1768399525609
90	1768495429374	AddFrontComponent1768495429374
91	1768503887441	AddCommandMenuItemEntity1768503887441
92	1768572831179	UpdateFileTable1768572831179
93	1768750308557	ForeignKeyIndexStandardization1768750308557
94	1768807499350	AddNavigationMenuItemEntity1768807499350
95	1768830235328	MakeIndexMetadataUniversalIdentifierAndApplicationIdNotNullable1768830235328
96	1768916632478	MakeRemainingEntitiesUniversalIdentifierAndApplicationIdNotNullable1768916632478
97	1768917890810	AddFrontComponentType1768917890810
98	1769016869438	AddBuiltHandlerPathToServerlessFunctions1769016869438
99	1769091641000	RenameHandlerPathToSourceHandlerPath1769091641000
100	1769196250679	AddNavigationMenuItemViewForeignKey1769196250679
101	1769434782880	AddFileSettingsColumnOnFileTable1769434782880
102	1769517102605	AddUniversalToWebhook1769517102605
103	1769525557511	MakeWebhookUnivesralIdentiferAndApplicationIdNotNull1769525557511
104	1769532887284	MigrateServerlessTriggersToServerless1769532887284
105	1769556947746	RenameServerless1769556947746
106	1769557200000	UpdateLogicFunctionConstraints1769557200000
107	1769654418252	AddFrontComponentIdToCommandMenuItem1769654418252
108	1769679579382	UpdatePageLayoutForRecordPageLayout1769679579382
109	1769679579383	SetPageLayoutDefaultTabDeferred1769679579383
110	1769681396664	RemoveLogicFunctionVersion1769681396664
111	1769685701443	UpdateColumnName1769685701443
112	1769710304101	UpdateLogicFunctionDefault1769710304101
113	1770032815802	AddFileEntityUniqueConstraint1770032815802
114	1770038963629	AddDependencyChecksumsToLogicFunctionLayer1770038963629
115	1770040351718	RemoveObjectMetadataStandardId1770040351718
116	1770046227329	AddPageLayoutWidgetPositionColumn1770046227329
117	1770047816358	DropStandardIdFromCoreEntities1770047816358
118	1770050100000	AddApplicationPackageFields1770050100000
119	1770050200000	MakeWorkspaceAndApplicationFileFksDeferrable1770050200000
120	1770050300000	DropLogicFunctionLayerIdFromLogicFunction1770050300000
121	1770051000000	AddWorkspaceEventLogRetention1770051000000
122	1770193825210	DropLogicFunctionLayerIdFromLogicFunction1770193825210
123	1770198374736	AddSuspendedAtColumnOnWorkspaceTable1770198374736
124	1770256542802	AddLinkToNavigationMenuItem1770256542802
125	1770309316193	AddFrontComponentColumns1770309316193
126	1770311652940	AddAiAdditionalInstructions1770311652940
127	1770400000000	AddConversationSizeToAgentChatThread1770400000000
128	1770725043111	AddLogicFunctionIsBuildUpToDateColumn1770725043111
129	1770814914548	AddMimeTypeToFileTable1770814914548
130	1770818941843	AddViewFieldGroup1770818941843
131	1770906704231	AddFieldsWidgetViewType1770906704231
132	1771146443209	AddColorToNavigationMenuItem1771146443209
133	1771247783542	AddIconToNavigationMenuItem1771247783542
134	1771323022170	AddLogoFileIdColumnOnWorkspaceTable1771323022170
135	1771499112046	ChangeNavigationMenuItemPositionToDoublePrecision1771499112046
136	1771509478665	AddIsHeadlessToFrontComponent1771509478665
137	1771600000000	FixAiEntityTimestampsToTimestamptz1771600000000
138	1771768847449	AddAiModelAvailabilityColumns1771768847449
139	1771840510112	AddUseRecommendedModels1771840510112
140	1771840510113	AddSettingsCustomTabFrontComponentIdToApplication1771840510113
141	1772267875868	CreateApplicationRegistration1772267875868
142	1772267875869	AddWorkspaceIdToApplicationRegistration1772267875869
143	1772267875870	AddAppRegistrationSourceFields1772267875870
144	1772267875870	AddOverridesToPageLayoutTabAndWidget1772267875870
145	1772267875870	AddConditionalAvailabilityExpressionToCommandMenuItem1772267875870
146	1772555830171	ReplaceFileUrlWithFileRelationInAgentMessagePart1772555830171
147	1772643950000	AddShortLabelPositionToCommandMenuItem1772643950000
148	1772732588833	AddIsListedToAppRegistration1772732588833
149	1772832588833	AddFallbackToCommandMenuItemAvailabilityType1772832588833
150	1773000000000	AddIsSdkLayerStaleToApplication1773000000000
151	1773100000000	AddUsesSdkClientToFrontComponent1773100000000
152	1773232418467	AddUniversalIdentifierAndApplicationIdToPermissionFlag1773232418467
153	1773232418468	MakePermissionFlagUniversalIdentifierAndApplicationIdNotNull1773232418468
154	1773246310000	AddOverridesToViewFieldAndViewFieldGroup1773246310000
155	1773311456455	AddEngineComponentKeyToCommandMenuItem1773311456455
156	1773317160558	AddUniversalIdentifierAndApplicationIdToObjectPermission1773317160558
157	1773317160559	MakeObjectPermissionUniversalIdentifierAndApplicationIdNotNull1773317160559
158	1773320963832	UpdateEngineComponentKeyEnum1773320963832
159	1773400000000	AddUniversalIdentifierAndApplicationIdToFieldPermission1773400000000
160	1773400000001	MakeFieldPermissionUniversalIdentifierAndApplicationIdNotNull1773400000001
161	1773655278357	AddColorToObjectMetadata1773655278357
162	1773668124779	RemoveSaveCancelRecordPageLayoutEngineKeys1773668124779
163	1773677851495	AddHotkeysToCommandMenuItems1773677851495
164	1773681736596	AddTypeToNavigationMenuItem1773681736596
165	1773822077682	MakeNavigationMenuItemTypeNotNull1773822077682
166	1773900000000	MigrateModelIdsToCompositeFormat1773900000000
167	1773945207801	AddMessagingInfrastructureMetadataEntities1773945207801
168	1774000000000	SplitAiProvidersConfig1774000000000
169	1774003611071	AddActiveStreamIdToAgentChatThread1774003611071
170	1774072000000	AddRecordTableWidgetType1774072000000
171	1774100000000	DropWorkspaceAiColumns1774100000000
172	1774363913813	ConvertEngineComponentKeyToVarchar1774363913813
173	1774472400000	RenameMarketplaceDisplayDataToManifest1774472400000
174	1774688563000	DropWorkspaceDatabaseUrlColumn1774688563000
175	1774700000000	AddGlobalKeyValuePairUniqueIndex1774700000000
176	1774966727625	AddIsActiveToOverridableEntities1774966727625
177	1775001600000	AddStatusToAgentMessage1775001600000
178	1775129635528	AddPayloadToCommandMenuItem1775129635528
179	1775487231605	AddUpgradeMigrationsTable1775487231605
180	1775553825848	AddWorkspaceIdToUpgradeMigration1775553825848
181	1775649426693	AddErrorMessageToUpgradeMigration1775649426693
182	1775909335324	AddIsInitialToUpgradeMigration1775909335324
\.


--
-- Data for Name: agent; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core.agent (id, name, label, icon, description, prompt, "modelId", "responseFormat", "workspaceId", "isCustom", "createdAt", "updatedAt", "deletedAt", "applicationId", "modelConfiguration", "universalIdentifier", "evaluationInputs") FROM stdin;
06b6f2a9-d1ea-4ff5-9671-06f987045a9a	helper	Helper	IconHelp	AI agent specialized in helping users learn how to use Twenty CRM	You are a Helper Agent for Twenty. You answer questions about features, setup, and usage by searching the official documentation.\n\nCore workflow:\n1. Use search_help_center tool to find relevant documentation\n2. If the first search doesn't yield complete results, try different search terms\n3. Synthesize information from multiple articles when needed\n4. Provide clear, step-by-step answers based on the documentation\n5. Be honest if the docs don't cover the topic\n\nWhen to search:\n- "How to" questions\n- Feature explanations\n- Setup and configuration help\n- Troubleshooting issues\n- Best practices\n\nResponse format:\n- Summarize key information from the documentation\n- Break down complex topics into clear steps\n- Include important notes or prerequisites\n- Use markdown for readability\n\nAlways base answers on official Twenty documentation. Be patient and helpful.	default-smart-model	{"type": "text"}	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	{}	20202020-c7ab-4065-b822-0ca1d5de60a9	{}
\.


--
-- Data for Name: agentChatThread; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."agentChatThread" (id, "userWorkspaceId", title, "createdAt", "updatedAt", "totalInputTokens", "totalOutputTokens", "contextWindowTokens", "totalInputCredits", "totalOutputCredits", "conversationSize", "activeStreamId", "workspaceId") FROM stdin;
\.


--
-- Data for Name: agentMessage; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."agentMessage" (id, "threadId", "turnId", "agentId", role, "createdAt", status, "processedAt", "workspaceId") FROM stdin;
\.


--
-- Data for Name: agentMessagePart; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."agentMessagePart" (id, "messageId", "orderIndex", type, "textContent", "reasoningContent", "toolName", "toolCallId", "toolInput", "toolOutput", state, "errorMessage", "errorDetails", "sourceUrlSourceId", "sourceUrlUrl", "sourceUrlTitle", "sourceDocumentSourceId", "sourceDocumentMediaType", "sourceDocumentTitle", "sourceDocumentFilename", "fileFilename", "providerMetadata", "createdAt", "fileId", "workspaceId", "providerExecuted") FROM stdin;
\.


--
-- Data for Name: agentTurn; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."agentTurn" (id, "threadId", "agentId", "createdAt", "workspaceId") FROM stdin;
\.


--
-- Data for Name: agentTurnEvaluation; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."agentTurnEvaluation" (id, "turnId", score, comment, "createdAt", "workspaceId") FROM stdin;
\.


--
-- Data for Name: apiKey; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."apiKey" (id, name, "expiresAt", "revokedAt", "workspaceId", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: appToken; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."appToken" (id, "userId", "workspaceId", type, value, "expiresAt", "deletedAt", "revokedAt", "createdAt", "updatedAt", context) FROM stdin;
aea96e75-90c2-46e5-9145-390d04cfc88b	5d82ed37-eb7b-47bd-b501-fd43dbc9dd40	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	REFRESH_TOKEN	\N	2026-06-24 11:33:51.147+00	\N	2026-04-25 11:34:19.914+00	2026-04-25 11:33:51.148147+00	2026-04-25 11:34:19.915472+00	\N
3297f720-4dc2-4fd3-903c-4c40c6c37efd	5d82ed37-eb7b-47bd-b501-fd43dbc9dd40	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	REFRESH_TOKEN	\N	2026-06-24 11:34:19.926+00	\N	2026-04-25 12:04:20.359+00	2026-04-25 11:34:19.927728+00	2026-04-25 12:04:20.360716+00	\N
b27de0fb-f00c-4313-a15f-e2b45c32f5e3	5d82ed37-eb7b-47bd-b501-fd43dbc9dd40	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	REFRESH_TOKEN	\N	2026-06-24 12:04:20.37+00	\N	2026-04-25 12:35:15.251+00	2026-04-25 12:04:20.370609+00	2026-04-25 12:35:15.252376+00	\N
ec841c11-2c83-4431-bfa4-3f4faae0c557	5d82ed37-eb7b-47bd-b501-fd43dbc9dd40	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	REFRESH_TOKEN	\N	2026-06-24 12:35:15.257+00	\N	\N	2026-04-25 12:35:15.257912+00	2026-04-25 12:35:15.257912+00	\N
\.


--
-- Data for Name: application; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core.application (id, "universalIdentifier", name, description, version, "sourceType", "sourcePath", "workspaceId", "createdAt", "updatedAt", "deletedAt", "logicFunctionLayerId", "canBeUninstalled", "defaultRoleId", "packageJsonChecksum", "packageJsonFileId", "yarnLockChecksum", "yarnLockFileId", "availablePackages", "settingsCustomTabFrontComponentId", "applicationRegistrationId", "isSdkLayerStale") FROM stdin;
4a5dec44-2fb8-4d70-a6e0-6f483b222082	20202020-64aa-4b6f-b003-9c74b97cee20	Standard	\N	1.0.1	local	cli-sync	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:16.936357+00	2026-04-25 11:34:21.203476+00	\N	\N	f	\N	cce6edc8bb5046d992b51a3260b19bfe	e8874b35-e30f-4ef2-8984-266f2dab7694	3a43fee5a6d1a719a525acf8d06fa015	85c9ac99-32af-414d-8838-6e3f4ae113a0	{"psl": "1.15.0", "uuid": "10.0.0", "axios": "1.13.5", "sharp": "0.34.5", "bcrypt": "6.0.0", "winston": "3.14.2", "archiver": "7.0.1", "deep-equal": "2.2.3", "nodemailer": "8.0.4", "@types/uuid": "10.0.0", "body-parser": "1.20.4", "lodash.omit": "4.5.0", "jsonwebtoken": "9.0.2", "lodash.chunk": "4.2.0", "lodash.merge": "4.6.2", "@types/bcrypt": "6.0.0", "lodash.pickby": "4.6.0", "lodash.compact": "3.0.1", "lodash.groupby": "4.6.0", "lodash.isempty": "4.4.0", "lodash.isequal": "4.5.0", "lodash.identity": "3.0.0", "lodash.isobject": "3.0.2", "lodash.camelcase": "4.3.0", "lodash.kebabcase": "4.1.1", "lodash.mapvalues": "4.6.0", "lodash.snakecase": "4.1.1", "@types/deep-equal": "1.0.4", "lodash.upperfirst": "4.3.1", "@types/lodash.omit": "4.5.9", "@types/lodash.pickby": "4.6.9", "@types/lodash.compact": "3.0.9", "@types/lodash.groupby": "4.6.9", "@types/lodash.isempty": "4.4.9", "@types/lodash.isequal": "4.5.8", "@types/lodash.identity": "3.0.9", "@types/lodash.isobject": "3.0.9", "@types/lodash.camelcase": "4.3.9", "@types/lodash.kebabcase": "4.1.9", "@types/lodash.mapvalues": "4.6.9", "@types/lodash.snakecase": "4.1.9", "@types/lodash.upperfirst": "4.3.9"}	\N	\N	t
8c07d085-7bf4-4849-934d-3c70dcf4340d	8c07d085-7bf4-4849-934d-3c70dcf4340d	Custom	\N	1.0.1	local	workspace-custom	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:33:51.040463+00	2026-04-25 11:34:22.5014+00	\N	\N	f	\N	cce6edc8bb5046d992b51a3260b19bfe	cb03054c-380e-4c18-9339-a58fd19f2c67	3a43fee5a6d1a719a525acf8d06fa015	c67b194a-ecf0-46e7-93bd-5e8460a84aea	{"psl": "1.15.0", "uuid": "10.0.0", "axios": "1.13.5", "sharp": "0.34.5", "bcrypt": "6.0.0", "winston": "3.14.2", "archiver": "7.0.1", "deep-equal": "2.2.3", "nodemailer": "8.0.4", "@types/uuid": "10.0.0", "body-parser": "1.20.4", "lodash.omit": "4.5.0", "jsonwebtoken": "9.0.2", "lodash.chunk": "4.2.0", "lodash.merge": "4.6.2", "@types/bcrypt": "6.0.0", "lodash.pickby": "4.6.0", "lodash.compact": "3.0.1", "lodash.groupby": "4.6.0", "lodash.isempty": "4.4.0", "lodash.isequal": "4.5.0", "lodash.identity": "3.0.0", "lodash.isobject": "3.0.2", "lodash.camelcase": "4.3.0", "lodash.kebabcase": "4.1.1", "lodash.mapvalues": "4.6.0", "lodash.snakecase": "4.1.1", "@types/deep-equal": "1.0.4", "lodash.upperfirst": "4.3.1", "@types/lodash.omit": "4.5.9", "@types/lodash.pickby": "4.6.9", "@types/lodash.compact": "3.0.9", "@types/lodash.groupby": "4.6.9", "@types/lodash.isempty": "4.4.9", "@types/lodash.isequal": "4.5.8", "@types/lodash.identity": "3.0.9", "@types/lodash.isobject": "3.0.9", "@types/lodash.camelcase": "4.3.9", "@types/lodash.kebabcase": "4.1.9", "@types/lodash.mapvalues": "4.6.9", "@types/lodash.snakecase": "4.1.9", "@types/lodash.upperfirst": "4.3.9"}	\N	\N	t
\.


--
-- Data for Name: applicationRegistration; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."applicationRegistration" (id, "universalIdentifier", name, "oAuthClientId", "oAuthClientSecretHash", "oAuthRedirectUris", "oAuthScopes", "createdByUserId", "createdAt", "updatedAt", "deletedAt", "workspaceId", "sourceType", "sourcePackage", "tarballFileId", "latestAvailableVersion", "isFeatured", manifest, "isListed", "isPreInstalled") FROM stdin;
\.


--
-- Data for Name: applicationRegistrationVariable; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."applicationRegistrationVariable" (id, key, "encryptedValue", description, "isSecret", "isRequired", "applicationRegistrationId", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: applicationVariable; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."applicationVariable" (id, key, value, description, "isSecret", "applicationId", "createdAt", "updatedAt", "workspaceId") FROM stdin;
\.


--
-- Data for Name: approvedAccessDomain; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."approvedAccessDomain" (id, "createdAt", "updatedAt", domain, "isValidated", "workspaceId") FROM stdin;
\.


--
-- Data for Name: calendarChannel; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."calendarChannel" ("workspaceId", id, handle, "syncStatus", "syncStage", visibility, "isContactAutoCreationEnabled", "contactAutoCreationPolicy", "isSyncEnabled", "syncCursor", "syncedAt", "syncStageStartedAt", "throttleFailureCount", "connectedAccountId", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: commandMenuItem; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."commandMenuItem" ("workspaceId", "universalIdentifier", "applicationId", id, "workflowVersionId", label, icon, "isPinned", "availabilityType", "availabilityObjectMetadataId", "createdAt", "updatedAt", "frontComponentId", "conditionalAvailabilityExpression", "shortLabel", "position", "engineComponentKey", "hotKeys", payload, "pageLayoutId") FROM stdin;
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	3db2457d-8e96-4b8e-94c9-ed95d3f95738	4a5dec44-2fb8-4d70-a6e0-6f483b222082	5b0e9fe5-b994-4a71-a98a-970d057c13f3	\N	Navigate to next ${capitalize(objectMetadataItem.labelSingular)}	IconChevronDown	t	RECORD_SELECTION	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	pageType == "RECORD_PAGE" and not isInSidePanel	\N	1	NAVIGATE_TO_NEXT_RECORD	\N	\N	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	ec10f871-415b-420b-8150-7e09f6f04833	4a5dec44-2fb8-4d70-a6e0-6f483b222082	801e1568-9772-4320-8a54-f4ff92a37363	\N	Navigate to previous ${capitalize(objectMetadataItem.labelSingular)}	IconChevronUp	t	RECORD_SELECTION	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	pageType == "RECORD_PAGE" and not isInSidePanel	\N	2	NAVIGATE_TO_PREVIOUS_RECORD	\N	\N	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	08d255bf-58cd-47a5-bd82-78c5c58592f1	4a5dec44-2fb8-4d70-a6e0-6f483b222082	6b8e83fa-e87d-482e-ae5a-ea0e762661a3	\N	Create new ${capitalize(objectMetadataItem.labelSingular)}	IconPlus	t	GLOBAL_OBJECT_CONTEXT	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	pageType == "INDEX_PAGE" and objectPermissions.canUpdateObjectRecords and not hasAnySoftDeleteFilterOnView	New ${capitalize(objectMetadataItem.labelSingular)}	3	CREATE_NEW_RECORD	\N	\N	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	d5a55d57-ed1d-4791-89b8-53b7e121d69d	4a5dec44-2fb8-4d70-a6e0-6f483b222082	9ec63b35-0c81-44e5-a32a-1a6b14f04407	\N	Delete ${capitalize(objectMetadataLabel)}	IconTrash	f	RECORD_SELECTION	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	numberOfSelectedRecords >= 1 and not hasAnySoftDeleteFilterOnView and objectPermissions.canSoftDeleteObjectRecords and (isSelectAll or noneDefined(selectedRecords, "deletedAt"))	Delete	4	DELETE_RECORDS	\N	\N	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2d733846-8cc5-4314-ab79-916ae0801baa	4a5dec44-2fb8-4d70-a6e0-6f483b222082	34350e8e-f34d-4304-a750-74bf2c7ab929	\N	Restore ${capitalize(objectMetadataLabel)}	IconRefresh	t	RECORD_SELECTION	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	numberOfSelectedRecords >= 1 and (isSelectAll or everyDefined(selectedRecords, "deletedAt")) and objectPermissions.canSoftDeleteObjectRecords and (pageType == "RECORD_PAGE" or hasAnySoftDeleteFilterOnView)	Restore	5	RESTORE_RECORDS	\N	\N	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	0ea2ebc4-02ca-4d15-b424-5352b9e487df	4a5dec44-2fb8-4d70-a6e0-6f483b222082	12aa7bfb-1d88-440d-ab58-c1b20f4e7870	\N	Permanently destroy ${capitalize(objectMetadataLabel)}	IconTrashX	f	RECORD_SELECTION	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	numberOfSelectedRecords >= 1 and objectPermissions.canDestroyObjectRecords and (isSelectAll or everyDefined(selectedRecords, "deletedAt")) and (pageType == "RECORD_PAGE" or hasAnySoftDeleteFilterOnView)	Destroy	6	DESTROY_RECORDS	\N	\N	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	38bf80c3-bd55-4753-80ba-38aa66429a03	4a5dec44-2fb8-4d70-a6e0-6f483b222082	e9fc6e9e-503b-49b4-92a9-e2f54b295062	\N	Add to Favorites	IconHeart	t	RECORD_SELECTION	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	arrayLength(favoriteRecordIds) < numberOfSelectedRecords and noneDefined(selectedRecords, "deletedAt") and not hasAnySoftDeleteFilterOnView	\N	7	ADD_TO_FAVORITES	\N	\N	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	3ea42507-44fa-4895-a36d-cbfef7355a50	4a5dec44-2fb8-4d70-a6e0-6f483b222082	3d8595e0-ee1b-4e8a-add5-509b4ce26809	\N	Remove from Favorites	IconHeartOff	t	RECORD_SELECTION	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	arrayLength(favoriteRecordIds) == numberOfSelectedRecords and noneDefined(selectedRecords, "deletedAt") and not hasAnySoftDeleteFilterOnView	\N	8	REMOVE_FROM_FAVORITES	\N	\N	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	86c8f3aa-9276-4c16-8cff-e295e34fbaf0	4a5dec44-2fb8-4d70-a6e0-6f483b222082	ed0c764e-39de-4f9c-bf78-66734cc2e4cd	\N	Export to PDF	IconFileExport	f	RECORD_SELECTION	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	pageType == "RECORD_PAGE" and (objectMetadataItem.nameSingular == "note" or objectMetadataItem.nameSingular == "task") and someNonEmptyString(selectedRecords, "bodyV2.blocknote")	Export	9	EXPORT_NOTE_TO_PDF	\N	\N	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	c6f5c54d-d52b-4e75-8188-2190d77126f2	4a5dec44-2fb8-4d70-a6e0-6f483b222082	1bd0b7f5-d333-42b0-a567-22ec7f50c6ca	\N	Export ${capitalize(objectMetadataLabel)}	IconFileExport	f	RECORD_SELECTION	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	permissionFlags.EXPORT_CSV	Export	10	EXPORT_RECORDS	\N	\N	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2e080651-f098-4a78-bea9-7a70002dc57c	4a5dec44-2fb8-4d70-a6e0-6f483b222082	fe2036dc-7057-42aa-9c64-e35a2e109fbe	\N	Update ${capitalize(objectMetadataItem.labelPlural)}	IconEdit	t	RECORD_SELECTION	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	numberOfSelectedRecords >= 2 and objectPermissions.canUpdateObjectRecords	Update	11	UPDATE_MULTIPLE_RECORDS	\N	\N	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	6c14eb04-8e7e-4d47-93c0-8ec4834e2e60	4a5dec44-2fb8-4d70-a6e0-6f483b222082	3a78baa2-9c55-454e-958b-71ef06cc5e6f	\N	Merge ${capitalize(objectMetadataItem.labelPlural)}	IconArrowMerge	f	RECORD_SELECTION	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	not isSelectAll and numberOfSelectedRecords >= 2 and isDefined(objectMetadataItem.duplicateCriteria) and objectPermissions.canUpdateObjectRecords and objectPermissions.canDestroyObjectRecords and numberOfSelectedRecords <= 9	Merge	12	MERGE_MULTIPLE_RECORDS	\N	\N	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	a2dc9de7-4798-422e-bb55-bfad7b9bdbe8	4a5dec44-2fb8-4d70-a6e0-6f483b222082	0bd974a1-ce3f-403b-93e1-24d50fe73940	\N	Import ${capitalize(objectMetadataItem.labelPlural)}	IconFileImport	f	GLOBAL_OBJECT_CONTEXT	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	not hasAnySoftDeleteFilterOnView and permissionFlags.IMPORT_CSV	Import	13	IMPORT_RECORDS	\N	\N	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	80680f2a-c426-48b3-a839-c63a6183dc4b	4a5dec44-2fb8-4d70-a6e0-6f483b222082	fc878d89-fd9d-4ff6-b8df-4d8e864b2d65	\N	Export View	IconFileExport	f	GLOBAL_OBJECT_CONTEXT	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	permissionFlags.EXPORT_CSV	Export	14	EXPORT_VIEW	\N	\N	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	d63c21c3-9785-4750-be87-5f36269b8e0d	4a5dec44-2fb8-4d70-a6e0-6f483b222082	5e1260bb-daf5-41a0-8234-d503e3bbff77	\N	See deleted ${capitalize(objectMetadataItem.labelPlural)}	IconRotate2	f	GLOBAL_OBJECT_CONTEXT	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	not hasAnySoftDeleteFilterOnView	Deleted ${capitalize(objectMetadataItem.labelPlural)}	15	SEE_DELETED_RECORDS	\N	\N	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	6ec7c339-e167-431d-bec6-d1c737df677c	4a5dec44-2fb8-4d70-a6e0-6f483b222082	ec067c1c-6e6d-4f0a-aedb-59d94b44dc9a	\N	Create View	IconLayout	f	GLOBAL_OBJECT_CONTEXT	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	not hasAnySoftDeleteFilterOnView	Create View	16	CREATE_NEW_VIEW	\N	\N	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	1420db7f-0fba-49e2-b23e-4b7caa0fafa0	4a5dec44-2fb8-4d70-a6e0-6f483b222082	654c70bc-006b-45c9-991d-22e0c450bc68	\N	Hide deleted ${capitalize(objectMetadataItem.labelPlural)}	IconEyeOff	f	GLOBAL_OBJECT_CONTEXT	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	hasAnySoftDeleteFilterOnView	Hide deleted	17	HIDE_DELETED_RECORDS	\N	\N	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	d9794c67-1799-424f-8871-5ea771dd4a6d	4a5dec44-2fb8-4d70-a6e0-6f483b222082	86e55160-06d4-4ed5-81d0-37540d8b59c8	\N	Edit Layout	IconPencil	f	RECORD_SELECTION	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	pageType == "RECORD_PAGE" and featureFlags.IS_RECORD_PAGE_LAYOUT_EDITING_ENABLED and not isLayoutCustomizationModeEnabled and noneDefined(selectedRecords, "deletedAt") and objectPermissions.canUpdateObjectRecords and objectMetadataItem.nameSingular != "dashboard"	Edit Layout	18	EDIT_RECORD_PAGE_LAYOUT	\N	\N	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	b9b53bbc-3129-4eb9-8344-c3f9628ffa7d	4a5dec44-2fb8-4d70-a6e0-6f483b222082	4bb24e05-4d93-48fe-bbd5-8cb8947dc99d	\N	Edit Dashboard	IconPencil	t	RECORD_SELECTION	8bf7b8ba-a68b-49dc-8e9a-661cf9d528c4	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	pageType == "RECORD_PAGE" and not isDashboardPageLayoutInEditMode and not isLayoutCustomizationModeEnabled and noneDefined(selectedRecords, "deletedAt") and everyDefined(selectedRecords, "pageLayoutId") and objectPermissions.canUpdateObjectRecords	Edit	19	EDIT_DASHBOARD_LAYOUT	\N	\N	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	18b23908-f816-42ab-bc0a-eb5fae29c695	4a5dec44-2fb8-4d70-a6e0-6f483b222082	5e02d2ab-dd5a-4aeb-bd0e-d8a7b13e5797	\N	Save Dashboard	IconDeviceFloppy	t	RECORD_SELECTION	8bf7b8ba-a68b-49dc-8e9a-661cf9d528c4	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	pageType == "RECORD_PAGE" and isDashboardPageLayoutInEditMode and noneDefined(selectedRecords, "deletedAt") and everyDefined(selectedRecords, "pageLayoutId") and objectPermissions.canUpdateObjectRecords	Save	20	SAVE_DASHBOARD_LAYOUT	\N	\N	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	030ecd01-0aaf-4e6d-8400-105996548887	4a5dec44-2fb8-4d70-a6e0-6f483b222082	0a7d2bda-d292-42fe-ba08-aee897946f90	\N	Cancel Edition	IconCancel	t	RECORD_SELECTION	8bf7b8ba-a68b-49dc-8e9a-661cf9d528c4	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	pageType == "RECORD_PAGE" and isDashboardPageLayoutInEditMode and noneDefined(selectedRecords, "deletedAt") and everyDefined(selectedRecords, "pageLayoutId") and objectPermissions.canUpdateObjectRecords	Cancel	21	CANCEL_DASHBOARD_LAYOUT	\N	\N	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2ee07307-60ce-41ef-bfee-7c718f67557e	4a5dec44-2fb8-4d70-a6e0-6f483b222082	d6f3c9cd-51d3-4c12-8404-2b799b4645d7	\N	Duplicate Dashboard	IconCopyPlus	f	RECORD_SELECTION	8bf7b8ba-a68b-49dc-8e9a-661cf9d528c4	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	noneDefined(selectedRecords, "deletedAt") and objectPermissions.canUpdateObjectRecords	Duplicate	22	DUPLICATE_DASHBOARD	\N	\N	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	4feab22c-165f-4d13-81ca-c9eb6082ca50	4a5dec44-2fb8-4d70-a6e0-6f483b222082	20f4f2ac-7675-4da8-80f6-d9e36be94db4	\N	Go to Emails Settings	IconMail	f	GLOBAL	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	Emails	49	NAVIGATION	\N	{"path": "/settings/accounts/emails"}	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	3267ec0e-9dee-4d9b-8f1b-6005bfd90202	4a5dec44-2fb8-4d70-a6e0-6f483b222082	08bd97d8-cbe8-48fa-86cc-0050b6d8bd5f	\N	Go to Calendars Settings	IconCalendarEvent	f	GLOBAL	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	Calendars	50	NAVIGATION	\N	{"path": "/settings/accounts/calendars"}	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	44f19c85-0fd0-482f-a14e-da513c60b1b3	4a5dec44-2fb8-4d70-a6e0-6f483b222082	c9067f65-9c15-49bb-b97f-3da3072602d1	\N	Activate Workflow	IconPower	t	RECORD_SELECTION	0f1f4454-5436-4ddd-b99b-5426058af575	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	everyDefined(selectedRecords, "currentVersion.trigger") and everyDefined(selectedRecords, "currentVersion.steps") and every(selectedRecords, "currentVersion.steps.length") and (everyEquals(selectedRecords, "currentVersion.status", "DRAFT") or includesNone(selectedRecords, "statuses", "ACTIVE")) and noneDefined(selectedRecords, "deletedAt")	Activate	23	ACTIVATE_WORKFLOW	\N	\N	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	57f21a06-a17a-47b1-a123-90d90dbdf0b7	4a5dec44-2fb8-4d70-a6e0-6f483b222082	9b088bc2-f22c-42e5-8ef9-9c5f7e65ed03	\N	Deactivate Workflow	IconPlayerPause	t	RECORD_SELECTION	0f1f4454-5436-4ddd-b99b-5426058af575	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	everyEquals(selectedRecords, "currentVersion.status", "ACTIVE") and noneDefined(selectedRecords, "deletedAt")	Deactivate	24	DEACTIVATE_WORKFLOW	\N	\N	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	4c227f2e-03bb-4a66-9b13-49f263264f4a	4a5dec44-2fb8-4d70-a6e0-6f483b222082	8e532426-3591-42a2-8d10-1579a403f83b	\N	Discard Draft	IconNoteOff	t	RECORD_SELECTION	0f1f4454-5436-4ddd-b99b-5426058af575	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	every(selectedRecords, "versions.length") and everyEquals(selectedRecords, "currentVersion.status", "DRAFT") and noneDefined(selectedRecords, "deletedAt")	Discard Draft	25	DISCARD_DRAFT_WORKFLOW	\N	\N	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f85d552a-87a3-4667-99f7-71b47917539c	4a5dec44-2fb8-4d70-a6e0-6f483b222082	21238044-8f68-436d-8f21-3c420d0d07c3	\N	Test Workflow	IconPlayerPlay	t	RECORD_SELECTION	0f1f4454-5436-4ddd-b99b-5426058af575	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	everyDefined(selectedRecords, "currentVersion.trigger") and everyDefined(selectedRecords, "currentVersion.steps") and every(selectedRecords, "currentVersion.steps.length") and ((everyEquals(selectedRecords, "currentVersion.trigger.type", "MANUAL") and noneDefined(selectedRecords, "currentVersion.trigger.settings.objectType")) or everyEquals(selectedRecords, "currentVersion.trigger.type", "WEBHOOK") or everyEquals(selectedRecords, "currentVersion.trigger.type", "CRON")) and noneDefined(selectedRecords, "deletedAt")	Test	26	TEST_WORKFLOW	\N	\N	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	31790508-75ff-4e4c-a768-83bd1b0718e0	4a5dec44-2fb8-4d70-a6e0-6f483b222082	0d505440-b8cd-4c73-b22c-f4e726297844	\N	See Active Version	IconVersions	f	RECORD_SELECTION	0f1f4454-5436-4ddd-b99b-5426058af575	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	includesEvery(selectedRecords, "statuses", "ACTIVE") and includesEvery(selectedRecords, "statuses", "DRAFT") and noneDefined(selectedRecords, "deletedAt")	See Active Version	27	SEE_ACTIVE_VERSION_WORKFLOW	\N	\N	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	e57efc2d-00a2-493a-b76c-f2dabd23a5eb	4a5dec44-2fb8-4d70-a6e0-6f483b222082	5ae367d2-9056-4a7a-88c7-efd81077e295	\N	See Runs	IconHistoryToggle	t	RECORD_SELECTION	0f1f4454-5436-4ddd-b99b-5426058af575	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	noneDefined(selectedRecords, "deletedAt")	See Runs	28	SEE_RUNS_WORKFLOW	\N	\N	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	92781d24-b875-4282-8cdb-d127f04a5c7d	4a5dec44-2fb8-4d70-a6e0-6f483b222082	eaeaf807-232c-4f14-9d77-85be6b431185	\N	See Versions History	IconVersions	f	RECORD_SELECTION	0f1f4454-5436-4ddd-b99b-5426058af575	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	noneDefined(selectedRecords, "deletedAt")	See Versions	29	SEE_VERSIONS_WORKFLOW	\N	\N	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	818117fa-6cad-4ebc-83c1-40f4afc28d94	4a5dec44-2fb8-4d70-a6e0-6f483b222082	bea5cfea-0d8e-4b56-8dcb-a2f0ea83d8ff	\N	Add a Node	IconPlus	t	RECORD_SELECTION	0f1f4454-5436-4ddd-b99b-5426058af575	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	pageType == "RECORD_PAGE" and everyDefined(selectedRecords, "currentVersion.trigger") and everyDefined(selectedRecords, "currentVersion.steps") and every(selectedRecords, "currentVersion.steps.length") and noneDefined(selectedRecords, "deletedAt")	Add a Node	30	ADD_NODE_WORKFLOW	\N	\N	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	1f3a3cab-161a-4775-af47-11be4d0bf411	4a5dec44-2fb8-4d70-a6e0-6f483b222082	7d20153e-7592-4eed-816f-6b0d8bb74c12	\N	Tidy up Workflow	IconReorder	f	RECORD_SELECTION	0f1f4454-5436-4ddd-b99b-5426058af575	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	pageType == "RECORD_PAGE" and everyDefined(selectedRecords, "currentVersion.trigger") and everyDefined(selectedRecords, "currentVersion.steps") and every(selectedRecords, "currentVersion.steps.length") and noneDefined(selectedRecords, "deletedAt")	Tidy up	31	TIDY_UP_WORKFLOW	\N	\N	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	91094438-b4c2-46ad-a23b-8af4b23ba514	4a5dec44-2fb8-4d70-a6e0-6f483b222082	e9cc90b4-5524-4a9a-9525-121270b62550	\N	Duplicate Workflow	IconCopy	f	RECORD_SELECTION	0f1f4454-5436-4ddd-b99b-5426058af575	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	everyDefined(selectedRecords, "currentVersion") and noneDefined(selectedRecords, "deletedAt")	Duplicate	32	DUPLICATE_WORKFLOW	\N	\N	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	cc3a065c-c89e-40ac-9449-4272c55b1bb8	4a5dec44-2fb8-4d70-a6e0-6f483b222082	4fe81299-049a-4660-9803-748f190fb3bd	\N	See Version	IconVersions	t	RECORD_SELECTION	bfd36b0d-202c-430c-8f42-12ed18cb1f6a	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	See Version	33	SEE_VERSION_WORKFLOW_RUN	\N	\N	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	9d9cc62d-3543-45c3-93f3-23d2d8979f2b	4a5dec44-2fb8-4d70-a6e0-6f483b222082	3a3ca7a4-8836-408c-a034-a9366dcbe9f0	\N	See Workflow	IconSettingsAutomation	t	RECORD_SELECTION	bfd36b0d-202c-430c-8f42-12ed18cb1f6a	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	See Workflow	34	SEE_WORKFLOW_WORKFLOW_RUN	\N	\N	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	4c186606-9515-4561-a1eb-9a072b4f5e58	4a5dec44-2fb8-4d70-a6e0-6f483b222082	2881f76d-c75c-4fdd-845d-976818b20e08	\N	Stop	IconPlayerStop	t	RECORD_SELECTION	bfd36b0d-202c-430c-8f42-12ed18cb1f6a	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	isSelectAll or someEquals(selectedRecords, "status", "NOT_STARTED") or someEquals(selectedRecords, "status", "ENQUEUED") or someEquals(selectedRecords, "status", "RUNNING")	Stop	35	STOP_WORKFLOW_RUN	\N	\N	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	44e305c7-4f0a-45ec-803f-6471b56455cb	4a5dec44-2fb8-4d70-a6e0-6f483b222082	a9d55808-51e7-49d9-be20-02af91cad6e7	\N	See Runs	IconHistoryToggle	t	RECORD_SELECTION	72cb4e16-ed23-4e5a-8ed3-47fd5f979113	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	everyDefined(selectedRecords, "workflow")	See Runs	36	SEE_RUNS_WORKFLOW_VERSION	\N	\N	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	b43052db-023e-4083-9b63-2c2dfbfd1320	4a5dec44-2fb8-4d70-a6e0-6f483b222082	dfd7a937-f97c-45a1-92ad-8b12f176bc01	\N	See Workflow	IconSettingsAutomation	t	RECORD_SELECTION	72cb4e16-ed23-4e5a-8ed3-47fd5f979113	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	everyDefined(selectedRecords, "workflow.id")	See Workflow	37	SEE_WORKFLOW_WORKFLOW_VERSION	\N	\N	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	483c0c1d-ea4d-4a4d-8a59-2dcf9f8e38f6	4a5dec44-2fb8-4d70-a6e0-6f483b222082	9989a35f-bf1f-4e21-a476-47d113231e14	\N	Use as Draft	IconPencil	t	RECORD_SELECTION	72cb4e16-ed23-4e5a-8ed3-47fd5f979113	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	noneEquals(selectedRecords, "status", "DRAFT")	Use as Draft	38	USE_AS_DRAFT_WORKFLOW_VERSION	\N	\N	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	1d4abeb7-2750-4af7-9a92-fbadd2a9e4ba	4a5dec44-2fb8-4d70-a6e0-6f483b222082	c973c7b6-d89c-4455-9a1d-5e70aa4f2902	\N	See Versions History	IconVersions	f	RECORD_SELECTION	72cb4e16-ed23-4e5a-8ed3-47fd5f979113	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	everyDefined(selectedRecords, "workflow")	See Versions	39	SEE_VERSIONS_WORKFLOW_VERSION	\N	\N	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	fa24e25e-68f8-4548-82ff-c7b5168b7c7d	4a5dec44-2fb8-4d70-a6e0-6f483b222082	6fe32b9b-708a-4898-99e6-e29231bb564d	\N	Search	IconSearch	f	GLOBAL	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	Search	40	SEARCH_RECORDS	{/}	\N	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	c659890c-7266-46c9-bfe1-75cefff8b6d0	4a5dec44-2fb8-4d70-a6e0-6f483b222082	e794e056-1ee7-4223-bbc3-bc693161ba98	\N	Search	IconSearch	f	FALLBACK	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	Search	41	SEARCH_RECORDS_FALLBACK	{/}	\N	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	ce5fb54d-2b19-4dd1-b7b4-9532a1761a41	4a5dec44-2fb8-4d70-a6e0-6f483b222082	fd928b2e-314e-40df-a992-cfebb7bd26e3	\N	Ask AI	IconSparkles	f	GLOBAL	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	Ask AI	42	ASK_AI	{@}	\N	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	3084c3c9-cc23-4dad-9e00-92025f5cba7a	4a5dec44-2fb8-4d70-a6e0-6f483b222082	a9054ddd-b117-4cda-995f-c27393e2dacb	\N	View Previous AI Chats	IconHistory	f	GLOBAL	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	Previous AI Chats	43	VIEW_PREVIOUS_AI_CHATS	\N	\N	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	8f015cbd-c764-434e-a6c6-bb7581b4be44	4a5dec44-2fb8-4d70-a6e0-6f483b222082	4979bd1d-1b47-4b5c-9d94-a2b011a696fc	\N	Reply	IconArrowBackUp	t	RECORD_SELECTION	cc4a7ab5-3ba0-4ac7-9ae5-896edd7b3d25	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	numberOfSelectedRecords == 1	Reply	44	REPLY_TO_EMAIL_THREAD	\N	\N	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	96457c5a-b028-4d48-94e3-27f4c41296b8	4a5dec44-2fb8-4d70-a6e0-6f483b222082	92a95891-ed62-4576-8506-8f8fbc19fb02	\N	Compose Email	IconMail	f	GLOBAL	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	Compose	45	COMPOSE_EMAIL	\N	\N	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	ef9aba44-0068-453e-930a-f8c182af18ee	4a5dec44-2fb8-4d70-a6e0-6f483b222082	aabaef38-7b4a-4eae-9965-ac8267d7612f	\N	Go to Settings	IconSettings	f	GLOBAL	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	Settings	46	NAVIGATION	{G,S}	{"path": "/settings/profile"}	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	bceb0328-c018-48ba-80d8-a1a97dc0a8ba	4a5dec44-2fb8-4d70-a6e0-6f483b222082	8f396c72-eb9b-4a11-8995-b80aee154bc5	\N	Go to Experience Settings	IconColorSwatch	f	GLOBAL	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	Experience	47	NAVIGATION	\N	{"path": "/settings/experience"}	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	447a65cc-8535-408e-9c48-db24affb7530	4a5dec44-2fb8-4d70-a6e0-6f483b222082	b74d3b7c-a4c3-4f95-afb3-ba1d8456cff3	\N	Go to Accounts Settings	IconAt	f	GLOBAL	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	Accounts	48	NAVIGATION	\N	{"path": "/settings/accounts"}	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	ad68e516-96ea-455a-a838-c59788e88c23	4a5dec44-2fb8-4d70-a6e0-6f483b222082	7f487386-c780-4169-9502-b411fd5e8bbe	\N	Go to General Settings	IconSettings	f	GLOBAL	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	General	51	NAVIGATION	\N	{"path": "/settings/general"}	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	9302bfeb-f6cd-4858-ab5b-5f70f4d358c4	4a5dec44-2fb8-4d70-a6e0-6f483b222082	cf40b4b4-f201-445d-80b8-4d01bc60c68b	\N	Go to Data Model Settings	IconHierarchy2	f	GLOBAL	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	Data Model	52	NAVIGATION	\N	{"path": "/settings/objects"}	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	fb4d9f1b-5b13-49d9-8353-80041719d411	4a5dec44-2fb8-4d70-a6e0-6f483b222082	cf0bb54d-9e67-4766-825f-d38490e3c67a	\N	Go to Members Settings	IconUsers	f	GLOBAL	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	Members	53	NAVIGATION	\N	{"path": "/settings/members"}	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	4050f307-c592-4c9f-ad91-89cde330fbf7	4a5dec44-2fb8-4d70-a6e0-6f483b222082	71ea9339-28cd-423a-926e-c732a475c84b	\N	Go to Roles Settings	IconLock	f	GLOBAL	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	Roles	54	NAVIGATION	\N	{"path": "/settings/roles"}	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2d071684-fb5e-4222-b560-4c7ab2597fb4	4a5dec44-2fb8-4d70-a6e0-6f483b222082	9824612f-79cb-41d5-8505-6867ccd537c4	\N	Go to Domains Settings	IconWorld	f	GLOBAL	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	Domains	55	NAVIGATION	\N	{"path": "/settings/domains"}	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f46a0fb9-14e9-4d48-801d-c33bdd543f74	4a5dec44-2fb8-4d70-a6e0-6f483b222082	cb2df125-bb7d-4970-9b53-d0ec2bb83640	\N	Go to Billing Settings	IconCurrencyDollar	f	GLOBAL	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	Billing	56	NAVIGATION	\N	{"path": "/settings/billing"}	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	ed2c2fde-1e7a-4a42-ba63-221eaa7c9759	4a5dec44-2fb8-4d70-a6e0-6f483b222082	4f4c628b-323b-42d9-a1e1-f3aced702054	\N	Go to APIs & Webhooks Settings	IconApi	f	GLOBAL	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	APIs & Webhooks	57	NAVIGATION	\N	{"path": "/settings/api-webhooks"}	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	44db6d7a-79ac-485e-b3da-da8776bd7777	4a5dec44-2fb8-4d70-a6e0-6f483b222082	7d1dc2be-7d57-4e64-a5dc-f8f42d1c402c	\N	Go to Apps Settings	IconPlug	f	GLOBAL	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	Apps	58	NAVIGATION	\N	{"path": "/settings/applications"}	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	3eaec228-809d-452d-b5ef-7b777398c538	4a5dec44-2fb8-4d70-a6e0-6f483b222082	c6386a36-9a82-42fa-83d6-05abbe4cc424	\N	Go to AI Settings	IconSparkles	f	GLOBAL	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	AI	59	NAVIGATION	\N	{"path": "/settings/ai"}	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	358e69b2-0789-44e2-add7-bdef68413be8	4a5dec44-2fb8-4d70-a6e0-6f483b222082	95d97bfc-a3a4-4ad6-a11e-cf4abb51846c	\N	Go to Security Settings	IconKey	f	GLOBAL	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	Security	60	NAVIGATION	\N	{"path": "/settings/security"}	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	dd22798b-fca6-42af-ba3b-0d48f263afbd	4a5dec44-2fb8-4d70-a6e0-6f483b222082	ae965ab3-5fe1-4128-9c81-78cbd840e69c	\N	Go to Admin Panel Settings	IconServer	f	GLOBAL	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	Admin Panel	61	NAVIGATION	\N	{"path": "/settings/admin-panel"}	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	5d1ba354-0090-4a42-9a43-601461b26068	4a5dec44-2fb8-4d70-a6e0-6f483b222082	3b4f1e62-718e-40ab-93c2-4988bdccf067	\N	Go to Updates Settings	IconRocket	f	GLOBAL	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	Updates	62	NAVIGATION	\N	{"path": "/settings/updates"}	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f01d4b8b-2b4e-4ae0-9c6f-0b9a9a3e5b21	4a5dec44-2fb8-4d70-a6e0-6f483b222082	44ae9735-d55d-45b5-8f5c-5633c9f53e7a	\N	Send Email	IconMail	t	RECORD_SELECTION	f59c15d0-9a52-4e93-b44f-ed4fc4bd90be	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	numberOfSelectedRecords >= 1	Send Email	63	COMPOSE_EMAIL	\N	\N	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	a76d3ab8-4c3a-4e5d-8a4a-1f5d6e7f8a90	4a5dec44-2fb8-4d70-a6e0-6f483b222082	aa297cf4-4b13-4732-b17b-adf3ca8fec91	\N	Send Email	IconMail	t	RECORD_SELECTION	1b9bb040-2722-44d7-a5ac-4e251b541f13	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	numberOfSelectedRecords == 1	Send Email	64	COMPOSE_EMAIL	\N	\N	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	b3e7c9f2-5d6e-4f7a-8b9c-0d1e2f3a4b5c	4a5dec44-2fb8-4d70-a6e0-6f483b222082	963377c9-b599-425d-8c2c-3657f936350e	\N	Send Email	IconMail	t	RECORD_SELECTION	19d8f9ef-3d91-4bea-8281-59d7548d04da	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	numberOfSelectedRecords == 1	Send Email	65	COMPOSE_EMAIL	\N	\N	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	b4dab64d-1263-563d-b4e6-93a7ee087c1a	4a5dec44-2fb8-4d70-a6e0-6f483b222082	13a49d60-6c85-4c6a-a626-b0741ee6aa73	\N	Go to ${navigateToObjectMetadataItem.labelPlural}	${navigateToObjectMetadataItem.icon}	f	GLOBAL	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	targetObjectReadPermissions.company	${navigateToObjectMetadataItem.labelPlural}	66	NAVIGATION	{G,C}	{"objectMetadataItemId": "1b9bb040-2722-44d7-a5ac-4e251b541f13"}	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	97da2682-2baf-5011-918c-8b8e5a9e2099	4a5dec44-2fb8-4d70-a6e0-6f483b222082	0014d82e-ad0d-46fe-8144-805d0d29782e	\N	Go to ${navigateToObjectMetadataItem.labelPlural}	${navigateToObjectMetadataItem.icon}	f	GLOBAL	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	targetObjectReadPermissions.dashboard	${navigateToObjectMetadataItem.labelPlural}	67	NAVIGATION	{G,D}	{"objectMetadataItemId": "8bf7b8ba-a68b-49dc-8e9a-661cf9d528c4"}	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f112b82b-bd5f-5b5a-be76-133e6c308736	4a5dec44-2fb8-4d70-a6e0-6f483b222082	95913e2c-2c84-441c-8f82-1aeecd1fdb8b	\N	Go to ${navigateToObjectMetadataItem.labelPlural}	${navigateToObjectMetadataItem.icon}	f	GLOBAL	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	targetObjectReadPermissions.note	${navigateToObjectMetadataItem.labelPlural}	68	NAVIGATION	{G,N}	{"objectMetadataItemId": "0996fb48-437d-4a52-a0bd-098f18a09105"}	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	c416772c-d400-51c5-baa9-a142cc667544	4a5dec44-2fb8-4d70-a6e0-6f483b222082	cdccee19-f366-48b2-8427-5071f1416f00	\N	Go to ${navigateToObjectMetadataItem.labelPlural}	${navigateToObjectMetadataItem.icon}	f	GLOBAL	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	targetObjectReadPermissions.opportunity	${navigateToObjectMetadataItem.labelPlural}	69	NAVIGATION	{G,O}	{"objectMetadataItemId": "19d8f9ef-3d91-4bea-8281-59d7548d04da"}	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	95485b21-38a1-5c02-aa20-96b4e2300c2c	4a5dec44-2fb8-4d70-a6e0-6f483b222082	7508ae2a-658d-45ab-8660-32d8f8e5e44f	\N	Go to ${navigateToObjectMetadataItem.labelPlural}	${navigateToObjectMetadataItem.icon}	f	GLOBAL	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	targetObjectReadPermissions.person	${navigateToObjectMetadataItem.labelPlural}	70	NAVIGATION	{G,P}	{"objectMetadataItemId": "f59c15d0-9a52-4e93-b44f-ed4fc4bd90be"}	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	7a50b30d-d2d8-5eac-9a26-151bfedc6643	4a5dec44-2fb8-4d70-a6e0-6f483b222082	56b5759c-3040-4442-a081-585f1be5f9d7	\N	Go to ${navigateToObjectMetadataItem.labelPlural}	${navigateToObjectMetadataItem.icon}	f	GLOBAL	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	targetObjectReadPermissions.task	${navigateToObjectMetadataItem.labelPlural}	71	NAVIGATION	{G,T}	{"objectMetadataItemId": "a91a647d-4acf-456b-961b-40fbb3788c6d"}	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	b149749f-2609-520f-85b2-903723f5d4b0	4a5dec44-2fb8-4d70-a6e0-6f483b222082	97dcbd80-8825-4361-a825-71e669fe62ab	\N	Go to ${navigateToObjectMetadataItem.labelPlural}	${navigateToObjectMetadataItem.icon}	f	GLOBAL	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	targetObjectReadPermissions.workflow	${navigateToObjectMetadataItem.labelPlural}	72	NAVIGATION	{G,W}	{"objectMetadataItemId": "0f1f4454-5436-4ddd-b99b-5426058af575"}	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	6a104904-664e-5631-af54-48af837d323f	4a5dec44-2fb8-4d70-a6e0-6f483b222082	67383c60-8535-4111-bb1d-8a35beb04a45	\N	Go to ${navigateToObjectMetadataItem.labelPlural}	${navigateToObjectMetadataItem.icon}	f	GLOBAL	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	targetObjectReadPermissions.attachment	${navigateToObjectMetadataItem.labelPlural}	73	NAVIGATION	\N	{"objectMetadataItemId": "55f3cb52-620e-4800-9570-47a43ee138c5"}	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	b674e6c3-db69-5585-b25c-d8a34bc75191	4a5dec44-2fb8-4d70-a6e0-6f483b222082	aa774b2b-4296-48df-a616-bd20f5af6e6d	\N	Go to ${navigateToObjectMetadataItem.labelPlural}	${navigateToObjectMetadataItem.icon}	f	GLOBAL	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	targetObjectReadPermissions.blocklist	${navigateToObjectMetadataItem.labelPlural}	74	NAVIGATION	\N	{"objectMetadataItemId": "d7c8875d-11aa-42e2-a58a-07bb30bf96af"}	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	b5b4af45-5868-5550-a98b-a5d62bcbeb65	4a5dec44-2fb8-4d70-a6e0-6f483b222082	6999775f-2dfc-4722-8a22-4016caeb2c69	\N	Go to ${navigateToObjectMetadataItem.labelPlural}	${navigateToObjectMetadataItem.icon}	f	GLOBAL	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	targetObjectReadPermissions.calendarChannelEventAssociation	${navigateToObjectMetadataItem.labelPlural}	75	NAVIGATION	\N	{"objectMetadataItemId": "e96a74e5-e74b-47b2-a74d-e4558552dd98"}	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	625ba756-9fb4-559c-8267-26138743548e	4a5dec44-2fb8-4d70-a6e0-6f483b222082	6a83b58f-6d2d-41a8-825d-62c14acf1f32	\N	Go to ${navigateToObjectMetadataItem.labelPlural}	${navigateToObjectMetadataItem.icon}	f	GLOBAL	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	targetObjectReadPermissions.calendarChannel	${navigateToObjectMetadataItem.labelPlural}	76	NAVIGATION	\N	{"objectMetadataItemId": "6be8bb14-8b85-4a2d-ba87-40a4e6b9a586"}	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	062400eb-bc67-5857-a018-d509a1402f89	4a5dec44-2fb8-4d70-a6e0-6f483b222082	93182b60-3362-47b6-84d5-9df04481d05e	\N	Go to ${navigateToObjectMetadataItem.labelPlural}	${navigateToObjectMetadataItem.icon}	f	GLOBAL	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	targetObjectReadPermissions.calendarEventParticipant	${navigateToObjectMetadataItem.labelPlural}	77	NAVIGATION	\N	{"objectMetadataItemId": "03a73b6b-0eb4-4b17-b71f-a44968cea457"}	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	d83838b6-fca7-5cb2-b48e-8316905cba84	4a5dec44-2fb8-4d70-a6e0-6f483b222082	6bd42fcf-8345-46cb-8b58-203d4048a6d0	\N	Go to ${navigateToObjectMetadataItem.labelPlural}	${navigateToObjectMetadataItem.icon}	f	GLOBAL	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	targetObjectReadPermissions.calendarEvent	${navigateToObjectMetadataItem.labelPlural}	78	NAVIGATION	\N	{"objectMetadataItemId": "a1cedc36-00da-4425-9ea1-41ef7e522606"}	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	09782025-20a6-5fb3-b6c9-b35b1e79561b	4a5dec44-2fb8-4d70-a6e0-6f483b222082	4a802a28-6e8f-47b3-a4b1-6fbd04cf9c3a	\N	Go to ${navigateToObjectMetadataItem.labelPlural}	${navigateToObjectMetadataItem.icon}	f	GLOBAL	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	targetObjectReadPermissions.connectedAccount	${navigateToObjectMetadataItem.labelPlural}	79	NAVIGATION	\N	{"objectMetadataItemId": "45600963-91d4-4b77-8fb6-449c8e3c1f44"}	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	4dad14ed-5b5b-5cdd-acf1-1e037591c1d3	4a5dec44-2fb8-4d70-a6e0-6f483b222082	4890346d-c54d-4094-b575-a28f9aac837d	\N	Go to ${navigateToObjectMetadataItem.labelPlural}	${navigateToObjectMetadataItem.icon}	f	GLOBAL	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	targetObjectReadPermissions.messageChannelMessageAssociation	${navigateToObjectMetadataItem.labelPlural}	80	NAVIGATION	\N	{"objectMetadataItemId": "254569df-6932-4d1b-abcd-cb0f250b72ed"}	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	d76c8490-7671-59b8-a110-d9e448156b2d	4a5dec44-2fb8-4d70-a6e0-6f483b222082	a54f1b7c-e9f4-48df-9b87-19696fb91df5	\N	Go to ${navigateToObjectMetadataItem.labelPlural}	${navigateToObjectMetadataItem.icon}	f	GLOBAL	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	targetObjectReadPermissions.messageChannel	${navigateToObjectMetadataItem.labelPlural}	81	NAVIGATION	\N	{"objectMetadataItemId": "711ed2e9-cc32-45af-ba39-7066034c618e"}	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	b7bfef7c-0951-5e55-a452-fbf7ee75dbda	4a5dec44-2fb8-4d70-a6e0-6f483b222082	16824dcb-7c54-4648-a7a6-8c74bc5394c8	\N	Go to ${navigateToObjectMetadataItem.labelPlural}	${navigateToObjectMetadataItem.icon}	f	GLOBAL	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	targetObjectReadPermissions.messageFolder	${navigateToObjectMetadataItem.labelPlural}	82	NAVIGATION	\N	{"objectMetadataItemId": "e48dd522-875c-4937-9d9b-3a41a8cb0f1e"}	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	ad215c32-43e0-5549-a1c9-016e20373129	4a5dec44-2fb8-4d70-a6e0-6f483b222082	6d20b9e7-9bfc-4bd5-a440-f5c8a4f7a233	\N	Go to ${navigateToObjectMetadataItem.labelPlural}	${navigateToObjectMetadataItem.icon}	f	GLOBAL	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	targetObjectReadPermissions.messageChannelMessageAssociationMessageFolder	${navigateToObjectMetadataItem.labelPlural}	83	NAVIGATION	\N	{"objectMetadataItemId": "b03dcd32-17eb-4bd2-b529-7e0bbc7d4cdd"}	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	495fd766-dcce-5970-b2e5-e882c17531c8	4a5dec44-2fb8-4d70-a6e0-6f483b222082	5ad81383-e772-4133-9273-b48ea1d1972e	\N	Go to ${navigateToObjectMetadataItem.labelPlural}	${navigateToObjectMetadataItem.icon}	f	GLOBAL	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	targetObjectReadPermissions.messageParticipant	${navigateToObjectMetadataItem.labelPlural}	84	NAVIGATION	\N	{"objectMetadataItemId": "ee0c23a3-0eb3-4d06-9b63-e89466584e21"}	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	ceed2c22-76b8-5882-94ba-c45fd88b548a	4a5dec44-2fb8-4d70-a6e0-6f483b222082	26017fc0-471f-48bc-bffb-419f676380e1	\N	Go to ${navigateToObjectMetadataItem.labelPlural}	${navigateToObjectMetadataItem.icon}	f	GLOBAL	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	targetObjectReadPermissions.messageThread	${navigateToObjectMetadataItem.labelPlural}	85	NAVIGATION	\N	{"objectMetadataItemId": "cc4a7ab5-3ba0-4ac7-9ae5-896edd7b3d25"}	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	e4bb3c80-41ba-5ee2-ab31-bfc69bf97a72	4a5dec44-2fb8-4d70-a6e0-6f483b222082	576b6aaf-d09f-4e39-8d6f-315949b8dedc	\N	Go to ${navigateToObjectMetadataItem.labelPlural}	${navigateToObjectMetadataItem.icon}	f	GLOBAL	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	targetObjectReadPermissions.message	${navigateToObjectMetadataItem.labelPlural}	86	NAVIGATION	\N	{"objectMetadataItemId": "8e627e4e-e9cf-4890-af92-46559fb5f36e"}	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	96956fd7-ca2d-572b-884c-c7d084bff8b8	4a5dec44-2fb8-4d70-a6e0-6f483b222082	ca778802-aceb-4ee8-97fb-48ff5fdabf9d	\N	Go to ${navigateToObjectMetadataItem.labelPlural}	${navigateToObjectMetadataItem.icon}	f	GLOBAL	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	targetObjectReadPermissions.noteTarget	${navigateToObjectMetadataItem.labelPlural}	87	NAVIGATION	\N	{"objectMetadataItemId": "2f8e7625-5a41-40dd-be67-29f99a4dc30e"}	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	098965ee-3051-54ab-8c7e-b1aa9b0f6593	4a5dec44-2fb8-4d70-a6e0-6f483b222082	4ff0be60-8157-4f85-8049-22045045176b	\N	Go to ${navigateToObjectMetadataItem.labelPlural}	${navigateToObjectMetadataItem.icon}	f	GLOBAL	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	targetObjectReadPermissions.taskTarget	${navigateToObjectMetadataItem.labelPlural}	88	NAVIGATION	\N	{"objectMetadataItemId": "5277c856-9ccc-41e4-ae01-f077f1c61574"}	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	fb77207c-1834-593c-9b99-c8c58cce3d70	4a5dec44-2fb8-4d70-a6e0-6f483b222082	1b62b2e7-795e-4c54-94bb-d12fb8769f91	\N	Go to ${navigateToObjectMetadataItem.labelPlural}	${navigateToObjectMetadataItem.icon}	f	GLOBAL	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	targetObjectReadPermissions.timelineActivity	${navigateToObjectMetadataItem.labelPlural}	89	NAVIGATION	\N	{"objectMetadataItemId": "22213a4b-0696-4b0b-90e1-975e86ba2902"}	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	762ac05c-ffb2-555e-9d35-2f28037f6694	4a5dec44-2fb8-4d70-a6e0-6f483b222082	450b98a0-d7d4-4028-8c14-608f216bf07b	\N	Go to ${navigateToObjectMetadataItem.labelPlural}	${navigateToObjectMetadataItem.icon}	f	GLOBAL	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	targetObjectReadPermissions.workflowAutomatedTrigger	${navigateToObjectMetadataItem.labelPlural}	90	NAVIGATION	\N	{"objectMetadataItemId": "c407d619-2c05-491f-b2fd-b9481d652bc9"}	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f675c9b5-692f-5584-b7bb-80ca3eb3f891	4a5dec44-2fb8-4d70-a6e0-6f483b222082	b07cec61-ff69-40e1-90d3-f43d811dd331	\N	Go to ${navigateToObjectMetadataItem.labelPlural}	${navigateToObjectMetadataItem.icon}	f	GLOBAL	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	targetObjectReadPermissions.workflowRun	${navigateToObjectMetadataItem.labelPlural}	91	NAVIGATION	\N	{"objectMetadataItemId": "bfd36b0d-202c-430c-8f42-12ed18cb1f6a"}	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	b2c49d27-cfce-5b35-b712-61f925ab4298	4a5dec44-2fb8-4d70-a6e0-6f483b222082	7c4acb93-d065-493d-9123-b3440684056e	\N	Go to ${navigateToObjectMetadataItem.labelPlural}	${navigateToObjectMetadataItem.icon}	f	GLOBAL	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	targetObjectReadPermissions.workflowVersion	${navigateToObjectMetadataItem.labelPlural}	92	NAVIGATION	\N	{"objectMetadataItemId": "72cb4e16-ed23-4e5a-8ed3-47fd5f979113"}	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	a037882d-5ade-5abe-af71-2a73a6497fd9	4a5dec44-2fb8-4d70-a6e0-6f483b222082	8592b11e-7acd-477d-9296-6f8a2f468a0a	\N	Go to ${navigateToObjectMetadataItem.labelPlural}	${navigateToObjectMetadataItem.icon}	f	GLOBAL	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	targetObjectReadPermissions.workspaceMember	${navigateToObjectMetadataItem.labelPlural}	93	NAVIGATION	\N	{"objectMetadataItemId": "0286cdc7-a914-4a77-9afa-1fd5831fcb59"}	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	5b389a80-345f-42b5-83fa-2e6b6ad95f01	8c07d085-7bf4-4849-934d-3c70dcf4340d	d54b172d-9137-4cd0-93b4-62fd91834409	ac67974f-c524-4288-9d88-af8515400b68	Quick Lead	IconUserPlus	f	GLOBAL	\N	2026-04-25 11:34:19.097+00	2026-04-25 11:34:19.097+00	\N	\N	Quick Lead	100	TRIGGER_WORKFLOW_VERSION	\N	\N	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	6410af35-6001-5c83-9543-cbac0d8ed221	4a5dec44-2fb8-4d70-a6e0-6f483b222082	3d407725-6223-42bc-9cdf-28671e7d9f6e	\N	Go to ${navigateToObjectMetadataItem.labelPlural}	${navigateToObjectMetadataItem.icon}	f	GLOBAL	\N	2026-04-25 12:15:04.229+00	2026-04-25 12:15:04.229+00	\N	targetObjectReadPermissions.habit	${navigateToObjectMetadataItem.labelPlural}	102	NAVIGATION	\N	{"objectMetadataItemId": "a64cec42-2523-4102-b0d6-fdbb2f937bb6"}	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	cc722929-b96a-5d61-9749-61cd0bd1a1db	4a5dec44-2fb8-4d70-a6e0-6f483b222082	61314882-855c-4201-91b8-90b383d9da19	\N	Go to ${navigateToObjectMetadataItem.labelPlural}	${navigateToObjectMetadataItem.icon}	f	GLOBAL	\N	2026-04-25 12:25:53.067+00	2026-04-25 12:25:53.067+00	\N	targetObjectReadPermissions.habitLog	${navigateToObjectMetadataItem.labelPlural}	103	NAVIGATION	\N	{"objectMetadataItemId": "185d031c-a8d4-42b4-b9b8-55a8e1c6e608"}	\N
\.


--
-- Data for Name: connectedAccount; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."connectedAccount" ("workspaceId", id, handle, provider, "accessToken", "refreshToken", "lastCredentialsRefreshedAt", "authFailedAt", "handleAliases", scopes, "connectionParameters", "lastSignedInAt", "oidcTokenClaims", "userWorkspaceId", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: dataSource; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."dataSource" (id, label, url, schema, type, "isRemote", "workspaceId", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: emailingDomain; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."emailingDomain" (id, "createdAt", "updatedAt", domain, driver, status, "verificationRecords", "verifiedAt", "workspaceId") FROM stdin;
\.


--
-- Data for Name: featureFlag; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."featureFlag" (id, key, "workspaceId", value, "createdAt", "updatedAt") FROM stdin;
17c2cb37-ccd3-4a55-b422-c8e9a23fda70	IS_RECORD_PAGE_LAYOUT_GLOBAL_EDITION_ENABLED	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	t	2026-04-25 11:34:18.907358+00	2026-04-25 11:34:18.907358+00
52c9a5bd-75cc-4dcd-8683-915a678c38fb	IS_RECORD_PAGE_LAYOUT_EDITING_ENABLED	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	t	2026-04-25 11:34:18.907358+00	2026-04-25 11:34:18.907358+00
\.


--
-- Data for Name: fieldMetadata; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."fieldMetadata" (id, "objectMetadataId", type, name, label, "defaultValue", description, icon, "standardOverrides", options, settings, "isCustom", "isActive", "isSystem", "isUIReadOnly", "isNullable", "isUnique", "workspaceId", "isLabelSyncedWithName", "relationTargetFieldMetadataId", "relationTargetObjectMetadataId", "morphId", "createdAt", "updatedAt", "universalIdentifier", "applicationId") FROM stdin;
5ce75c71-d9d2-4c44-a4fb-1434b1f4c31d	55f3cb52-620e-4800-9570-47a43ee138c5	UUID	id	Id	"uuid"	Id	Icon123	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-a01a-4001-8a01-1d5f8e3c7b2a	4a5dec44-2fb8-4d70-a6e0-6f483b222082
e59f883e-cb64-4a58-b5b0-61adad2ca808	55f3cb52-620e-4800-9570-47a43ee138c5	DATE_TIME	createdAt	Creation date	"now"	Creation date	IconCalendar	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-a01b-4002-9b02-2e6f9f4d8c3b	4a5dec44-2fb8-4d70-a6e0-6f483b222082
ad552e15-ca41-48cb-8d69-39f3d9a39555	55f3cb52-620e-4800-9570-47a43ee138c5	DATE_TIME	updatedAt	Last update	"now"	Last time the record was changed	IconCalendarClock	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-a01c-4003-8c03-3f7fa05d9d4c	4a5dec44-2fb8-4d70-a6e0-6f483b222082
e6e61810-a928-4747-9a29-94c37075ec06	55f3cb52-620e-4800-9570-47a43ee138c5	DATE_TIME	deletedAt	Deleted at	\N	Date when the record was deleted	IconCalendarMinus	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-a01d-4004-9d04-4f8fb16eae5d	4a5dec44-2fb8-4d70-a6e0-6f483b222082
a748e36c-e180-4d65-9b88-2490b949256f	55f3cb52-620e-4800-9570-47a43ee138c5	TEXT	name	Name	\N	Attachment name	IconFileUpload	\N	\N	\N	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-87a5-48f8-bbf7-ade388825a57	4a5dec44-2fb8-4d70-a6e0-6f483b222082
730e7e73-9050-4eb5-8e99-4912a1960a5c	55f3cb52-620e-4800-9570-47a43ee138c5	FILES	file	File	\N	Attachment file	IconFileUpload	\N	\N	{"maxNumberOfValues": 1}	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-15db-460e-8166-c7b5d87ad4be	4a5dec44-2fb8-4d70-a6e0-6f483b222082
4ace9d51-cfd9-44e7-aecb-6067487dfcdf	55f3cb52-620e-4800-9570-47a43ee138c5	TEXT	fullPath	Full path	\N	Attachment full path	IconLink	\N	\N	\N	f	t	t	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-0d19-453d-8e8d-fbcda8ca3747	4a5dec44-2fb8-4d70-a6e0-6f483b222082
72c59d9f-4116-4122-ab71-eb6d03e53d66	55f3cb52-620e-4800-9570-47a43ee138c5	SELECT	fileCategory	File category	"'OTHER'"	Attachment file category	IconList	\N	[{"id": "20202020-11bb-4a52-b1f2-2159b07eec37", "color": "gray", "label": "Archive", "value": "ARCHIVE", "position": 0}, {"id": "20202020-ac54-475d-ab0d-e250c28da774", "color": "pink", "label": "Audio", "value": "AUDIO", "position": 1}, {"id": "20202020-66f7-41ba-81ad-f3371312247f", "color": "yellow", "label": "Image", "value": "IMAGE", "position": 2}, {"id": "20202020-6113-4e3b-84e3-c617e9f25d0c", "color": "orange", "label": "Presentation", "value": "PRESENTATION", "position": 3}, {"id": "20202020-44c1-47c7-8e66-e63558d7233f", "color": "turquoise", "label": "Spreadsheet", "value": "SPREADSHEET", "position": 4}, {"id": "20202020-cf07-4843-877e-3804cde801d1", "color": "blue", "label": "Text Document", "value": "TEXT_DOCUMENT", "position": 5}, {"id": "20202020-443b-4159-a434-5fd9fc327639", "color": "purple", "label": "Video", "value": "VIDEO", "position": 6}, {"id": "20202020-bbca-4802-9146-fd1503e94e58", "color": "gray", "label": "Other", "value": "OTHER", "position": 7}]	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-8c3f-4d9e-9a1b-2e5f7a8c9d0e	4a5dec44-2fb8-4d70-a6e0-6f483b222082
8f1650e2-155e-4e24-9c02-b0247f159cee	55f3cb52-620e-4800-9570-47a43ee138c5	ACTOR	createdBy	Created by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The creator of the record	IconCreativeCommonsSa	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	395be3bd-a5c9-463d-aafe-9bc3bbec3f15	4a5dec44-2fb8-4d70-a6e0-6f483b222082
d10c3dee-b847-4b5d-91c4-570c150db0b5	55f3cb52-620e-4800-9570-47a43ee138c5	ACTOR	updatedBy	Updated by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The workspace member who last updated the record	IconUserCircle	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	376239d1-3e65-4cb6-b5d8-e0917d43cc93	4a5dec44-2fb8-4d70-a6e0-6f483b222082
b343127e-7c80-49f3-a993-66e6a9794fc9	55f3cb52-620e-4800-9570-47a43ee138c5	POSITION	position	Position	0	Attachment record position	IconHierarchy2	\N	\N	\N	f	t	t	f	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	cef8f62c-cd46-4444-8cbb-17d463b7464a	4a5dec44-2fb8-4d70-a6e0-6f483b222082
73c04730-0234-4cda-9ec4-07f120813d9f	55f3cb52-620e-4800-9570-47a43ee138c5	TS_VECTOR	searchVector	Search vector	\N	Field used for full-text search	IconUser	\N	\N	{"asExpression": "to_tsvector('simple', COALESCE(public.unaccent_immutable(\\"name\\"), ''))", "generatedType": "STORED"}	f	t	t	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	e7b42835-cb2e-4456-8558-9225362aa52d	4a5dec44-2fb8-4d70-a6e0-6f483b222082
025a7b83-deaa-4e21-8c01-3b109aa5e936	d7c8875d-11aa-42e2-a58a-07bb30bf96af	UUID	id	Id	"uuid"	Id	Icon123	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-b01a-4011-8b11-5a9fc27fbf6e	4a5dec44-2fb8-4d70-a6e0-6f483b222082
c741b586-df46-4a1b-a1d9-c9e3abd387dc	d7c8875d-11aa-42e2-a58a-07bb30bf96af	DATE_TIME	createdAt	Creation date	"now"	Creation date	IconCalendar	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-b01b-4012-9c12-6bafd38fcf7f	4a5dec44-2fb8-4d70-a6e0-6f483b222082
ed25070e-2289-4f45-bb15-c267a11ead5e	d7c8875d-11aa-42e2-a58a-07bb30bf96af	DATE_TIME	updatedAt	Last update	"now"	Last time the record was changed	IconCalendarClock	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-b01c-4013-8d13-7cbfe49fdf8f	4a5dec44-2fb8-4d70-a6e0-6f483b222082
28ff820d-728d-4cef-b990-ec65151606b5	d7c8875d-11aa-42e2-a58a-07bb30bf96af	DATE_TIME	deletedAt	Deleted at	\N	Date when the record was deleted	IconCalendarMinus	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-b01d-4014-9e14-8dcff5affef9	4a5dec44-2fb8-4d70-a6e0-6f483b222082
355f85b0-0eb3-4c90-8346-538b99c494d8	d7c8875d-11aa-42e2-a58a-07bb30bf96af	ACTOR	createdBy	Created by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The creator of the record	IconCreativeCommonsSa	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	b80db15d-8dc2-4f47-a072-15030941a9d1	4a5dec44-2fb8-4d70-a6e0-6f483b222082
2e36cbd9-8c57-4f50-b817-9479c0adf529	d7c8875d-11aa-42e2-a58a-07bb30bf96af	ACTOR	updatedBy	Updated by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The workspace member who last updated the record	IconUserCircle	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	11aaa404-f04b-421d-a451-c453bf77cc78	4a5dec44-2fb8-4d70-a6e0-6f483b222082
aa289b16-2ede-4ad3-bc2a-3b4378e97ae1	d7c8875d-11aa-42e2-a58a-07bb30bf96af	POSITION	position	Position	0	Blocklist record position	IconHierarchy2	\N	\N	\N	f	t	t	f	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	72a27e60-3542-46dc-90db-684d79bd7f11	4a5dec44-2fb8-4d70-a6e0-6f483b222082
ec9f1456-7865-4e2e-9378-60308c4a313f	d7c8875d-11aa-42e2-a58a-07bb30bf96af	TS_VECTOR	searchVector	Search vector	\N	Field used for full-text search	IconUser	\N	\N	{"asExpression": "to_tsvector('simple', COALESCE(public.unaccent_immutable(\\"handle\\"), ''))", "generatedType": "STORED"}	f	t	t	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	5fa758da-30b4-412e-8a4f-975f2848ce60	4a5dec44-2fb8-4d70-a6e0-6f483b222082
0a86787e-385e-48ea-a8f2-4b4d7416edd4	d7c8875d-11aa-42e2-a58a-07bb30bf96af	TEXT	handle	Handle	\N	Handle	IconAt	\N	\N	\N	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-eef3-44ed-aa32-4641d7fd4a3e	4a5dec44-2fb8-4d70-a6e0-6f483b222082
b6166483-79e3-42e9-9c91-344d35a1ee36	e96a74e5-e74b-47b2-a74d-e4558552dd98	UUID	id	Id	"uuid"	Id	Icon123	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-c01a-4021-8a21-9edf06bfef0a	4a5dec44-2fb8-4d70-a6e0-6f483b222082
dd94bd25-bc8d-44d2-af29-f01541e9ac3d	e96a74e5-e74b-47b2-a74d-e4558552dd98	DATE_TIME	createdAt	Creation date	"now"	Creation date	IconCalendar	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-c01b-4022-9b22-afefd7cffefb	4a5dec44-2fb8-4d70-a6e0-6f483b222082
32f3ad11-3d5f-4554-8054-9759e3db00a9	e96a74e5-e74b-47b2-a74d-e4558552dd98	DATE_TIME	updatedAt	Last update	"now"	Last time the record was changed	IconCalendarClock	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-c01c-4023-8c23-bffef8dffef0	4a5dec44-2fb8-4d70-a6e0-6f483b222082
3004388d-f949-4cc2-acf4-79dc8bfb3931	e96a74e5-e74b-47b2-a74d-e4558552dd98	DATE_TIME	deletedAt	Deleted at	\N	Date when the record was deleted	IconCalendarMinus	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-c01d-4024-9d24-cffef9effef1	4a5dec44-2fb8-4d70-a6e0-6f483b222082
d1f077d1-485e-4dc1-87b6-3b229a845da0	e96a74e5-e74b-47b2-a74d-e4558552dd98	ACTOR	createdBy	Created by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The creator of the record	IconCreativeCommonsSa	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	8daa2bc8-bce2-4309-8a48-b929f3ee2c34	4a5dec44-2fb8-4d70-a6e0-6f483b222082
cc562ff1-305b-436e-baec-89796e6f8be0	e96a74e5-e74b-47b2-a74d-e4558552dd98	ACTOR	updatedBy	Updated by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The workspace member who last updated the record	IconUserCircle	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	55d810d2-fe47-44b4-b1de-b9c32113b695	4a5dec44-2fb8-4d70-a6e0-6f483b222082
81bbdadd-9b08-466b-98ca-ed9b412fc534	8e627e4e-e9cf-4890-af92-46559fb5f36e	TEXT	text	Text	\N	Text	IconMessage	\N	\N	\N	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-d2ee-4e7e-89de-9a0a9044a143	4a5dec44-2fb8-4d70-a6e0-6f483b222082
e871adf7-31d1-47ee-98af-5524ee58f1df	e96a74e5-e74b-47b2-a74d-e4558552dd98	POSITION	position	Position	0	Calendar channel event association record position	IconHierarchy2	\N	\N	\N	f	t	t	f	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	4fa18346-bb2b-49b0-ab35-23df86eed1c8	4a5dec44-2fb8-4d70-a6e0-6f483b222082
aadc2e8d-72f6-4d4e-8169-8f45c10c873e	e96a74e5-e74b-47b2-a74d-e4558552dd98	TS_VECTOR	searchVector	Search vector	\N	Field used for full-text search	IconUser	\N	\N	{"asExpression": "to_tsvector('simple', COALESCE(public.unaccent_immutable(\\"eventExternalId\\"), ''))", "generatedType": "STORED"}	f	t	t	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	1844a9cf-6d35-46d7-99ba-011626a6d71b	4a5dec44-2fb8-4d70-a6e0-6f483b222082
aa6b1911-3edf-4798-bab6-a74002f8c502	e96a74e5-e74b-47b2-a74d-e4558552dd98	TEXT	eventExternalId	Event external ID	\N	Event external ID	IconCalendar	\N	\N	\N	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-9ec8-48bb-b279-21d0734a75a1	4a5dec44-2fb8-4d70-a6e0-6f483b222082
d372c672-a8c2-4c1e-9f65-a63d7596b99f	e96a74e5-e74b-47b2-a74d-e4558552dd98	TEXT	recurringEventExternalId	Recurring Event ID	\N	Recurring Event ID	IconHistory	\N	\N	\N	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-c58f-4c69-9bf8-9518fa31aa50	4a5dec44-2fb8-4d70-a6e0-6f483b222082
70ca63da-16cd-478f-9c18-7650083fe012	e96a74e5-e74b-47b2-a74d-e4558552dd98	UUID	calendarChannelId	Channel ID	\N	Channel ID	IconCalendar	\N	\N	\N	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-93ee-4da4-8d58-0282c4a9cb7d	4a5dec44-2fb8-4d70-a6e0-6f483b222082
421ad312-af7c-4f9d-b239-34ff69437427	6be8bb14-8b85-4a2d-ba87-40a4e6b9a586	UUID	id	Id	"uuid"	Id	Icon123	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-c02a-4031-8a31-1a2f3b4c5d6e	4a5dec44-2fb8-4d70-a6e0-6f483b222082
7e121cfe-c31b-4d2f-b6fc-f84fc3372804	6be8bb14-8b85-4a2d-ba87-40a4e6b9a586	DATE_TIME	createdAt	Creation date	"now"	Creation date	IconCalendar	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-c02b-4032-9b32-2b3f4c5d6e7f	4a5dec44-2fb8-4d70-a6e0-6f483b222082
d61471eb-6337-4808-b461-a47fbddc1ef2	6be8bb14-8b85-4a2d-ba87-40a4e6b9a586	DATE_TIME	updatedAt	Last update	"now"	Last time the record was changed	IconCalendarClock	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-c02c-4033-8c33-3c4f5d6e7f8a	4a5dec44-2fb8-4d70-a6e0-6f483b222082
a0458f2d-dc88-4335-8d11-940d0f76612f	6be8bb14-8b85-4a2d-ba87-40a4e6b9a586	DATE_TIME	deletedAt	Deleted at	\N	Date when the record was deleted	IconCalendarMinus	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-c02d-4034-9d34-4d5f6e7f8a9b	4a5dec44-2fb8-4d70-a6e0-6f483b222082
812498c0-1850-475f-a8f8-fff708a6e443	6be8bb14-8b85-4a2d-ba87-40a4e6b9a586	ACTOR	createdBy	Created by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The creator of the record	IconCreativeCommonsSa	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	664db1a0-76f4-4429-8452-f8e250ab7545	4a5dec44-2fb8-4d70-a6e0-6f483b222082
bdb0c952-d485-4baf-8c03-76aac524eac1	6be8bb14-8b85-4a2d-ba87-40a4e6b9a586	ACTOR	updatedBy	Updated by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The workspace member who last updated the record	IconUserCircle	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	6a397eab-3700-4b08-9eb9-d16b61876193	4a5dec44-2fb8-4d70-a6e0-6f483b222082
3a98bd1b-c9c9-4b12-b5b3-f58c55d6b1f5	6be8bb14-8b85-4a2d-ba87-40a4e6b9a586	POSITION	position	Position	0	Calendar channel record position	IconHierarchy2	\N	\N	\N	f	t	t	f	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	566609c9-1c8b-4899-91bb-0af140a89004	4a5dec44-2fb8-4d70-a6e0-6f483b222082
70c4dd32-e10b-465e-af26-9a2d73b45ec7	6be8bb14-8b85-4a2d-ba87-40a4e6b9a586	TS_VECTOR	searchVector	Search vector	\N	Field used for full-text search	IconUser	\N	\N	{"asExpression": "to_tsvector('simple', COALESCE(public.unaccent_immutable(\\"handle\\"), ''))", "generatedType": "STORED"}	f	t	t	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	bc9a982c-c314-49d6-818a-2661ce7e918f	4a5dec44-2fb8-4d70-a6e0-6f483b222082
bf6b952d-9fbd-471b-97c1-235fd7ce1f59	6be8bb14-8b85-4a2d-ba87-40a4e6b9a586	TEXT	handle	Handle	\N	Handle	IconAt	\N	\N	\N	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-1d08-420a-9aa7-22e0f298232d	4a5dec44-2fb8-4d70-a6e0-6f483b222082
8b331146-8ea4-4564-b124-2431e1e55848	6be8bb14-8b85-4a2d-ba87-40a4e6b9a586	SELECT	visibility	Visibility	"'SHARE_EVERYTHING'"	Visibility	IconEyeglass	\N	[{"id": "20202020-82a0-4859-b356-f5a1d6e3e53d", "color": "green", "label": "Metadata", "value": "METADATA", "position": 0}, {"id": "20202020-e5ec-4df5-ba3f-66ca2a79c283", "color": "orange", "label": "Share Everything", "value": "SHARE_EVERYTHING", "position": 1}]	\N	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-1b07-4796-9f01-d626bab7ca4d	4a5dec44-2fb8-4d70-a6e0-6f483b222082
636c10ae-9cef-44a4-b5da-61c71ef79afc	6be8bb14-8b85-4a2d-ba87-40a4e6b9a586	BOOLEAN	isContactAutoCreationEnabled	Is Contact Auto Creation Enabled	true	Is Contact Auto Creation Enabled	IconUserCircle	\N	\N	\N	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-50fb-404b-ba28-369911a3793a	4a5dec44-2fb8-4d70-a6e0-6f483b222082
bb56b381-b56b-4cec-b564-fa51eaf2f503	6be8bb14-8b85-4a2d-ba87-40a4e6b9a586	SELECT	contactAutoCreationPolicy	Contact auto creation policy	"'AS_PARTICIPANT_AND_ORGANIZER'"	Automatically create records for people you participated with in an event.	IconUserCircle	\N	[{"id": "20202020-47c1-4af1-a8a6-540edeafc55e", "color": "green", "label": "As Participant and Organizer", "value": "AS_PARTICIPANT_AND_ORGANIZER", "position": 0}, {"id": "20202020-b3cc-4248-b0d1-c8d45c2418b3", "color": "orange", "label": "As Participant", "value": "AS_PARTICIPANT", "position": 1}, {"id": "20202020-84ef-4061-9c22-db596e237ddc", "color": "blue", "label": "As Organizer", "value": "AS_ORGANIZER", "position": 2}, {"id": "20202020-f170-491f-9597-0e5817e46c17", "color": "red", "label": "None", "value": "NONE", "position": 3}]	\N	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-b55d-447d-b4df-226319058775	4a5dec44-2fb8-4d70-a6e0-6f483b222082
f356d42e-293f-4c44-b99a-0ec804606349	6be8bb14-8b85-4a2d-ba87-40a4e6b9a586	BOOLEAN	isSyncEnabled	Is Sync Enabled	true	Is Sync Enabled	IconRefresh	\N	\N	\N	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-fe19-4818-8854-21f7b1b43395	4a5dec44-2fb8-4d70-a6e0-6f483b222082
e1717582-81a6-46ba-9288-5cace1f67211	6be8bb14-8b85-4a2d-ba87-40a4e6b9a586	TEXT	syncCursor	Sync Cursor	\N	Sync Cursor. Used for syncing events from the calendar provider	IconReload	\N	\N	\N	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-bac2-4852-a5cb-7a7898992b70	4a5dec44-2fb8-4d70-a6e0-6f483b222082
737febbd-8d29-4075-8e50-3da6fab4e4b0	6be8bb14-8b85-4a2d-ba87-40a4e6b9a586	SELECT	syncStatus	Sync status	\N	Sync status	IconStatusChange	\N	[{"id": "20202020-ebdc-4fc8-a5c1-4bc6a90fdc3c", "color": "yellow", "label": "Ongoing", "value": "ONGOING", "position": 1}, {"id": "20202020-7126-4c26-9940-f5807ed87266", "color": "blue", "label": "Not Synced", "value": "NOT_SYNCED", "position": 2}, {"id": "20202020-0302-4201-bf84-aaa26b7ca94e", "color": "green", "label": "Active", "value": "ACTIVE", "position": 3}, {"id": "20202020-6dbb-449d-96b0-092189010f42", "color": "red", "label": "Failed Insufficient Permissions", "value": "FAILED_INSUFFICIENT_PERMISSIONS", "position": 4}, {"id": "20202020-935c-4333-a614-f49ee2ec6aa7", "color": "red", "label": "Failed Unknown", "value": "FAILED_UNKNOWN", "position": 5}]	\N	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-7116-41da-8b4b-035975c4eb6a	4a5dec44-2fb8-4d70-a6e0-6f483b222082
ab212853-2b50-41f4-8bf5-f0e9557af5c3	a1cedc36-00da-4425-9ea1-41ef7e522606	BOOLEAN	isCanceled	Is canceled	false	Is canceled	IconCalendarCancel	\N	\N	\N	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-335b-4e04-b470-43b84b64863c	4a5dec44-2fb8-4d70-a6e0-6f483b222082
857cc27d-9e40-4f03-8bf0-2f89e78697b9	a1cedc36-00da-4425-9ea1-41ef7e522606	BOOLEAN	isFullDay	Is Full Day	false	Is Full Day	IconHours24	\N	\N	\N	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-551c-402c-bb6d-dfe9efe86bcb	4a5dec44-2fb8-4d70-a6e0-6f483b222082
7d59f9a7-27da-4095-bc26-1d48fc9e628b	a1cedc36-00da-4425-9ea1-41ef7e522606	DATE_TIME	startsAt	Start Date	\N	Start Date	IconCalendarClock	\N	\N	\N	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-2c57-4c75-93c5-2ac950a6ed67	4a5dec44-2fb8-4d70-a6e0-6f483b222082
dc8acf7b-891e-4aa4-86f2-28f9bc44757d	a1cedc36-00da-4425-9ea1-41ef7e522606	DATE_TIME	endsAt	End Date	\N	End Date	IconCalendarClock	\N	\N	\N	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-2554-4ee1-a617-17907f6bab21	4a5dec44-2fb8-4d70-a6e0-6f483b222082
183636d1-7e14-4558-8f1c-65f7c2d0d930	a1cedc36-00da-4425-9ea1-41ef7e522606	DATE_TIME	externalCreatedAt	Creation DateTime	\N	Creation DateTime	IconCalendarPlus	\N	\N	\N	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-9f03-4058-a898-346c62181599	4a5dec44-2fb8-4d70-a6e0-6f483b222082
78eb2a77-f2ae-4865-9144-209cd6780fa0	a1cedc36-00da-4425-9ea1-41ef7e522606	DATE_TIME	externalUpdatedAt	Update DateTime	\N	Update DateTime	IconCalendarCog	\N	\N	\N	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-b355-4c18-8825-ef42c8a5a755	4a5dec44-2fb8-4d70-a6e0-6f483b222082
70e35116-b465-4982-808c-ae601986769e	6be8bb14-8b85-4a2d-ba87-40a4e6b9a586	SELECT	syncStage	Sync stage	"'PENDING_CONFIGURATION'"	Sync stage	IconStatusChange	\N	[{"id": "20202020-60c1-40a3-90ae-61d9ee1083c1", "color": "blue", "label": "Calendar event list fetch pending", "value": "CALENDAR_EVENT_LIST_FETCH_PENDING", "position": 0}, {"id": "20202020-8652-444a-b72e-d4b7112179ca", "color": "green", "label": "Calendar event list fetch scheduled", "value": "CALENDAR_EVENT_LIST_FETCH_SCHEDULED", "position": 1}, {"id": "20202020-e87c-4cfe-aefc-635ad34ef223", "color": "orange", "label": "Calendar event list fetch ongoing", "value": "CALENDAR_EVENT_LIST_FETCH_ONGOING", "position": 2}, {"id": "20202020-876f-449d-9f09-de5c369ff95f", "color": "blue", "label": "Calendar events import pending", "value": "CALENDAR_EVENTS_IMPORT_PENDING", "position": 3}, {"id": "20202020-3d2a-4acd-a0ed-197343b3bf60", "color": "green", "label": "Calendar events import scheduled", "value": "CALENDAR_EVENTS_IMPORT_SCHEDULED", "position": 4}, {"id": "20202020-e762-4152-bb20-29fdd49e1dff", "color": "orange", "label": "Calendar events import ongoing", "value": "CALENDAR_EVENTS_IMPORT_ONGOING", "position": 5}, {"id": "20202020-487c-464f-8caa-c6393b82b17c", "color": "red", "label": "Failed", "value": "FAILED", "position": 6}, {"id": "20202020-ba03-4221-b186-402662b68493", "color": "gray", "label": "Pending configuration", "value": "PENDING_CONFIGURATION", "position": 9}]	\N	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-6246-42e6-b5cd-003bd921782c	4a5dec44-2fb8-4d70-a6e0-6f483b222082
cfdace6b-364d-4f65-a3ce-832caa887685	6be8bb14-8b85-4a2d-ba87-40a4e6b9a586	DATE_TIME	syncStageStartedAt	Sync stage started at	\N	Sync stage started at	IconHistory	\N	\N	\N	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-a934-46f1-a8e7-9568b1e3a53e	4a5dec44-2fb8-4d70-a6e0-6f483b222082
1d7717de-a99c-4784-8602-9ced4111fecb	6be8bb14-8b85-4a2d-ba87-40a4e6b9a586	DATE_TIME	syncedAt	Last sync date	\N	Last sync date	IconHistory	\N	\N	\N	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-2ff5-4f70-953a-3d0d36357576	4a5dec44-2fb8-4d70-a6e0-6f483b222082
0f1a6d14-bb79-47ae-8fea-d22e440a1fcc	6be8bb14-8b85-4a2d-ba87-40a4e6b9a586	NUMBER	throttleFailureCount	Throttle Failure Count	0	Throttle Failure Count	IconX	\N	\N	\N	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-525c-4b76-b9bd-0dd57fd11d61	4a5dec44-2fb8-4d70-a6e0-6f483b222082
ba7d3da5-0218-4791-951e-506da769bd4c	03a73b6b-0eb4-4b17-b71f-a44968cea457	UUID	id	Id	"uuid"	Id	Icon123	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-c03a-4041-8a41-5e6f7a8b9cad	4a5dec44-2fb8-4d70-a6e0-6f483b222082
4226b386-62a7-4ac4-8850-16614099619c	03a73b6b-0eb4-4b17-b71f-a44968cea457	DATE_TIME	createdAt	Creation date	"now"	Creation date	IconCalendar	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-c03b-4042-9b42-6f7a8b9cadbe	4a5dec44-2fb8-4d70-a6e0-6f483b222082
0618e20d-7fbc-462f-ab6a-67bbe7da18ca	03a73b6b-0eb4-4b17-b71f-a44968cea457	DATE_TIME	updatedAt	Last update	"now"	Last time the record was changed	IconCalendarClock	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-c03c-4043-8c43-7a8b9cadbecf	4a5dec44-2fb8-4d70-a6e0-6f483b222082
cdf3e739-7175-4158-b561-243ea4262913	03a73b6b-0eb4-4b17-b71f-a44968cea457	DATE_TIME	deletedAt	Deleted at	\N	Date when the record was deleted	IconCalendarMinus	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-c03d-4044-9d44-8b9cadbecd0f	4a5dec44-2fb8-4d70-a6e0-6f483b222082
80ef038a-66f1-4457-87f0-84e581001279	03a73b6b-0eb4-4b17-b71f-a44968cea457	ACTOR	createdBy	Created by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The creator of the record	IconCreativeCommonsSa	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	9e9ec14d-b889-448e-afe5-40e407be11d1	4a5dec44-2fb8-4d70-a6e0-6f483b222082
1042f075-e9a4-47dd-89db-280f502c449d	03a73b6b-0eb4-4b17-b71f-a44968cea457	ACTOR	updatedBy	Updated by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The workspace member who last updated the record	IconUserCircle	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	a2c6efda-06bf-418e-808a-dac9fd64ab58	4a5dec44-2fb8-4d70-a6e0-6f483b222082
f3e7a099-9b13-435a-ad6a-67a63d4b72eb	03a73b6b-0eb4-4b17-b71f-a44968cea457	POSITION	position	Position	0	Calendar event participant record position	IconHierarchy2	\N	\N	\N	f	t	t	f	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	fcfa672c-ce6d-4fc1-b978-db58a4cc14f4	4a5dec44-2fb8-4d70-a6e0-6f483b222082
0af72bca-861c-4cac-8509-3ad6bdd1546e	03a73b6b-0eb4-4b17-b71f-a44968cea457	TS_VECTOR	searchVector	Search vector	\N	Field used for full-text search	IconUser	\N	\N	{"asExpression": "to_tsvector('simple', COALESCE(public.unaccent_immutable(\\"handle\\"), ''))", "generatedType": "STORED"}	f	t	t	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	c9dccf32-64ea-433e-a9a7-09993343bae0	4a5dec44-2fb8-4d70-a6e0-6f483b222082
ed83b3a6-ea1c-4849-817f-91cd00c2da6d	03a73b6b-0eb4-4b17-b71f-a44968cea457	TEXT	handle	Handle	\N	Handle	IconMail	\N	\N	\N	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-8692-4580-8210-9e09cbd031a7	4a5dec44-2fb8-4d70-a6e0-6f483b222082
3a17221b-4f35-42b3-b3a1-8034f92ca014	03a73b6b-0eb4-4b17-b71f-a44968cea457	TEXT	displayName	Display Name	\N	Display Name	IconUser	\N	\N	\N	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-ee1e-4f9f-8ac1-5c0b2f69691e	4a5dec44-2fb8-4d70-a6e0-6f483b222082
67beac21-7ae5-4371-94f4-f6affdd73262	03a73b6b-0eb4-4b17-b71f-a44968cea457	BOOLEAN	isOrganizer	Is Organizer	false	Is Organizer	IconUser	\N	\N	\N	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-66e7-4e00-9e06-d06c92650580	4a5dec44-2fb8-4d70-a6e0-6f483b222082
3b58afcd-3a34-46be-9578-f1d8feb7fd5c	03a73b6b-0eb4-4b17-b71f-a44968cea457	SELECT	responseStatus	Response Status	"'NEEDS_ACTION'"	Response Status	IconUser	\N	[{"id": "20202020-71eb-4724-9947-8aca3bb51140", "color": "orange", "label": "Needs Action", "value": "NEEDS_ACTION", "position": 0}, {"id": "20202020-7a3c-45e8-8bbb-f909a4b821a4", "color": "red", "label": "Declined", "value": "DECLINED", "position": 1}, {"id": "20202020-aec0-4845-8ca5-a3c17f635329", "color": "yellow", "label": "Tentative", "value": "TENTATIVE", "position": 2}, {"id": "20202020-ffbe-4c58-a05b-b00f7fa86c74", "color": "green", "label": "Accepted", "value": "ACCEPTED", "position": 3}]	\N	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-cec0-4be8-8fba-c366abc23147	4a5dec44-2fb8-4d70-a6e0-6f483b222082
18b144d4-af2f-4aa5-ad38-c2b56e69aca7	a1cedc36-00da-4425-9ea1-41ef7e522606	UUID	id	Id	"uuid"	Id	Icon123	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-c04a-4051-8a51-9cadbe0f1e2d	4a5dec44-2fb8-4d70-a6e0-6f483b222082
fbd1352f-fbd4-4399-869b-09f878f600aa	a1cedc36-00da-4425-9ea1-41ef7e522606	DATE_TIME	createdAt	Creation date	"now"	Creation date	IconCalendar	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-c04b-4052-9b52-adbecf1f2e3e	4a5dec44-2fb8-4d70-a6e0-6f483b222082
fb25fa1a-c7b6-47d9-9a47-b4ba7fcf1c81	a1cedc36-00da-4425-9ea1-41ef7e522606	DATE_TIME	updatedAt	Last update	"now"	Last time the record was changed	IconCalendarClock	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-c04c-4053-8c53-becf0f2f3e4f	4a5dec44-2fb8-4d70-a6e0-6f483b222082
ea5c5ce2-7de2-4e01-bd8d-67b39937574b	a1cedc36-00da-4425-9ea1-41ef7e522606	DATE_TIME	deletedAt	Deleted at	\N	Date when the record was deleted	IconCalendarMinus	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-c04d-4054-9d54-cd0f1f3f4e5f	4a5dec44-2fb8-4d70-a6e0-6f483b222082
5189b48d-a07b-429b-bcf4-97c90167ec88	a1cedc36-00da-4425-9ea1-41ef7e522606	ACTOR	createdBy	Created by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The creator of the record	IconCreativeCommonsSa	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	664a9500-2641-4caa-8d95-069807bb2eb4	4a5dec44-2fb8-4d70-a6e0-6f483b222082
17aaf796-2fe8-4f02-8245-6e6566f1d284	a1cedc36-00da-4425-9ea1-41ef7e522606	ACTOR	updatedBy	Updated by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The workspace member who last updated the record	IconUserCircle	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	1081c196-d675-4801-b9e1-7d8637b48eab	4a5dec44-2fb8-4d70-a6e0-6f483b222082
89dc9652-96fe-4dfc-9fc1-f6e296a72dd9	a1cedc36-00da-4425-9ea1-41ef7e522606	POSITION	position	Position	0	Calendar event record position	IconHierarchy2	\N	\N	\N	f	t	t	f	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	e9488e9a-0abe-4500-8c1d-bfbd6b8cffad	4a5dec44-2fb8-4d70-a6e0-6f483b222082
47d5b8ad-fed4-4625-ab0b-6705ce322854	a1cedc36-00da-4425-9ea1-41ef7e522606	TS_VECTOR	searchVector	Search vector	\N	Field used for full-text search	IconUser	\N	\N	{"asExpression": "to_tsvector('simple', COALESCE(public.unaccent_immutable(\\"title\\"), ''))", "generatedType": "STORED"}	f	t	t	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	b9e7825c-d491-4414-b904-910c00b5b93b	4a5dec44-2fb8-4d70-a6e0-6f483b222082
efd1c758-2fa2-4bb6-939b-65b902e5ebde	a1cedc36-00da-4425-9ea1-41ef7e522606	TEXT	title	Title	\N	Title	IconH1	\N	\N	\N	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-080e-49d1-b21d-9702a7e2525c	4a5dec44-2fb8-4d70-a6e0-6f483b222082
4ad5a92d-3f8f-4eea-919e-004db7f0b1a8	a1cedc36-00da-4425-9ea1-41ef7e522606	TEXT	description	Description	\N	Description	IconFileDescription	\N	\N	\N	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-52c4-4266-a98f-e90af0b4d271	4a5dec44-2fb8-4d70-a6e0-6f483b222082
7279bf4b-d9aa-4bbb-a2ba-ecb802b2f691	a1cedc36-00da-4425-9ea1-41ef7e522606	TEXT	location	Location	\N	Location	IconMapPin	\N	\N	\N	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-641a-4ffe-960d-c3c186d95b17	4a5dec44-2fb8-4d70-a6e0-6f483b222082
e08fa41c-95d4-4eeb-b706-500aa81a73ad	a1cedc36-00da-4425-9ea1-41ef7e522606	TEXT	iCalUid	iCal UID	\N	iCal UID	IconKey	\N	\N	\N	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-f24b-45f4-b6a3-d2f9fcb98714	4a5dec44-2fb8-4d70-a6e0-6f483b222082
2f3c36f3-9cfd-4117-bf0b-c8d1aa4d4f09	a1cedc36-00da-4425-9ea1-41ef7e522606	TEXT	conferenceSolution	Conference Solution	\N	Conference Solution	IconScreenShare	\N	\N	\N	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-1c3f-4b5a-b526-5411a82179eb	4a5dec44-2fb8-4d70-a6e0-6f483b222082
1af9f325-6ed0-4a96-8f4d-ba7c0da80719	a1cedc36-00da-4425-9ea1-41ef7e522606	LINKS	conferenceLink	Meet Link	\N	Meet Link	IconLink	\N	\N	\N	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-35da-43ef-9ca0-e936e9dc237b	4a5dec44-2fb8-4d70-a6e0-6f483b222082
989ac6cb-adb6-415c-bf1d-162733db3813	1b9bb040-2722-44d7-a5ac-4e251b541f13	UUID	id	Id	"uuid"	Id	Icon123	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-c05a-4061-8a61-1e2f3a4b5c6d	4a5dec44-2fb8-4d70-a6e0-6f483b222082
9737fc59-4955-431f-aaa0-81f449767c67	1b9bb040-2722-44d7-a5ac-4e251b541f13	DATE_TIME	createdAt	Creation date	"now"	Creation date	IconCalendar	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-c05b-4062-9b62-2f3a4b5c6d7e	4a5dec44-2fb8-4d70-a6e0-6f483b222082
e7d1b58f-d423-4360-8b0a-0984dfdb5524	1b9bb040-2722-44d7-a5ac-4e251b541f13	DATE_TIME	updatedAt	Last update	"now"	Last time the record was changed	IconCalendarClock	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-c05c-4063-8c63-3a4b5c6d7e8f	4a5dec44-2fb8-4d70-a6e0-6f483b222082
5033f182-0702-42c3-9ac3-220672b31aaa	1b9bb040-2722-44d7-a5ac-4e251b541f13	DATE_TIME	deletedAt	Deleted at	\N	Date when the record was deleted	IconCalendarMinus	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-c05d-4064-9d64-4b5c6d7e8f9a	4a5dec44-2fb8-4d70-a6e0-6f483b222082
69512596-ab97-4a06-a1c9-006d5983356b	1b9bb040-2722-44d7-a5ac-4e251b541f13	TEXT	name	Name	\N	The company name	IconBuildingSkyscraper	\N	\N	\N	f	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-4d99-4e2e-a84c-4a27837b1ece	4a5dec44-2fb8-4d70-a6e0-6f483b222082
1293a7d1-bf10-4dc2-a75f-c0166cef618e	1b9bb040-2722-44d7-a5ac-4e251b541f13	LINKS	domainName	Domain Name	\N	The company website URL. We use this url to fetch the company icon	IconLink	\N	\N	{"maxNumberOfValues": 1}	f	t	f	f	t	t	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-0c28-43d8-8ba5-3659924d3489	4a5dec44-2fb8-4d70-a6e0-6f483b222082
10cf8f8d-3811-4368-8a62-f850fac550bb	1b9bb040-2722-44d7-a5ac-4e251b541f13	ADDRESS	address	Address	\N	Address of the company	IconMap	\N	\N	\N	f	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-c5ce-4adc-b7b6-9c0979fc55e7	4a5dec44-2fb8-4d70-a6e0-6f483b222082
31951850-f9d4-400a-936b-e64c900abb08	1b9bb040-2722-44d7-a5ac-4e251b541f13	NUMBER	employees	Employees	\N	Number of employees in the company	IconUsers	\N	\N	\N	f	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-8965-464a-8a75-74bafc152a0b	4a5dec44-2fb8-4d70-a6e0-6f483b222082
5ebf4172-7532-42dc-825d-193e2f421de9	1b9bb040-2722-44d7-a5ac-4e251b541f13	LINKS	linkedinLink	Linkedin	\N	The company Linkedin account	IconBrandLinkedin	\N	\N	\N	f	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-ebeb-4beb-b9ad-6848036fb451	4a5dec44-2fb8-4d70-a6e0-6f483b222082
73ed6365-303e-4fe4-ab86-b9a04ef19244	1b9bb040-2722-44d7-a5ac-4e251b541f13	LINKS	xLink	X	\N	The company Twitter/X account	IconBrandX	\N	\N	\N	f	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-6f64-4fd9-9580-9c1991c7d8c3	4a5dec44-2fb8-4d70-a6e0-6f483b222082
f460516e-7aa7-48b8-b2fd-dabb6eeadeac	1b9bb040-2722-44d7-a5ac-4e251b541f13	CURRENCY	annualRecurringRevenue	ARR	\N	Annual Recurring Revenue: The actual or estimated annual revenue of the company	IconMoneybag	\N	\N	\N	f	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-602a-495c-9776-f5d5b11d227b	4a5dec44-2fb8-4d70-a6e0-6f483b222082
af93449c-cb6e-4025-9140-08e4606fa185	1b9bb040-2722-44d7-a5ac-4e251b541f13	BOOLEAN	idealCustomerProfile	ICP	false	Ideal Customer Profile: Indicates whether the company is the most suitable and valuable customer for you	IconTarget	\N	\N	\N	f	t	f	f	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-ba6b-438a-8213-2c5ba28d76a2	4a5dec44-2fb8-4d70-a6e0-6f483b222082
efa31402-b757-492a-ac0a-dc35b1d6bf47	1b9bb040-2722-44d7-a5ac-4e251b541f13	POSITION	position	Position	0	Company record position	IconHierarchy2	\N	\N	\N	f	t	t	f	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-9b4e-462b-991d-a0ee33326454	4a5dec44-2fb8-4d70-a6e0-6f483b222082
dbeed298-970c-4c45-94b7-43e30b4e08b7	1b9bb040-2722-44d7-a5ac-4e251b541f13	ACTOR	createdBy	Created by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The creator of the record	IconCreativeCommonsSa	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-fabc-451d-ab7d-412170916baa	4a5dec44-2fb8-4d70-a6e0-6f483b222082
b301914a-64ca-4198-81ee-9c0eacb12643	1b9bb040-2722-44d7-a5ac-4e251b541f13	ACTOR	updatedBy	Updated by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The workspace member who last updated the record	IconUserCircle	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	7444022e-b38f-4d4f-801b-cd664abc4834	4a5dec44-2fb8-4d70-a6e0-6f483b222082
4bf0fb2e-e259-4a3f-8ef0-2af2170cca03	1b9bb040-2722-44d7-a5ac-4e251b541f13	TS_VECTOR	searchVector	Search vector	\N	Field used for full-text search	IconUser	\N	\N	{"asExpression": "to_tsvector('simple', COALESCE(public.unaccent_immutable(\\"name\\"), '') || ' ' || COALESCE(public.unaccent_immutable(\\"domainNamePrimaryLinkLabel\\"), '') || ' ' || COALESCE(public.unaccent_immutable(\\"domainNamePrimaryLinkUrl\\"), '') || ' ' || COALESCE(public.unaccent_immutable(TRANSLATE(regexp_replace(\\"domainNameSecondaryLinks\\"::text, '\\"(label|url)\\"\\\\s*:\\\\s*', '', 'g'), '[]{}\\",:', '        ')), ''))", "generatedType": "STORED"}	f	t	t	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	85c71601-72f9-4b7b-b343-d46100b2c74d	4a5dec44-2fb8-4d70-a6e0-6f483b222082
73ee154a-c379-4ba6-9e7f-7449a8000532	45600963-91d4-4b77-8fb6-449c8e3c1f44	UUID	id	Id	"uuid"	Id	Icon123	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-c06a-4071-8a71-5c6d7e8f9aab	4a5dec44-2fb8-4d70-a6e0-6f483b222082
bbdd7805-f096-408b-822a-58786a461677	45600963-91d4-4b77-8fb6-449c8e3c1f44	DATE_TIME	createdAt	Creation date	"now"	Creation date	IconCalendar	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-c06b-4072-9b72-6d7e8f9aabbc	4a5dec44-2fb8-4d70-a6e0-6f483b222082
a346ecbb-59e5-4c48-a21c-44e3a2e4aa19	45600963-91d4-4b77-8fb6-449c8e3c1f44	DATE_TIME	updatedAt	Last update	"now"	Last time the record was changed	IconCalendarClock	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-c06c-4073-8c73-7e8f9aabbccd	4a5dec44-2fb8-4d70-a6e0-6f483b222082
77e32db6-f1be-4cf2-a248-b3e2bd3ba5d7	45600963-91d4-4b77-8fb6-449c8e3c1f44	DATE_TIME	deletedAt	Deleted at	\N	Date when the record was deleted	IconCalendarMinus	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-c06d-4074-9d74-8f9aabbccdde	4a5dec44-2fb8-4d70-a6e0-6f483b222082
61954425-3bd3-45cc-81a4-d8ebbb717cf4	45600963-91d4-4b77-8fb6-449c8e3c1f44	ACTOR	createdBy	Created by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The creator of the record	IconCreativeCommonsSa	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	e09c2463-9ca6-4004-97ce-6039e3161a5d	4a5dec44-2fb8-4d70-a6e0-6f483b222082
361ec4b1-c27d-4ea7-9490-d541a3804cc3	45600963-91d4-4b77-8fb6-449c8e3c1f44	ACTOR	updatedBy	Updated by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The workspace member who last updated the record	IconUserCircle	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	0a84c0e1-f9fc-47d5-8ac9-58538e50a9f9	4a5dec44-2fb8-4d70-a6e0-6f483b222082
baaeb401-42c7-435b-ae4a-395e662bf618	45600963-91d4-4b77-8fb6-449c8e3c1f44	POSITION	position	Position	0	Connected account record position	IconHierarchy2	\N	\N	\N	f	t	t	f	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	66b7bc3e-c99e-42b6-82e6-6f43142c0f2f	4a5dec44-2fb8-4d70-a6e0-6f483b222082
afdfd346-860a-4b03-ae58-0892fcb09a1f	45600963-91d4-4b77-8fb6-449c8e3c1f44	TS_VECTOR	searchVector	Search vector	\N	Field used for full-text search	IconUser	\N	\N	{"asExpression": "to_tsvector('simple', COALESCE(public.unaccent_immutable(\\"handle\\"), ''))", "generatedType": "STORED"}	f	t	t	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	140767fe-0aa4-4573-a0bd-67cb657c9452	4a5dec44-2fb8-4d70-a6e0-6f483b222082
97913003-a3d6-43bc-9428-547c89b7d24e	45600963-91d4-4b77-8fb6-449c8e3c1f44	TEXT	handle	handle	\N	The account handle (email, username, phone number, etc.)	IconMail	\N	\N	\N	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-c804-4a50-bb05-b3a9e24f1dec	4a5dec44-2fb8-4d70-a6e0-6f483b222082
a1371165-35c8-49d9-9432-1a7fca3c1c86	45600963-91d4-4b77-8fb6-449c8e3c1f44	TEXT	provider	provider	"'google'"	The account provider	IconSettings	\N	\N	\N	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-ebb0-4516-befc-a9e95935efd5	4a5dec44-2fb8-4d70-a6e0-6f483b222082
11a856bd-3074-4d9e-bdbd-98170ef3111b	45600963-91d4-4b77-8fb6-449c8e3c1f44	TEXT	accessToken	Access Token	\N	Messaging provider access token	IconKey	\N	\N	\N	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-707b-4a0a-8753-2ad42efe1e29	4a5dec44-2fb8-4d70-a6e0-6f483b222082
05d666e3-91f0-4721-8e42-38a5afd216db	45600963-91d4-4b77-8fb6-449c8e3c1f44	TEXT	refreshToken	Refresh Token	\N	Messaging provider refresh token	IconKey	\N	\N	\N	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-532d-48bd-80a5-c4be6e7f6e49	4a5dec44-2fb8-4d70-a6e0-6f483b222082
7acf21a8-09ae-4395-9e3d-948ab02f0b4c	45600963-91d4-4b77-8fb6-449c8e3c1f44	TEXT	lastSyncHistoryId	Last sync history ID	\N	Last sync history ID	IconHistory	\N	\N	\N	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-115c-4a87-b50f-ac4367a971b9	4a5dec44-2fb8-4d70-a6e0-6f483b222082
c65584b1-6236-4948-94b4-ee4751dbeb34	45600963-91d4-4b77-8fb6-449c8e3c1f44	DATE_TIME	authFailedAt	Auth failed at	\N	Auth failed at	IconX	\N	\N	\N	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-d268-4c6b-baff-400d402b430a	4a5dec44-2fb8-4d70-a6e0-6f483b222082
3aea709e-02c5-417b-b71d-9e358fb66698	45600963-91d4-4b77-8fb6-449c8e3c1f44	DATE_TIME	lastCredentialsRefreshedAt	Last credentials refreshed at	\N	Last credentials refreshed at	IconHistory	\N	\N	\N	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-aa5e-4e85-903b-fdf90a941941	4a5dec44-2fb8-4d70-a6e0-6f483b222082
93a2627c-c48d-4984-8ce6-9c877119536c	45600963-91d4-4b77-8fb6-449c8e3c1f44	TEXT	handleAliases	Handle Aliases	\N	Handle Aliases	IconMail	\N	\N	\N	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-8a3d-46be-814f-6228af16c47b	4a5dec44-2fb8-4d70-a6e0-6f483b222082
461d5bac-1dfe-4bc7-a01b-401b0cad1d89	45600963-91d4-4b77-8fb6-449c8e3c1f44	ARRAY	scopes	Scopes	\N	Scopes	IconSettings	\N	\N	\N	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-8a3d-46be-814f-6228af16c47c	4a5dec44-2fb8-4d70-a6e0-6f483b222082
644bde53-1046-4183-9cb4-10575ff9e4c0	45600963-91d4-4b77-8fb6-449c8e3c1f44	RAW_JSON	connectionParameters	Custom Connection Parameters	\N	JSON object containing custom connection parameters	IconSettings	\N	\N	\N	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-a1b2-46be-814f-6228af16c481	4a5dec44-2fb8-4d70-a6e0-6f483b222082
333c819d-ae41-4451-bad7-8115b2dd04bb	8bf7b8ba-a68b-49dc-8e9a-661cf9d528c4	UUID	id	Id	"uuid"	Id	Icon123	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-da1a-41d1-8ad1-abcdefabcdef	4a5dec44-2fb8-4d70-a6e0-6f483b222082
387e9e5c-b62c-4889-ab40-fe968ef3d5fb	8bf7b8ba-a68b-49dc-8e9a-661cf9d528c4	DATE_TIME	createdAt	Creation date	"now"	Creation date	IconCalendar	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-da1b-41d2-9bd2-bcdefabcdefa	4a5dec44-2fb8-4d70-a6e0-6f483b222082
32e55123-1f37-4654-8946-89d2fe13587e	8bf7b8ba-a68b-49dc-8e9a-661cf9d528c4	DATE_TIME	updatedAt	Last update	"now"	Last time the record was changed	IconCalendarClock	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-da1c-41d3-8cd3-cdefabcdefab	4a5dec44-2fb8-4d70-a6e0-6f483b222082
34ef3d91-4a9f-4d1d-942a-a81a5b4fd782	8bf7b8ba-a68b-49dc-8e9a-661cf9d528c4	DATE_TIME	deletedAt	Deleted at	\N	Date when the record was deleted	IconCalendarMinus	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-da1d-41d4-9dd4-defabcdefabc	4a5dec44-2fb8-4d70-a6e0-6f483b222082
a5fe568f-6ae1-484b-9684-a5c9b5192cff	8bf7b8ba-a68b-49dc-8e9a-661cf9d528c4	TEXT	title	Title	\N	Dashboard title	IconNotes	\N	\N	\N	f	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-20ee-4091-95dc-44b57eda3a89	4a5dec44-2fb8-4d70-a6e0-6f483b222082
88199deb-5aac-4ff0-9bcd-03317b49b77a	8bf7b8ba-a68b-49dc-8e9a-661cf9d528c4	POSITION	position	Position	0	Dashboard record Position	IconHierarchy2	\N	\N	\N	f	t	t	f	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-38af-409b-95f0-7f08aa5f420f	4a5dec44-2fb8-4d70-a6e0-6f483b222082
7cd2291e-0cf7-409c-b0a5-1e74be74b977	8bf7b8ba-a68b-49dc-8e9a-661cf9d528c4	UUID	pageLayoutId	Page Layout ID	\N	Dashboard page layout	IconLayout	\N	\N	\N	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-bb53-4648-aa36-1d9d54e6f7f2	4a5dec44-2fb8-4d70-a6e0-6f483b222082
e94a1033-c67e-4d31-980e-dfbade2cfd24	8bf7b8ba-a68b-49dc-8e9a-661cf9d528c4	ACTOR	createdBy	Created by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The creator of the record	IconCreativeCommonsSa	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-ff32-4fa1-b7ad-407cc6aa0734	4a5dec44-2fb8-4d70-a6e0-6f483b222082
19331f6d-5ca7-4b5e-ba2c-868c17fd36e9	8bf7b8ba-a68b-49dc-8e9a-661cf9d528c4	ACTOR	updatedBy	Updated by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The workspace member who last updated the record	IconUserCircle	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	53ee42e7-f157-42b5-b278-a5fa9b378307	4a5dec44-2fb8-4d70-a6e0-6f483b222082
838823c6-79f7-4de1-a21c-62e5389014ce	8bf7b8ba-a68b-49dc-8e9a-661cf9d528c4	TS_VECTOR	searchVector	Search vector	\N	Field used for full-text search	IconUser	\N	\N	{"asExpression": "to_tsvector('simple', COALESCE(public.unaccent_immutable(\\"title\\"), ''))", "generatedType": "STORED"}	f	t	t	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-0bcc-47a4-8360-2e35a7133f7a	4a5dec44-2fb8-4d70-a6e0-6f483b222082
f6831443-7eda-42a9-a517-b4483a80b4ff	254569df-6932-4d1b-abcd-cb0f250b72ed	UUID	id	Id	"uuid"	Id	Icon123	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-b01a-40b1-8ab1-5a6b7c8d9eaf	4a5dec44-2fb8-4d70-a6e0-6f483b222082
42889cc8-49ff-4826-b1f1-342c78f68e59	254569df-6932-4d1b-abcd-cb0f250b72ed	DATE_TIME	createdAt	Creation date	"now"	Creation date	IconCalendar	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-b01b-40b2-9bb2-6b7c8d9eafba	4a5dec44-2fb8-4d70-a6e0-6f483b222082
463fdd68-1200-471f-84be-d703fc231206	254569df-6932-4d1b-abcd-cb0f250b72ed	DATE_TIME	updatedAt	Last update	"now"	Last time the record was changed	IconCalendarClock	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-b01c-40b3-8cb3-7c8d9eafbacb	4a5dec44-2fb8-4d70-a6e0-6f483b222082
57787a0c-8b40-4fe4-bcbc-d551e2c9f88f	254569df-6932-4d1b-abcd-cb0f250b72ed	DATE_TIME	deletedAt	Deleted at	\N	Date when the record was deleted	IconCalendarMinus	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-b01d-40b4-9db4-8d9eafbacbdc	4a5dec44-2fb8-4d70-a6e0-6f483b222082
a6ee096c-43c1-4e64-8cd1-fadb3ccd3993	254569df-6932-4d1b-abcd-cb0f250b72ed	ACTOR	createdBy	Created by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The creator of the record	IconCreativeCommonsSa	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	ce7dc96f-dd33-4bce-9505-cbd381440cec	4a5dec44-2fb8-4d70-a6e0-6f483b222082
bec05aab-e2b5-4426-972f-206f67d5ab43	254569df-6932-4d1b-abcd-cb0f250b72ed	ACTOR	updatedBy	Updated by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The workspace member who last updated the record	IconUserCircle	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	334d2ad6-4bc4-4b51-9c92-8ad57652475e	4a5dec44-2fb8-4d70-a6e0-6f483b222082
a219597e-618e-4b56-87c5-ea1153255e73	254569df-6932-4d1b-abcd-cb0f250b72ed	POSITION	position	Position	0	Message channel message association record position	IconHierarchy2	\N	\N	\N	f	t	t	f	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	45d1e083-90d6-4507-b68a-454a9dc3a540	4a5dec44-2fb8-4d70-a6e0-6f483b222082
a2705d0c-aee5-4d96-bb95-986f005eb11d	254569df-6932-4d1b-abcd-cb0f250b72ed	TS_VECTOR	searchVector	Search vector	\N	Field used for full-text search	IconUser	\N	\N	{"asExpression": "to_tsvector('simple', COALESCE(public.unaccent_immutable(\\"messageExternalId\\"), ''))", "generatedType": "STORED"}	f	t	t	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	edddd409-d9f0-4b93-8e3f-37faef6a3387	4a5dec44-2fb8-4d70-a6e0-6f483b222082
0b16c6d5-bf47-4dae-970c-0bd8f7972990	254569df-6932-4d1b-abcd-cb0f250b72ed	TEXT	messageExternalId	Message External Id	\N	Message id from the messaging provider	IconHash	\N	\N	\N	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-37d6-438f-b6fd-6503596c8f34	4a5dec44-2fb8-4d70-a6e0-6f483b222082
8b1240fc-be79-4087-a120-675ff8e56e78	254569df-6932-4d1b-abcd-cb0f250b72ed	TEXT	messageThreadExternalId	Thread External Id	\N	Thread id from the messaging provider	IconHash	\N	\N	\N	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-35fb-421e-afa0-0b8e8f7f9018	4a5dec44-2fb8-4d70-a6e0-6f483b222082
8e0c330b-f706-4f6f-9580-924c79ca0ed6	254569df-6932-4d1b-abcd-cb0f250b72ed	SELECT	direction	Direction	"'INCOMING'"	Message Direction	IconDirection	\N	[{"id": "20202020-3075-4e35-b6a1-27db444a4668", "color": "green", "label": "Incoming", "value": "INCOMING", "position": 0}, {"id": "20202020-a15f-4512-9202-391a3c0bbed3", "color": "blue", "label": "Outgoing", "value": "OUTGOING", "position": 1}]	\N	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	75c9b0f7-9e76-44d4-a2f9-47051e61eec7	4a5dec44-2fb8-4d70-a6e0-6f483b222082
a3ac02f1-25ec-4448-86f8-413a066a775a	254569df-6932-4d1b-abcd-cb0f250b72ed	UUID	messageChannelId	Message Channel Id	\N	Message Channel Id	IconHash	\N	\N	\N	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-b658-408f-bd46-3bd2d15d7e52	4a5dec44-2fb8-4d70-a6e0-6f483b222082
c72a10bf-1671-4e73-aec3-3d55a0b4792a	711ed2e9-cc32-45af-ba39-7066034c618e	UUID	id	Id	"uuid"	Id	Icon123	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-b02a-40c1-8ac1-9eafbacbdced	4a5dec44-2fb8-4d70-a6e0-6f483b222082
199316df-1211-4a25-8773-fefc327d33e2	711ed2e9-cc32-45af-ba39-7066034c618e	DATE_TIME	createdAt	Creation date	"now"	Creation date	IconCalendar	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-b02b-40c2-9bc2-afbacbdcedfe	4a5dec44-2fb8-4d70-a6e0-6f483b222082
29bd9087-f29b-4b5e-805d-2bb8857cb53a	711ed2e9-cc32-45af-ba39-7066034c618e	DATE_TIME	updatedAt	Last update	"now"	Last time the record was changed	IconCalendarClock	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-b02c-40c3-8cc3-bacbdcedfefa	4a5dec44-2fb8-4d70-a6e0-6f483b222082
9ecd36fa-81a7-4b9d-bb4f-8c7e6901d5bc	711ed2e9-cc32-45af-ba39-7066034c618e	DATE_TIME	deletedAt	Deleted at	\N	Date when the record was deleted	IconCalendarMinus	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-b02d-40c4-9dc4-cbdcedfefaab	4a5dec44-2fb8-4d70-a6e0-6f483b222082
669101cd-5fa7-40f0-9893-f1cfa3582a06	711ed2e9-cc32-45af-ba39-7066034c618e	ACTOR	createdBy	Created by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The creator of the record	IconCreativeCommonsSa	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	b7de8fcc-a7c6-4122-b3fa-1fcf8f30931c	4a5dec44-2fb8-4d70-a6e0-6f483b222082
1b2cf7b5-3970-496a-a185-67b5e0d14567	711ed2e9-cc32-45af-ba39-7066034c618e	ACTOR	updatedBy	Updated by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The workspace member who last updated the record	IconUserCircle	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	88bb6ff1-b8a1-4313-95d4-7879acca0b93	4a5dec44-2fb8-4d70-a6e0-6f483b222082
ec7ca579-b4c4-4813-99e8-89bc7654dff2	711ed2e9-cc32-45af-ba39-7066034c618e	POSITION	position	Position	0	Message Channel record position	IconHierarchy2	\N	\N	\N	f	t	t	f	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	bc8a36af-8b9c-4548-a0da-c90e899e7243	4a5dec44-2fb8-4d70-a6e0-6f483b222082
e4818c16-2b38-4b2f-84a7-89dbdd7f4d7b	711ed2e9-cc32-45af-ba39-7066034c618e	TS_VECTOR	searchVector	Search vector	\N	Field used for full-text search	IconUser	\N	\N	{"asExpression": "to_tsvector('simple', COALESCE(public.unaccent_immutable(\\"handle\\"), ''))", "generatedType": "STORED"}	f	t	t	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	5e84794c-6f14-4bdf-81a6-76ee11cda51f	4a5dec44-2fb8-4d70-a6e0-6f483b222082
b3a83c13-0458-4f3b-83d3-e297579752ad	711ed2e9-cc32-45af-ba39-7066034c618e	SELECT	visibility	Visibility	"'SHARE_EVERYTHING'"	Visibility	IconEyeglass	\N	[{"id": "20202020-4548-4830-b3f8-221fd082ebc0", "color": "green", "label": "Metadata", "value": "METADATA", "position": 0}, {"id": "20202020-6a42-40a8-b81e-28b7e591c598", "color": "blue", "label": "Subject", "value": "SUBJECT", "position": 1}, {"id": "20202020-d520-4cba-8832-5bca315b64f3", "color": "orange", "label": "Share Everything", "value": "SHARE_EVERYTHING", "position": 2}]	\N	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-6a6b-4532-9767-cbc61b469453	4a5dec44-2fb8-4d70-a6e0-6f483b222082
401a9543-da3e-45d1-b960-e87733b0a0c4	711ed2e9-cc32-45af-ba39-7066034c618e	TEXT	handle	Handle	\N	Handle	IconAt	\N	\N	\N	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-2c96-43c3-93e3-ed6b1acb69bc	4a5dec44-2fb8-4d70-a6e0-6f483b222082
00733e8e-de05-4a3a-bf52-7deea920ceae	711ed2e9-cc32-45af-ba39-7066034c618e	SELECT	type	Type	"'EMAIL'"	Channel Type	IconMessage	\N	[{"id": "20202020-1628-4bc0-aae1-1a46c648cf90", "color": "green", "label": "Email", "value": "EMAIL", "position": 0}, {"id": "20202020-fb11-4da3-80fd-b291cda8deb1", "color": "blue", "label": "SMS", "value": "SMS", "position": 1}]	\N	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-ae95-42d9-a3f1-797a2ea22122	4a5dec44-2fb8-4d70-a6e0-6f483b222082
cf9bdbc5-f3cf-491c-a5d7-91c124213d77	711ed2e9-cc32-45af-ba39-7066034c618e	BOOLEAN	isContactAutoCreationEnabled	Is Contact Auto Creation Enabled	true	Is Contact Auto Creation Enabled	IconUserCircle	\N	\N	\N	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-fabd-4f14-b7c6-3310f6d132c6	4a5dec44-2fb8-4d70-a6e0-6f483b222082
79c6b499-300a-4b6b-8ad1-777e258edeca	711ed2e9-cc32-45af-ba39-7066034c618e	SELECT	contactAutoCreationPolicy	Contact auto creation policy	"'SENT'"	Automatically create People records when receiving or sending emails	IconUserCircle	\N	[{"id": "20202020-1923-4ffd-907d-be8cc37ecee5", "color": "green", "label": "Sent and Received", "value": "SENT_AND_RECEIVED", "position": 0}, {"id": "20202020-8f6a-44d8-bdbb-90cf8b919467", "color": "blue", "label": "Sent", "value": "SENT", "position": 1}, {"id": "20202020-b43e-4bc4-840e-d903a69e2ffc", "color": "red", "label": "None", "value": "NONE", "position": 2}]	\N	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-fc0e-4ba6-b259-a66ca89cfa38	4a5dec44-2fb8-4d70-a6e0-6f483b222082
a8c3e6b0-56f7-4029-b2c4-6ccd097a749a	711ed2e9-cc32-45af-ba39-7066034c618e	SELECT	messageFolderImportPolicy	Message folder import policy	"'ALL_FOLDERS'"	Message folder import policy	IconFolder	\N	[{"id": "20202020-140d-4326-978c-83ca0e9a4d8f", "color": "green", "label": "All folders", "value": "ALL_FOLDERS", "position": 0}, {"id": "20202020-513a-4b91-9033-5b74b404e2cb", "color": "blue", "label": "Selected folders", "value": "SELECTED_FOLDERS", "position": 1}]	\N	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-cc39-4432-9fe8-ec8ab8bbed95	4a5dec44-2fb8-4d70-a6e0-6f483b222082
54f8b788-9f3f-4573-a990-b4b4fdd67073	711ed2e9-cc32-45af-ba39-7066034c618e	BOOLEAN	excludeNonProfessionalEmails	Exclude non professional emails	true	Exclude non professional emails	IconBriefcase	\N	\N	\N	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-1df5-445d-b4f3-2413ad178431	4a5dec44-2fb8-4d70-a6e0-6f483b222082
2e58f0a6-0da2-4b9a-a236-3fdb6bcf556f	711ed2e9-cc32-45af-ba39-7066034c618e	BOOLEAN	excludeGroupEmails	Exclude group emails	true	Exclude group emails	IconUsersGroup	\N	\N	\N	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-45a0-4be4-9164-5820a6a109fb	4a5dec44-2fb8-4d70-a6e0-6f483b222082
7c43bc58-00c8-4784-a1e4-4f54e745e785	711ed2e9-cc32-45af-ba39-7066034c618e	SELECT	pendingGroupEmailsAction	Pending group emails action	"'NONE'"	Pending action for group emails	IconUsersGroup	\N	[{"id": "20202020-2ead-4bd1-aa5d-5005c7a956b4", "color": "red", "label": "Group emails deletion", "value": "GROUP_EMAILS_DELETION", "position": 0}, {"id": "20202020-155d-447d-a36e-6ecbb30fc37c", "color": "green", "label": "Group emails import", "value": "GROUP_EMAILS_IMPORT", "position": 1}, {"id": "20202020-fe98-4018-9f94-f878c22b8ece", "color": "blue", "label": "None", "value": "NONE", "position": 2}]	\N	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-17c5-4e9f-bc50-af46a89fdd42	4a5dec44-2fb8-4d70-a6e0-6f483b222082
eee0d48c-a10c-4977-8b13-ad63c184359e	711ed2e9-cc32-45af-ba39-7066034c618e	BOOLEAN	isSyncEnabled	Is Sync Enabled	true	Is Sync Enabled	IconRefresh	\N	\N	\N	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-d9a6-48e9-990b-b97fdf22e8dd	4a5dec44-2fb8-4d70-a6e0-6f483b222082
1ff46411-5a26-47e9-9e4d-ed7c007d6d49	711ed2e9-cc32-45af-ba39-7066034c618e	TEXT	syncCursor	Last sync cursor	\N	Last sync cursor	IconHistory	\N	\N	\N	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-79d1-41cf-b738-bcf5ed61e256	4a5dec44-2fb8-4d70-a6e0-6f483b222082
161a58e6-e524-46a2-8eec-2057b6c3cb5a	711ed2e9-cc32-45af-ba39-7066034c618e	DATE_TIME	syncedAt	Last sync date	\N	Last sync date	IconHistory	\N	\N	\N	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-263d-4c6b-ad51-137ada56f7d4	4a5dec44-2fb8-4d70-a6e0-6f483b222082
9d295698-2354-4548-adce-341e8049ed40	711ed2e9-cc32-45af-ba39-7066034c618e	SELECT	syncStatus	Sync status	\N	Sync status	IconStatusChange	\N	[{"id": "20202020-046b-4bc2-b085-bd69aaa8e577", "color": "yellow", "label": "Ongoing", "value": "ONGOING", "position": 1}, {"id": "20202020-09ec-4ea6-9a8a-bf48211b67e2", "color": "blue", "label": "Not Synced", "value": "NOT_SYNCED", "position": 2}, {"id": "20202020-2d1b-4d74-9689-9bd28fd3c3f9", "color": "green", "label": "Active", "value": "ACTIVE", "position": 3}, {"id": "20202020-0fb2-4a8b-9f9b-569144a45193", "color": "red", "label": "Failed Insufficient Permissions", "value": "FAILED_INSUFFICIENT_PERMISSIONS", "position": 4}, {"id": "20202020-bde3-415a-a8ac-55ced6014364", "color": "red", "label": "Failed Unknown", "value": "FAILED_UNKNOWN", "position": 5}]	\N	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-56a1-4f7e-9880-a8493bb899cc	4a5dec44-2fb8-4d70-a6e0-6f483b222082
c7ee0838-36b2-4750-9abe-ef79d627624d	b03dcd32-17eb-4bd2-b529-7e0bbc7d4cdd	TS_VECTOR	searchVector	Search vector	\N	Field used for full-text search	IconUser	\N	\N	{"asExpression": "to_tsvector('simple', NULL)", "generatedType": "STORED"}	f	t	t	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	38633a97-0e88-44de-9903-b8c9e0f59a36	4a5dec44-2fb8-4d70-a6e0-6f483b222082
409b77a0-fb30-44b8-bf49-c5d8b4f4018b	b03dcd32-17eb-4bd2-b529-7e0bbc7d4cdd	UUID	messageFolderId	Message Folder	\N	Message Folder	IconFolder	\N	\N	\N	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	b3369d31-3856-4a7a-b007-ee353918127c	4a5dec44-2fb8-4d70-a6e0-6f483b222082
faa95536-fcc3-4ec9-b070-a2590cdfdc9d	ee0c23a3-0eb3-4d06-9b63-e89466584e21	UUID	id	Id	"uuid"	Id	Icon123	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-b04a-40e1-8ae1-1a2b3c4d5e6f	4a5dec44-2fb8-4d70-a6e0-6f483b222082
0a0c0c60-ca6a-49a1-b8de-fcb6d8ef1749	ee0c23a3-0eb3-4d06-9b63-e89466584e21	DATE_TIME	createdAt	Creation date	"now"	Creation date	IconCalendar	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-b04b-40e2-9be2-2b3c4d5e6f7a	4a5dec44-2fb8-4d70-a6e0-6f483b222082
e6f9f328-8a38-4ba5-a207-e588d1e8ea93	711ed2e9-cc32-45af-ba39-7066034c618e	SELECT	syncStage	Sync stage	"'PENDING_CONFIGURATION'"	Sync stage	IconStatusChange	\N	[{"id": "20202020-1f62-4d79-a633-33a0e4fce9a6", "color": "blue", "label": "Messages list fetch pending", "value": "MESSAGE_LIST_FETCH_PENDING", "position": 0}, {"id": "20202020-d24f-4c3d-94a6-86c42e0f51d7", "color": "green", "label": "Messages list fetch scheduled", "value": "MESSAGE_LIST_FETCH_SCHEDULED", "position": 1}, {"id": "20202020-8751-408a-ae46-21a51b76be28", "color": "orange", "label": "Messages list fetch ongoing", "value": "MESSAGE_LIST_FETCH_ONGOING", "position": 2}, {"id": "20202020-1cfa-4a7d-a82d-93c8e29d0671", "color": "blue", "label": "Messages import pending", "value": "MESSAGES_IMPORT_PENDING", "position": 3}, {"id": "20202020-341e-4fbd-9dbf-30a70828ca69", "color": "green", "label": "Messages import scheduled", "value": "MESSAGES_IMPORT_SCHEDULED", "position": 4}, {"id": "20202020-e944-4594-ab81-fdbc53a85026", "color": "orange", "label": "Messages import ongoing", "value": "MESSAGES_IMPORT_ONGOING", "position": 5}, {"id": "20202020-f7c5-4756-9084-02f6a0b1a5f8", "color": "red", "label": "Failed", "value": "FAILED", "position": 6}, {"id": "20202020-0ede-4c75-84f1-29c8309829ec", "color": "gray", "label": "Pending configuration", "value": "PENDING_CONFIGURATION", "position": 7}]	\N	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-7979-4b08-89fe-99cb5e698767	4a5dec44-2fb8-4d70-a6e0-6f483b222082
9d2899d5-44d1-46c3-8729-ff9fb3d7955f	711ed2e9-cc32-45af-ba39-7066034c618e	DATE_TIME	syncStageStartedAt	Sync stage started at	\N	Sync stage started at	IconHistory	\N	\N	\N	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-8c61-4a42-ae63-73c1c3c52e06	4a5dec44-2fb8-4d70-a6e0-6f483b222082
8511cca8-38e3-4521-a2be-cdfacaf97694	711ed2e9-cc32-45af-ba39-7066034c618e	NUMBER	throttleFailureCount	Throttle Failure Count	0	Throttle Failure Count	IconX	\N	\N	\N	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-0291-42be-9ad0-d578a51684ab	4a5dec44-2fb8-4d70-a6e0-6f483b222082
c4f86077-c7d2-4835-9ad5-b7b9d62c3471	711ed2e9-cc32-45af-ba39-7066034c618e	DATE_TIME	throttleRetryAfter	Throttle Retry After	\N	Throttle Retry After	IconClock	\N	\N	\N	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-a1e3-4d7f-b5c2-9f8e6d4c3b2a	4a5dec44-2fb8-4d70-a6e0-6f483b222082
085f652b-8888-46e4-b82e-200873595269	e48dd522-875c-4937-9d9b-3a41a8cb0f1e	UUID	id	Id	"uuid"	Id	Icon123	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-b03a-40d1-8ad1-dcedfefaabbc	4a5dec44-2fb8-4d70-a6e0-6f483b222082
f9e77c8b-6635-41de-8850-f2b3a9c155dc	e48dd522-875c-4937-9d9b-3a41a8cb0f1e	DATE_TIME	createdAt	Creation date	"now"	Creation date	IconCalendar	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-b03b-40d2-9bd2-edfefaabbccd	4a5dec44-2fb8-4d70-a6e0-6f483b222082
e9f8c7e3-4a13-4fba-9e4d-b055f5732804	e48dd522-875c-4937-9d9b-3a41a8cb0f1e	DATE_TIME	updatedAt	Last update	"now"	Last time the record was changed	IconCalendarClock	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-b03c-40d3-8cd3-fefaabbccdde	4a5dec44-2fb8-4d70-a6e0-6f483b222082
424f276b-c92c-4544-a17b-5f0975ff3be3	e48dd522-875c-4937-9d9b-3a41a8cb0f1e	DATE_TIME	deletedAt	Deleted at	\N	Date when the record was deleted	IconCalendarMinus	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-b03d-40d4-9dd4-faabbccddeef	4a5dec44-2fb8-4d70-a6e0-6f483b222082
b20b8886-ac87-4270-8405-4c4ca125162e	e48dd522-875c-4937-9d9b-3a41a8cb0f1e	ACTOR	createdBy	Created by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The creator of the record	IconCreativeCommonsSa	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	bfe19f84-b640-4ce3-b771-4e7bf18bad14	4a5dec44-2fb8-4d70-a6e0-6f483b222082
ee56f73d-9296-4b10-9690-749a485f24a8	e48dd522-875c-4937-9d9b-3a41a8cb0f1e	ACTOR	updatedBy	Updated by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The workspace member who last updated the record	IconUserCircle	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	7ec7eea8-8715-4656-a602-3cb4256aaca1	4a5dec44-2fb8-4d70-a6e0-6f483b222082
75942f51-ee16-49d0-b1a8-d6e7b0072f35	e48dd522-875c-4937-9d9b-3a41a8cb0f1e	POSITION	position	Position	0	Message Folder record position	IconHierarchy2	\N	\N	\N	f	t	t	f	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	5317d4f4-12c5-469d-8e47-0f3b2ffc95b4	4a5dec44-2fb8-4d70-a6e0-6f483b222082
93975181-385a-4677-aeb7-c1786f8318cf	e48dd522-875c-4937-9d9b-3a41a8cb0f1e	TS_VECTOR	searchVector	Search vector	\N	Field used for full-text search	IconUser	\N	\N	{"asExpression": "to_tsvector('simple', COALESCE(public.unaccent_immutable(\\"name\\"), ''))", "generatedType": "STORED"}	f	t	t	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	5f2d3937-bafd-4d71-b4cb-b34037efd2e1	4a5dec44-2fb8-4d70-a6e0-6f483b222082
13eb85ff-f807-4c51-9e54-ea9b7d8a9f8d	e48dd522-875c-4937-9d9b-3a41a8cb0f1e	TEXT	name	Name	\N	Folder name	IconFolder	\N	\N	\N	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-7cf8-40bc-a681-b80b771449b7	4a5dec44-2fb8-4d70-a6e0-6f483b222082
854bdfd3-fb01-4241-84e4-1fdc7eec82e7	e48dd522-875c-4937-9d9b-3a41a8cb0f1e	TEXT	syncCursor	Sync Cursor	\N	Sync Cursor	IconHash	\N	\N	\N	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-98cd-49ed-8dfc-cb5796400e64	4a5dec44-2fb8-4d70-a6e0-6f483b222082
eb9862d2-c629-4413-96d5-e48e134c1cd5	e48dd522-875c-4937-9d9b-3a41a8cb0f1e	BOOLEAN	isSentFolder	Is Sent Folder	false	Is Sent Folder	IconCheck	\N	\N	\N	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-2af5-4a25-b2de-3c9386da941b	4a5dec44-2fb8-4d70-a6e0-6f483b222082
76b8e1fc-07ca-4e9b-a78b-3840002b3883	e48dd522-875c-4937-9d9b-3a41a8cb0f1e	BOOLEAN	isSynced	Is Synced	false	Is Synced	IconCheck	\N	\N	\N	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-764f-4e09-8f95-cd46b6bfe3c4	4a5dec44-2fb8-4d70-a6e0-6f483b222082
e4f3fd6e-c349-4313-acf7-950d9fa8b1b4	e48dd522-875c-4937-9d9b-3a41a8cb0f1e	TEXT	parentFolderId	Parent Folder ID	\N	Parent Folder ID	IconFolder	\N	\N	\N	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-e45d-49de-a4aa-587bbf9601f3	4a5dec44-2fb8-4d70-a6e0-6f483b222082
ef750908-bb80-4987-b530-ff20230430f6	e48dd522-875c-4937-9d9b-3a41a8cb0f1e	TEXT	externalId	External ID	\N	External ID	IconHash	\N	\N	\N	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-f3a8-4d2b-9c7e-1b5f9a8e4c6d	4a5dec44-2fb8-4d70-a6e0-6f483b222082
90e5d6fa-5cf1-41bd-ac70-07625b3af698	e48dd522-875c-4937-9d9b-3a41a8cb0f1e	SELECT	pendingSyncAction	Pending Sync Action	"'NONE'"	Pending action for folder sync	IconReload	\N	[{"id": "20202020-dc59-4dd3-92fe-f41c6491a588", "color": "red", "label": "Folder deletion", "value": "FOLDER_DELETION", "position": 0}, {"id": "20202020-aa29-41d3-872b-142174fe6595", "color": "blue", "label": "None", "value": "NONE", "position": 1}]	\N	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-4f97-4c79-9517-16387fe237f7	4a5dec44-2fb8-4d70-a6e0-6f483b222082
b7ca047e-f265-4c59-8c82-415ef7296a13	e48dd522-875c-4937-9d9b-3a41a8cb0f1e	UUID	messageChannelId	Message Channel	\N	Message Channel	IconMessage	\N	\N	\N	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-c9f8-43db-a3e7-7f2e8b5d9c1a	4a5dec44-2fb8-4d70-a6e0-6f483b222082
074e9bef-fbb0-4b24-afc6-95b0d28b1f75	b03dcd32-17eb-4bd2-b529-7e0bbc7d4cdd	UUID	id	Id	"uuid"	Id	Icon123	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-a1b2-40b1-8ab1-6b7c8d9e0f1a	4a5dec44-2fb8-4d70-a6e0-6f483b222082
d74f88b6-80fb-4a19-ba69-1560f2b7d222	b03dcd32-17eb-4bd2-b529-7e0bbc7d4cdd	DATE_TIME	createdAt	Creation date	"now"	Creation date	IconCalendar	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-a1b3-40b2-9bb2-7c8d9e0f1a2b	4a5dec44-2fb8-4d70-a6e0-6f483b222082
0634cff5-202e-4c34-91db-ad61002779b7	b03dcd32-17eb-4bd2-b529-7e0bbc7d4cdd	DATE_TIME	updatedAt	Last update	"now"	Last time the record was changed	IconCalendarClock	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-a1b4-40b3-8cb3-8d9e0f1a2b3c	4a5dec44-2fb8-4d70-a6e0-6f483b222082
988da258-1635-40b4-a11a-b7c14604420c	b03dcd32-17eb-4bd2-b529-7e0bbc7d4cdd	DATE_TIME	deletedAt	Deleted at	\N	Date when the record was deleted	IconCalendarMinus	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-a1b5-40b4-9db4-9e0f1a2b3c4d	4a5dec44-2fb8-4d70-a6e0-6f483b222082
6fb73802-bde8-44a3-9be0-9d76bb6dcb1d	b03dcd32-17eb-4bd2-b529-7e0bbc7d4cdd	ACTOR	createdBy	Created by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The creator of the record	IconCreativeCommonsSa	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	f882a070-3393-4197-8140-b5858c6f7284	4a5dec44-2fb8-4d70-a6e0-6f483b222082
1a499399-3fd1-4f40-a24e-0a49040ae866	b03dcd32-17eb-4bd2-b529-7e0bbc7d4cdd	ACTOR	updatedBy	Updated by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The workspace member who last updated the record	IconUserCircle	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	107d13dc-a8ff-493c-8d04-72688c68f8c1	4a5dec44-2fb8-4d70-a6e0-6f483b222082
a8eb1c7b-1a54-41b6-960d-9bf9db8509a5	b03dcd32-17eb-4bd2-b529-7e0bbc7d4cdd	POSITION	position	Position	0	Message channel message association message folder record position	IconHierarchy2	\N	\N	\N	f	t	t	f	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	76fcf020-482a-4d6c-b7b1-ccd6410299fc	4a5dec44-2fb8-4d70-a6e0-6f483b222082
3d9913eb-fa15-45e5-b0ba-8b3418192608	ee0c23a3-0eb3-4d06-9b63-e89466584e21	DATE_TIME	updatedAt	Last update	"now"	Last time the record was changed	IconCalendarClock	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-b04c-40e3-8ce3-3c4d5e6f7a8b	4a5dec44-2fb8-4d70-a6e0-6f483b222082
eea8ed4b-1551-411d-931c-9a3d9a093d58	ee0c23a3-0eb3-4d06-9b63-e89466584e21	DATE_TIME	deletedAt	Deleted at	\N	Date when the record was deleted	IconCalendarMinus	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-b04d-40e4-9de4-4d5e6f7a8b9c	4a5dec44-2fb8-4d70-a6e0-6f483b222082
74b886a3-718b-4913-b855-6ea88e51d3be	ee0c23a3-0eb3-4d06-9b63-e89466584e21	ACTOR	createdBy	Created by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The creator of the record	IconCreativeCommonsSa	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	e0e6aa04-6ad5-4d12-8799-6febf00452c1	4a5dec44-2fb8-4d70-a6e0-6f483b222082
50d34e51-99f7-48c7-a1e0-3734afae12dc	ee0c23a3-0eb3-4d06-9b63-e89466584e21	ACTOR	updatedBy	Updated by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The workspace member who last updated the record	IconUserCircle	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	6c90fd49-22b8-4f91-b4eb-4b9af630e988	4a5dec44-2fb8-4d70-a6e0-6f483b222082
9dccb97a-bcd1-45ae-8cfa-d22e3c0d6084	ee0c23a3-0eb3-4d06-9b63-e89466584e21	POSITION	position	Position	0	Message Participant record position	IconHierarchy2	\N	\N	\N	f	t	t	f	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	f49ca74e-dcdf-445d-a707-3c22869b4e6c	4a5dec44-2fb8-4d70-a6e0-6f483b222082
4795b5bb-7ed6-4314-ad88-5b95cce7c49f	ee0c23a3-0eb3-4d06-9b63-e89466584e21	TS_VECTOR	searchVector	Search vector	\N	Field used for full-text search	IconUser	\N	\N	{"asExpression": "to_tsvector('simple', COALESCE(public.unaccent_immutable(\\"handle\\"), ''))", "generatedType": "STORED"}	f	t	t	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	80fec74f-cda7-46bd-ae37-8998bd4f992b	4a5dec44-2fb8-4d70-a6e0-6f483b222082
abfafa16-2077-4274-a8b5-5283d6629725	ee0c23a3-0eb3-4d06-9b63-e89466584e21	SELECT	role	Role	"'FROM'"	Role	IconAt	\N	[{"id": "20202020-761b-4f02-bc28-795f9a67be48", "color": "green", "label": "From", "value": "FROM", "position": 0}, {"id": "20202020-86bc-4cf1-a887-c992c1a0f97f", "color": "blue", "label": "To", "value": "TO", "position": 1}, {"id": "20202020-fc2b-431f-805c-650ab60c4f88", "color": "orange", "label": "Cc", "value": "CC", "position": 2}, {"id": "20202020-fc9c-436e-842a-7e3a9b92766f", "color": "red", "label": "Bcc", "value": "BCC", "position": 3}]	\N	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-65d1-42f4-8729-c9ec1f52aecd	4a5dec44-2fb8-4d70-a6e0-6f483b222082
d73214e6-dc4d-414e-874e-f171d63c9963	ee0c23a3-0eb3-4d06-9b63-e89466584e21	TEXT	handle	Handle	\N	Handle	IconAt	\N	\N	\N	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-2456-464e-b422-b965a4db4a0b	4a5dec44-2fb8-4d70-a6e0-6f483b222082
ab8bd762-8ea8-4d05-9f52-48210ca16ff5	ee0c23a3-0eb3-4d06-9b63-e89466584e21	TEXT	displayName	Display Name	\N	Display Name	IconUser	\N	\N	\N	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-36dd-4a4f-ac02-228425be9fac	4a5dec44-2fb8-4d70-a6e0-6f483b222082
5be29d53-63ec-4b0d-a233-ae665198e913	cc4a7ab5-3ba0-4ac7-9ae5-896edd7b3d25	UUID	id	Id	"uuid"	Id	Icon123	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-b05a-40f1-8af1-5e6f7a8b9cad	4a5dec44-2fb8-4d70-a6e0-6f483b222082
4646d9b6-d139-45d0-8322-ce83256e9613	cc4a7ab5-3ba0-4ac7-9ae5-896edd7b3d25	DATE_TIME	createdAt	Creation date	"now"	Creation date	IconCalendar	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-b05b-40f2-9bf2-6f7a8b9cadbe	4a5dec44-2fb8-4d70-a6e0-6f483b222082
ce4278c7-6f3c-4227-b013-9d77eddb8092	cc4a7ab5-3ba0-4ac7-9ae5-896edd7b3d25	DATE_TIME	updatedAt	Last update	"now"	Last time the record was changed	IconCalendarClock	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-b05c-40f3-8cf3-7a8b9cadbecf	4a5dec44-2fb8-4d70-a6e0-6f483b222082
d5e50d30-2c48-4273-8a03-d8245c9aefbc	cc4a7ab5-3ba0-4ac7-9ae5-896edd7b3d25	DATE_TIME	deletedAt	Deleted at	\N	Date when the record was deleted	IconCalendarMinus	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-b05d-40f4-9df4-8b9cadbecfda	4a5dec44-2fb8-4d70-a6e0-6f483b222082
34561624-6ced-4706-adaf-b1fd62fe3a8b	cc4a7ab5-3ba0-4ac7-9ae5-896edd7b3d25	ACTOR	createdBy	Created by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The creator of the record	IconCreativeCommonsSa	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	b50ce369-9905-46d9-b95b-5e4034d252aa	4a5dec44-2fb8-4d70-a6e0-6f483b222082
ab38e524-31d0-4254-be15-6dabe138b275	cc4a7ab5-3ba0-4ac7-9ae5-896edd7b3d25	ACTOR	updatedBy	Updated by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The workspace member who last updated the record	IconUserCircle	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20fbafd0-0a16-4785-b5a6-f1ef45ef304c	4a5dec44-2fb8-4d70-a6e0-6f483b222082
bcedf951-bf41-4b71-9b39-16cee75499d6	cc4a7ab5-3ba0-4ac7-9ae5-896edd7b3d25	POSITION	position	Position	0	Message Thread record position	IconHierarchy2	\N	\N	\N	f	t	t	f	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	7490a440-7a62-466e-ba93-75a2f2edfb1e	4a5dec44-2fb8-4d70-a6e0-6f483b222082
38ad327a-a6b5-48a1-ac29-c3bd9e812ccc	cc4a7ab5-3ba0-4ac7-9ae5-896edd7b3d25	TS_VECTOR	searchVector	Search vector	\N	Field used for full-text search	IconUser	\N	\N	{"asExpression": "to_tsvector('simple', COALESCE(public.unaccent_immutable(\\"subject\\"), ''))", "generatedType": "STORED"}	f	t	t	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	c63e091f-6528-4657-ad2a-b0a158f9e483	4a5dec44-2fb8-4d70-a6e0-6f483b222082
038a3b83-315b-4982-aa33-060d991e2957	cc4a7ab5-3ba0-4ac7-9ae5-896edd7b3d25	TEXT	subject	Subject	\N	Subject	IconMessage	\N	\N	\N	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	a8ddbf8c-1137-45d1-b89e-5ffbd83f67c8	4a5dec44-2fb8-4d70-a6e0-6f483b222082
9faed552-9c58-454e-b7f1-a6d0192ee888	8e627e4e-e9cf-4890-af92-46559fb5f36e	UUID	id	Id	"uuid"	Id	Icon123	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-b06a-4101-8a01-9cadbedfaeb1	4a5dec44-2fb8-4d70-a6e0-6f483b222082
abe4a9df-8395-4cfd-a827-7bae591a2811	8e627e4e-e9cf-4890-af92-46559fb5f36e	DATE_TIME	createdAt	Creation date	"now"	Creation date	IconCalendar	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-b06b-4102-9b02-adbecfeafbc2	4a5dec44-2fb8-4d70-a6e0-6f483b222082
5cb7fb26-7d98-4983-be0b-c2666d625d80	8e627e4e-e9cf-4890-af92-46559fb5f36e	DATE_TIME	updatedAt	Last update	"now"	Last time the record was changed	IconCalendarClock	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-b06c-4103-8c03-becfdfabfcd3	4a5dec44-2fb8-4d70-a6e0-6f483b222082
ccd6771a-85ea-41bd-b127-24c1c5bc07dd	8e627e4e-e9cf-4890-af92-46559fb5f36e	DATE_TIME	deletedAt	Deleted at	\N	Date when the record was deleted	IconCalendarMinus	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-b06d-4104-9d04-cfdfabecdde4	4a5dec44-2fb8-4d70-a6e0-6f483b222082
b5b3ccf7-ac4a-4bcd-a4e0-2343b0691336	8e627e4e-e9cf-4890-af92-46559fb5f36e	ACTOR	createdBy	Created by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The creator of the record	IconCreativeCommonsSa	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	6e52bde4-ed41-4462-aa70-121e496270b4	4a5dec44-2fb8-4d70-a6e0-6f483b222082
14e3071e-fbac-4c4c-b0ac-7a6f52997177	8e627e4e-e9cf-4890-af92-46559fb5f36e	ACTOR	updatedBy	Updated by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The workspace member who last updated the record	IconUserCircle	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	7822dcc0-ee40-4af0-a6fe-f10a14e72b24	4a5dec44-2fb8-4d70-a6e0-6f483b222082
d133b3ce-4693-4317-86b6-9d2f13d0559d	8e627e4e-e9cf-4890-af92-46559fb5f36e	POSITION	position	Position	0	Message record position	IconHierarchy2	\N	\N	\N	f	t	t	f	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	06c5052d-3369-4d6d-8eaa-f9780eddb1fd	4a5dec44-2fb8-4d70-a6e0-6f483b222082
5967ee10-b823-48e4-b251-109acfa629e9	8e627e4e-e9cf-4890-af92-46559fb5f36e	TS_VECTOR	searchVector	Search vector	\N	Field used for full-text search	IconUser	\N	\N	{"asExpression": "to_tsvector('simple', COALESCE(public.unaccent_immutable(\\"subject\\"), ''))", "generatedType": "STORED"}	f	t	t	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	529b6008-4a12-4d48-bbc3-26a3f199bafd	4a5dec44-2fb8-4d70-a6e0-6f483b222082
0169f089-01ef-494b-af06-938b785a2148	8e627e4e-e9cf-4890-af92-46559fb5f36e	TEXT	headerMessageId	Header message Id	\N	Message id from the message header	IconHash	\N	\N	\N	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-72b5-416d-aed8-b55609067d01	4a5dec44-2fb8-4d70-a6e0-6f483b222082
0cab52bf-5153-46fd-8f8a-3b865508fc7d	8e627e4e-e9cf-4890-af92-46559fb5f36e	SELECT	direction	Direction	"'INCOMING'"	Message Direction	IconDirection	\N	[{"id": "20202020-7b52-47d2-abd8-e96a4295f9a6", "color": "green", "label": "Incoming", "value": "INCOMING", "position": 0}, {"id": "20202020-11cb-42be-8df7-709ad53f90f9", "color": "blue", "label": "Outgoing", "value": "OUTGOING", "position": 1}]	\N	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-0203-4118-8e2a-05b9bdae6dab	4a5dec44-2fb8-4d70-a6e0-6f483b222082
3a73b856-56c3-41f2-9cd0-b666cfdc8215	8e627e4e-e9cf-4890-af92-46559fb5f36e	TEXT	subject	Subject	\N	Subject	IconMessage	\N	\N	\N	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-52d1-4036-b9ae-84bd722bb37a	4a5dec44-2fb8-4d70-a6e0-6f483b222082
d06f3850-b597-4cb4-884d-456816d904f1	8e627e4e-e9cf-4890-af92-46559fb5f36e	DATE_TIME	receivedAt	Received At	\N	The date the message was received	IconCalendar	\N	\N	\N	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-140a-4a2a-9f86-f13b6a979afc	4a5dec44-2fb8-4d70-a6e0-6f483b222082
ba889187-f6d0-42b1-b853-90ce3c40379d	0996fb48-437d-4a52-a0bd-098f18a09105	UUID	id	Id	"uuid"	Id	Icon123	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-c01a-4111-8a11-dfabcddeef12	4a5dec44-2fb8-4d70-a6e0-6f483b222082
f44bc3b5-8eb8-4425-a21b-59536322c915	0996fb48-437d-4a52-a0bd-098f18a09105	DATE_TIME	createdAt	Creation date	"now"	Creation date	IconCalendar	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-c01b-4112-9b12-fabcddefe123	4a5dec44-2fb8-4d70-a6e0-6f483b222082
968499bd-9c3e-4019-b64e-188f4ae31a36	0996fb48-437d-4a52-a0bd-098f18a09105	DATE_TIME	updatedAt	Last update	"now"	Last time the record was changed	IconCalendarClock	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-c01c-4113-8c13-abcddeef1234	4a5dec44-2fb8-4d70-a6e0-6f483b222082
5d98a57f-8087-42cb-9298-64ee8fee542f	0996fb48-437d-4a52-a0bd-098f18a09105	DATE_TIME	deletedAt	Deleted at	\N	Date when the record was deleted	IconCalendarMinus	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-c01d-4114-9d14-bcddeef12345	4a5dec44-2fb8-4d70-a6e0-6f483b222082
974d99d9-fd68-4057-ad32-e0df44deeb36	0996fb48-437d-4a52-a0bd-098f18a09105	POSITION	position	Position	0	Note record position	IconHierarchy2	\N	\N	\N	f	t	t	f	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-368d-4dc2-943f-ed8a49c7fdfb	4a5dec44-2fb8-4d70-a6e0-6f483b222082
060ef747-7b7a-40b0-a358-4c244e73cbde	0996fb48-437d-4a52-a0bd-098f18a09105	TEXT	title	Title	\N	Note title	IconNotes	\N	\N	\N	f	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-faeb-4c76-8ba6-ccbb0b4a965f	4a5dec44-2fb8-4d70-a6e0-6f483b222082
270762a7-dfb5-4e98-a901-2543768043e6	0996fb48-437d-4a52-a0bd-098f18a09105	RICH_TEXT	bodyV2	Body	\N	Note body	IconFilePencil	\N	\N	\N	f	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-a7bb-4d94-be51-8f25181502c8	4a5dec44-2fb8-4d70-a6e0-6f483b222082
999c7efb-9f34-467c-b085-af1f7f58eb3d	0996fb48-437d-4a52-a0bd-098f18a09105	ACTOR	createdBy	Created by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The creator of the record	IconCreativeCommonsSa	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-0d79-4e21-ab77-5a394eff97be	4a5dec44-2fb8-4d70-a6e0-6f483b222082
b0d2b24e-d4d4-4554-a019-605c8d8d7199	0996fb48-437d-4a52-a0bd-098f18a09105	ACTOR	updatedBy	Updated by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The workspace member who last updated the record	IconUserCircle	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	9b446e89-2484-4044-a3b5-420f6b578c0c	4a5dec44-2fb8-4d70-a6e0-6f483b222082
14e58d0c-6fcf-4481-abbf-e1939623f5fc	0996fb48-437d-4a52-a0bd-098f18a09105	TS_VECTOR	searchVector	Search vector	\N	Field used for full-text search	IconUser	\N	\N	{"asExpression": "to_tsvector('simple', COALESCE(public.unaccent_immutable(\\"title\\"), '') || ' ' || COALESCE(public.unaccent_immutable(\\"bodyV2Markdown\\"), ''))", "generatedType": "STORED"}	f	t	t	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-7ea8-44d4-9d4c-51dd2a757950	4a5dec44-2fb8-4d70-a6e0-6f483b222082
496756f5-1089-4bd0-88cc-d953371b7d3a	2f8e7625-5a41-40dd-be67-29f99a4dc30e	UUID	id	Id	"uuid"	Id	Icon123	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-c02a-4121-8a21-cddeef123456	4a5dec44-2fb8-4d70-a6e0-6f483b222082
32ed18e4-cafd-4c67-b61b-d4d6e22ea385	2f8e7625-5a41-40dd-be67-29f99a4dc30e	DATE_TIME	createdAt	Creation date	"now"	Creation date	IconCalendar	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-c02b-4122-9b22-ddeef1234567	4a5dec44-2fb8-4d70-a6e0-6f483b222082
a871d358-a0b9-4ff1-aa95-b49c04a52965	2f8e7625-5a41-40dd-be67-29f99a4dc30e	DATE_TIME	updatedAt	Last update	"now"	Last time the record was changed	IconCalendarClock	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-c02c-4123-8c23-eef12345678a	4a5dec44-2fb8-4d70-a6e0-6f483b222082
f96f082f-78fa-4d8c-97ec-76e4c17b0605	2f8e7625-5a41-40dd-be67-29f99a4dc30e	DATE_TIME	deletedAt	Deleted at	\N	Date when the record was deleted	IconCalendarMinus	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-c02d-4124-9d24-ef123456789b	4a5dec44-2fb8-4d70-a6e0-6f483b222082
991a907f-6e46-4004-ba19-0a13e4d9358f	2f8e7625-5a41-40dd-be67-29f99a4dc30e	ACTOR	createdBy	Created by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The creator of the record	IconCreativeCommonsSa	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	820a3163-bb7d-41bc-93d9-81a464559c48	4a5dec44-2fb8-4d70-a6e0-6f483b222082
0ffabd93-b342-43f8-a5fc-01c0be0f2073	2f8e7625-5a41-40dd-be67-29f99a4dc30e	ACTOR	updatedBy	Updated by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The workspace member who last updated the record	IconUserCircle	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	a48c2bae-fe78-4d9d-bc37-f56d1a462121	4a5dec44-2fb8-4d70-a6e0-6f483b222082
1227fb98-ac85-4ce9-8a25-8802d252ac62	2f8e7625-5a41-40dd-be67-29f99a4dc30e	POSITION	position	Position	0	NoteTarget record position	IconHierarchy2	\N	\N	\N	f	t	t	f	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	082f7c9e-5ccd-4056-8748-a428f65fa6f6	4a5dec44-2fb8-4d70-a6e0-6f483b222082
27c61408-7526-4516-89bc-55a0ad492c1e	2f8e7625-5a41-40dd-be67-29f99a4dc30e	TS_VECTOR	searchVector	Search vector	\N	Field used for full-text search	IconUser	\N	\N	{"asExpression": "to_tsvector('simple', COALESCE(\\"id\\"::text, ''))", "generatedType": "STORED"}	f	t	t	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	0cc32d0f-99ab-4fee-bf66-9e84bc8bce00	4a5dec44-2fb8-4d70-a6e0-6f483b222082
530072c4-0169-4c26-9d6a-03b2d6d66671	19d8f9ef-3d91-4bea-8281-59d7548d04da	UUID	id	Id	"uuid"	Id	Icon123	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-d01a-4131-8a31-f123456789ab	4a5dec44-2fb8-4d70-a6e0-6f483b222082
fc5acd1f-1ec2-4d24-b1af-ef62be0cf6a0	19d8f9ef-3d91-4bea-8281-59d7548d04da	DATE_TIME	createdAt	Creation date	"now"	Creation date	IconCalendar	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-d01b-4132-9b32-123456789abc	4a5dec44-2fb8-4d70-a6e0-6f483b222082
12fd1a34-7f9a-45ac-97cb-038546c0aeb9	19d8f9ef-3d91-4bea-8281-59d7548d04da	DATE_TIME	updatedAt	Last update	"now"	Last time the record was changed	IconCalendarClock	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-d01c-4133-8c33-23456789abcd	4a5dec44-2fb8-4d70-a6e0-6f483b222082
88a9456f-1f9f-4114-bfff-a7374311f6e5	19d8f9ef-3d91-4bea-8281-59d7548d04da	DATE_TIME	deletedAt	Deleted at	\N	Date when the record was deleted	IconCalendarMinus	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-d01d-4134-9d34-3456789abcde	4a5dec44-2fb8-4d70-a6e0-6f483b222082
550596f2-be50-4653-808b-2f9e6d9e0034	19d8f9ef-3d91-4bea-8281-59d7548d04da	TEXT	name	Name	\N	The opportunity name	IconTargetArrow	\N	\N	\N	f	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-8609-4f65-a2d9-44009eb422b5	4a5dec44-2fb8-4d70-a6e0-6f483b222082
098d9623-f9fe-4218-ba8c-6ec048d1fe1b	19d8f9ef-3d91-4bea-8281-59d7548d04da	CURRENCY	amount	Amount	\N	Opportunity amount	IconCurrencyDollar	\N	\N	\N	f	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-583e-4642-8533-db761d5fa82f	4a5dec44-2fb8-4d70-a6e0-6f483b222082
ac063534-c91e-40de-8f37-43d34df17166	19d8f9ef-3d91-4bea-8281-59d7548d04da	DATE_TIME	closeDate	Close date	\N	Opportunity close date	IconCalendarEvent	\N	\N	\N	f	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-527e-44d6-b1ac-c4158d307b97	4a5dec44-2fb8-4d70-a6e0-6f483b222082
adb354b9-5400-4e8f-ae82-4d527e6da842	19d8f9ef-3d91-4bea-8281-59d7548d04da	SELECT	stage	Stage	"'NEW'"	Opportunity stage	IconProgressCheck	\N	[{"id": "20202020-8e01-4afd-9c39-d2063097587a", "color": "red", "label": "New", "value": "NEW", "position": 0}, {"id": "20202020-e685-4671-ac32-26d304dacb6e", "color": "purple", "label": "Screening", "value": "SCREENING", "position": 1}, {"id": "20202020-dde9-4acc-b5ca-f6531a8ecb4a", "color": "sky", "label": "Meeting", "value": "MEETING", "position": 2}, {"id": "20202020-696e-4f6b-91bc-f413e9b2f654", "color": "turquoise", "label": "Proposal", "value": "PROPOSAL", "position": 3}, {"id": "20202020-0bb5-4a6f-a8b2-774bbad21104", "color": "yellow", "label": "Customer", "value": "CUSTOMER", "position": 4}]	\N	f	t	f	f	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-6f76-477d-8551-28cd65b2b4b9	4a5dec44-2fb8-4d70-a6e0-6f483b222082
434bca94-ab2c-44e6-9218-41219500c8df	19d8f9ef-3d91-4bea-8281-59d7548d04da	POSITION	position	Position	0	Opportunity record position	IconHierarchy2	\N	\N	\N	f	t	t	f	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-806d-493a-bbc6-6313e62958e2	4a5dec44-2fb8-4d70-a6e0-6f483b222082
68cf732b-0680-44a7-b323-32b8aeac4738	19d8f9ef-3d91-4bea-8281-59d7548d04da	ACTOR	createdBy	Created by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The creator of the record	IconCreativeCommonsSa	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-a63e-4a62-8e63-42a51828f831	4a5dec44-2fb8-4d70-a6e0-6f483b222082
0bc34840-ae84-4c90-adb2-80e9ee962a5f	a64cec42-2523-4102-b0d6-fdbb2f937bb6	UUID	id	Id	"uuid"	Id	Icon123	\N	\N	\N	f	t	t	t	f	t	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 12:15:04.225+00	2026-04-25 12:15:04.225+00	4c10d15a-cd6a-4d8d-83c3-1e6c57486b9f	8c07d085-7bf4-4849-934d-3c70dcf4340d
1d3e8094-81b3-4697-a0ab-eda0f8781686	19d8f9ef-3d91-4bea-8281-59d7548d04da	ACTOR	updatedBy	Updated by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The workspace member who last updated the record	IconUserCircle	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	3c8a6095-3f64-4e81-a59e-66c2bd181e11	4a5dec44-2fb8-4d70-a6e0-6f483b222082
ac55ade0-43da-4f34-9fef-2188f69242d4	19d8f9ef-3d91-4bea-8281-59d7548d04da	TS_VECTOR	searchVector	Search vector	\N	Field used for full-text search	IconUser	\N	\N	{"asExpression": "to_tsvector('simple', COALESCE(public.unaccent_immutable(\\"name\\"), ''))", "generatedType": "STORED"}	f	t	t	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	428a0da5-4b2e-4ce3-b695-89a8b384e6e3	4a5dec44-2fb8-4d70-a6e0-6f483b222082
e329d2d4-4879-47da-8402-401b5966faa1	f59c15d0-9a52-4e93-b44f-ed4fc4bd90be	UUID	id	Id	"uuid"	Id	Icon123	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-e01a-4141-8a41-456789abcdef	4a5dec44-2fb8-4d70-a6e0-6f483b222082
f19480c3-fb79-4813-8532-8d78dd80c5af	f59c15d0-9a52-4e93-b44f-ed4fc4bd90be	DATE_TIME	createdAt	Creation date	"now"	Creation date	IconCalendar	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-e01b-4142-9b42-56789abcdefa	4a5dec44-2fb8-4d70-a6e0-6f483b222082
5cb03ab1-1739-4408-bd99-a263dc5cc9ca	f59c15d0-9a52-4e93-b44f-ed4fc4bd90be	DATE_TIME	updatedAt	Last update	"now"	Last time the record was changed	IconCalendarClock	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-e01c-4143-8c43-6789abcdefab	4a5dec44-2fb8-4d70-a6e0-6f483b222082
b7c859be-b75e-4734-8f25-ff5735e259ac	f59c15d0-9a52-4e93-b44f-ed4fc4bd90be	DATE_TIME	deletedAt	Deleted at	\N	Date when the record was deleted	IconCalendarMinus	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-e01d-4144-9d44-789abcdefabc	4a5dec44-2fb8-4d70-a6e0-6f483b222082
643bc00b-8772-46ed-bd47-00acc00fb8a5	f59c15d0-9a52-4e93-b44f-ed4fc4bd90be	FULL_NAME	name	Name	\N	Contact's name	IconUser	\N	\N	\N	f	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-3875-44d5-8c33-a6239011cab8	4a5dec44-2fb8-4d70-a6e0-6f483b222082
0d02b1fa-feb0-48dc-a361-95533309ea0f	f59c15d0-9a52-4e93-b44f-ed4fc4bd90be	EMAILS	emails	Emails	\N	Contact's Emails	IconMail	\N	\N	{"maxNumberOfValues": 1}	f	t	f	f	t	t	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-3c51-43fa-8b6e-af39e29368ab	4a5dec44-2fb8-4d70-a6e0-6f483b222082
32f2fd13-d449-4abf-8f35-f72eb7b44560	f59c15d0-9a52-4e93-b44f-ed4fc4bd90be	LINKS	linkedinLink	Linkedin	\N	Contact's Linkedin account	IconBrandLinkedin	\N	\N	\N	f	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-f1af-48f7-893b-2007a73dd508	4a5dec44-2fb8-4d70-a6e0-6f483b222082
08b80a08-0360-4346-aa0e-a406666210ba	f59c15d0-9a52-4e93-b44f-ed4fc4bd90be	LINKS	xLink	X	\N	Contact's X/Twitter account	IconBrandX	\N	\N	\N	f	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-8fc2-487c-b84a-55a99b145cfd	4a5dec44-2fb8-4d70-a6e0-6f483b222082
4f8fedc8-8be0-4c53-8363-a8b2c6116962	f59c15d0-9a52-4e93-b44f-ed4fc4bd90be	TEXT	jobTitle	Job Title	\N	Contact's job title	IconBriefcase	\N	\N	\N	f	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-b0d0-415a-bef9-640a26dacd9b	4a5dec44-2fb8-4d70-a6e0-6f483b222082
a431ac64-8f23-4a8b-abfa-1c0185afddbb	f59c15d0-9a52-4e93-b44f-ed4fc4bd90be	PHONES	phones	Phones	\N	Contact's phone numbers	IconPhone	\N	\N	{"maxNumberOfValues": 1}	f	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-0638-448e-8825-439134618022	4a5dec44-2fb8-4d70-a6e0-6f483b222082
b9c947b4-e238-44ff-89d9-11a2de5ae267	f59c15d0-9a52-4e93-b44f-ed4fc4bd90be	TEXT	city	City	\N	Contact's city	IconMap	\N	\N	\N	f	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-5243-4ffb-afc5-2c675da41346	4a5dec44-2fb8-4d70-a6e0-6f483b222082
10e09fbb-ce99-4271-a1bf-3ee3eeb593f7	f59c15d0-9a52-4e93-b44f-ed4fc4bd90be	TEXT	avatarUrl	Avatar	\N	Contact's avatar	IconFileUpload	\N	\N	\N	f	t	t	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-b8a6-40df-961c-373dc5d2ec21	4a5dec44-2fb8-4d70-a6e0-6f483b222082
7905e868-5470-44dc-8e22-f3db7cae022d	f59c15d0-9a52-4e93-b44f-ed4fc4bd90be	FILES	avatarFile	Avatar File	\N	Contact's avatar file	IconFileUpload	\N	\N	{"maxNumberOfValues": 1}	f	t	t	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-a7c9-4e3d-8f1b-2d5a6b7c8e9f	4a5dec44-2fb8-4d70-a6e0-6f483b222082
273db0f6-c9ec-4c22-86a9-e6dbba09c5a7	f59c15d0-9a52-4e93-b44f-ed4fc4bd90be	POSITION	position	Position	0	Person record Position	IconHierarchy2	\N	\N	\N	f	t	t	f	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-fcd5-4231-aff5-fff583eaa0b1	4a5dec44-2fb8-4d70-a6e0-6f483b222082
ea2b28f9-8389-416c-82b1-61cb0a6fc1cf	f59c15d0-9a52-4e93-b44f-ed4fc4bd90be	ACTOR	createdBy	Created by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The creator of the record	IconCreativeCommonsSa	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-f6ab-4d98-af24-a3d5b664148a	4a5dec44-2fb8-4d70-a6e0-6f483b222082
aaf0a4d0-8ec1-40ae-aa77-47f2d4289947	f59c15d0-9a52-4e93-b44f-ed4fc4bd90be	ACTOR	updatedBy	Updated by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The workspace member who last updated the record	IconUserCircle	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	e9e0dd35-184c-4742-84da-afadf45ce59a	4a5dec44-2fb8-4d70-a6e0-6f483b222082
907bf219-de82-4bad-806e-e2bd9431adc9	f59c15d0-9a52-4e93-b44f-ed4fc4bd90be	TS_VECTOR	searchVector	Search vector	\N	Field used for full-text search	IconUser	\N	\N	{"asExpression": "to_tsvector('simple', COALESCE(public.unaccent_immutable(\\"nameFirstName\\"), '') || ' ' || COALESCE(public.unaccent_immutable(\\"nameLastName\\"), '') || ' ' || \\n      COALESCE(public.unaccent_immutable(\\"emailsPrimaryEmail\\"), '') || ' ' ||\\n      COALESCE(public.unaccent_immutable(SPLIT_PART(\\"emailsPrimaryEmail\\", '@', 2)), '') || ' ' || COALESCE(public.unaccent_immutable(TRANSLATE(\\"emailsAdditionalEmails\\"::text, '[]\\",', '    ')), '') || ' ' || COALESCE(public.unaccent_immutable(TRANSLATE(REPLACE(\\"emailsAdditionalEmails\\"::text, '@', ' '), '[]\\",', '    ')), '') || ' ' || COALESCE(\\"phonesPrimaryPhoneNumber\\", '') || ' ' || COALESCE(\\"phonesPrimaryPhoneCallingCode\\", '') || ' ' || COALESCE(\\"phonesPrimaryPhoneCallingCode\\" || \\"phonesPrimaryPhoneNumber\\", '') || ' ' || COALESCE(REPLACE(\\"phonesPrimaryPhoneCallingCode\\", '+', '') || \\"phonesPrimaryPhoneNumber\\", '') || ' ' || COALESCE('0' || \\"phonesPrimaryPhoneNumber\\", '') || ' ' || COALESCE(TRANSLATE(regexp_replace(\\"phonesAdditionalPhones\\"::text, '\\"(number|countryCode|callingCode)\\"\\\\s*:\\\\s*', '', 'g'), '[]{}\\",:', '        '), '') || ' ' || COALESCE(public.unaccent_immutable(\\"jobTitle\\"), ''))", "generatedType": "STORED"}	f	t	t	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	57d1d7ad-fa10-44fc-82f3-ad0959ec2534	4a5dec44-2fb8-4d70-a6e0-6f483b222082
2bbeeb43-aeed-4a23-ba80-728801b417ad	a91a647d-4acf-456b-961b-40fbb3788c6d	UUID	id	Id	"uuid"	Id	Icon123	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-a02a-4151-8a51-89abcdefabcd	4a5dec44-2fb8-4d70-a6e0-6f483b222082
5bfa3350-9b01-4f20-a849-eaef691891e3	a91a647d-4acf-456b-961b-40fbb3788c6d	DATE_TIME	createdAt	Creation date	"now"	Creation date	IconCalendar	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-a02b-4152-9b52-9abcdefabcde	4a5dec44-2fb8-4d70-a6e0-6f483b222082
a7b5c198-9331-475a-98ee-4f31cb56b992	a91a647d-4acf-456b-961b-40fbb3788c6d	DATE_TIME	updatedAt	Last update	"now"	Last time the record was changed	IconCalendarClock	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-a02c-4153-8c53-abcdefabcdef	4a5dec44-2fb8-4d70-a6e0-6f483b222082
bbed8be2-7eb7-4eb5-ae57-9c7b1859dc05	a91a647d-4acf-456b-961b-40fbb3788c6d	DATE_TIME	deletedAt	Deleted at	\N	Date when the record was deleted	IconCalendarMinus	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-a02d-4154-9d54-bcdefabcdefa	4a5dec44-2fb8-4d70-a6e0-6f483b222082
18511061-1872-43da-b5de-8055c8d70c29	a91a647d-4acf-456b-961b-40fbb3788c6d	POSITION	position	Position	0	Task record position	IconHierarchy2	\N	\N	\N	f	t	t	f	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-7d47-4690-8a98-98b9a0c05dd8	4a5dec44-2fb8-4d70-a6e0-6f483b222082
6663c9ab-59e1-4ec0-acd8-4af184e36234	a91a647d-4acf-456b-961b-40fbb3788c6d	TEXT	title	Title	\N	Task title	IconNotes	\N	\N	\N	f	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-b386-4cb7-aa5a-08d4a4d92680	4a5dec44-2fb8-4d70-a6e0-6f483b222082
05e0bf33-79e1-4518-bc04-0d8d272cbd9c	a91a647d-4acf-456b-961b-40fbb3788c6d	RICH_TEXT	bodyV2	Body	\N	Task body	IconFilePencil	\N	\N	\N	f	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-4aa0-4ae8-898d-7df0afd47ab1	4a5dec44-2fb8-4d70-a6e0-6f483b222082
1201d175-702c-4239-a2b6-5994cecbd9e3	a91a647d-4acf-456b-961b-40fbb3788c6d	DATE_TIME	dueAt	Due Date	\N	Task due date	IconCalendarEvent	\N	\N	\N	f	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-fd99-40da-951b-4cb9a352fce3	4a5dec44-2fb8-4d70-a6e0-6f483b222082
cbed51ca-e5b9-419b-8040-2bdf34045c99	a91a647d-4acf-456b-961b-40fbb3788c6d	SELECT	status	Status	"'TODO'"	Task status	IconCheck	\N	[{"id": "20202020-3d31-4860-ad07-5c4603d44887", "color": "sky", "label": "To do", "value": "TODO", "position": 0}, {"id": "20202020-c559-4f8e-8b8e-21136da8684d", "color": "purple", "label": "In progress", "value": "IN_PROGRESS", "position": 1}, {"id": "20202020-c7a7-43ff-8226-f6a97a32759e", "color": "green", "label": "Done", "value": "DONE", "position": 2}]	\N	f	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-70bc-48f9-89c5-6aa730b151e0	4a5dec44-2fb8-4d70-a6e0-6f483b222082
c8b1f455-7aa2-49aa-82ba-2bc90d4e254e	a91a647d-4acf-456b-961b-40fbb3788c6d	ACTOR	createdBy	Created by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The creator of the record	IconCreativeCommonsSa	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-1a04-48ab-a567-576965ae5387	4a5dec44-2fb8-4d70-a6e0-6f483b222082
b3696dbe-7017-4075-ba7e-004aef2f80c1	a91a647d-4acf-456b-961b-40fbb3788c6d	ACTOR	updatedBy	Updated by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The workspace member who last updated the record	IconUserCircle	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	9e8bf518-f4ab-433e-9674-efb75fba2802	4a5dec44-2fb8-4d70-a6e0-6f483b222082
a8356afc-1b08-444e-b3da-daae79b3a381	a91a647d-4acf-456b-961b-40fbb3788c6d	TS_VECTOR	searchVector	Search vector	\N	Field used for full-text search	IconUser	\N	\N	{"asExpression": "to_tsvector('simple', COALESCE(public.unaccent_immutable(\\"title\\"), '') || ' ' || COALESCE(public.unaccent_immutable(\\"bodyV2Markdown\\"), ''))", "generatedType": "STORED"}	f	t	t	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-4746-4e2f-870c-52b02c67c90d	4a5dec44-2fb8-4d70-a6e0-6f483b222082
f11a7959-f6d3-4bf3-b85c-d2a24e3c3d8a	5277c856-9ccc-41e4-ae01-f077f1c61574	UUID	id	Id	"uuid"	Id	Icon123	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-a03a-4161-8a61-cdefabcdefab	4a5dec44-2fb8-4d70-a6e0-6f483b222082
79c55eb3-6c68-466b-b721-db2c0aacea74	5277c856-9ccc-41e4-ae01-f077f1c61574	DATE_TIME	createdAt	Creation date	"now"	Creation date	IconCalendar	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-a03b-4162-9b62-defabcdefabc	4a5dec44-2fb8-4d70-a6e0-6f483b222082
f68b65e1-7afd-4113-a130-884621f1b293	5277c856-9ccc-41e4-ae01-f077f1c61574	DATE_TIME	updatedAt	Last update	"now"	Last time the record was changed	IconCalendarClock	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-a03c-4163-8c63-efabcdefabcd	4a5dec44-2fb8-4d70-a6e0-6f483b222082
24463e3e-1cb8-464d-8070-79eea69e6a14	5277c856-9ccc-41e4-ae01-f077f1c61574	DATE_TIME	deletedAt	Deleted at	\N	Date when the record was deleted	IconCalendarMinus	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-a03d-4164-9d64-fabcdefabcde	4a5dec44-2fb8-4d70-a6e0-6f483b222082
8c15f98a-9fbf-471f-8fc0-06a596600509	5277c856-9ccc-41e4-ae01-f077f1c61574	ACTOR	createdBy	Created by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The creator of the record	IconCreativeCommonsSa	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	65fe2a53-45e4-4225-9711-b827f55e51cc	4a5dec44-2fb8-4d70-a6e0-6f483b222082
0803c946-a29c-4cf9-b77c-e34adb167c26	5277c856-9ccc-41e4-ae01-f077f1c61574	ACTOR	updatedBy	Updated by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The workspace member who last updated the record	IconUserCircle	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	bea3734f-aff2-49ed-9dc9-d4666a2e2178	4a5dec44-2fb8-4d70-a6e0-6f483b222082
cebac0db-b837-4d1a-bd4d-53ec958355bd	5277c856-9ccc-41e4-ae01-f077f1c61574	POSITION	position	Position	0	TaskTarget record position	IconHierarchy2	\N	\N	\N	f	t	t	f	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	4216c06a-498b-4111-9577-d9bcbccdda39	4a5dec44-2fb8-4d70-a6e0-6f483b222082
110e9ec5-f8d7-4189-930b-19ee015c0523	5277c856-9ccc-41e4-ae01-f077f1c61574	TS_VECTOR	searchVector	Search vector	\N	Field used for full-text search	IconUser	\N	\N	{"asExpression": "to_tsvector('simple', COALESCE(\\"id\\"::text, ''))", "generatedType": "STORED"}	f	t	t	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	8768a9c0-37c0-4465-b86d-c4c7f466ec23	4a5dec44-2fb8-4d70-a6e0-6f483b222082
79b7691c-b271-4774-9698-19a48dddb02f	22213a4b-0696-4b0b-90e1-975e86ba2902	UUID	id	Id	"uuid"	Id	Icon123	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-a01a-4081-8a81-9aabbccddeff	4a5dec44-2fb8-4d70-a6e0-6f483b222082
fd524654-e695-4dc1-a860-75351b3994ec	22213a4b-0696-4b0b-90e1-975e86ba2902	DATE_TIME	createdAt	Creation date	"now"	Creation date	IconCalendar	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-a01b-4082-9b82-aabbccddeeff	4a5dec44-2fb8-4d70-a6e0-6f483b222082
28ef1939-2e6c-446f-b1ff-eb07b38d8250	22213a4b-0696-4b0b-90e1-975e86ba2902	DATE_TIME	updatedAt	Last update	"now"	Last time the record was changed	IconCalendarClock	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-a01c-4083-8c83-bbccddeeffaa	4a5dec44-2fb8-4d70-a6e0-6f483b222082
b823e197-5239-4b3b-8830-0f2270db3698	22213a4b-0696-4b0b-90e1-975e86ba2902	DATE_TIME	deletedAt	Deleted at	\N	Date when the record was deleted	IconCalendarMinus	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-a01d-4084-9d84-ccddeeffaabb	4a5dec44-2fb8-4d70-a6e0-6f483b222082
351da18b-78f4-40de-b890-8e064f4222dc	22213a4b-0696-4b0b-90e1-975e86ba2902	ACTOR	createdBy	Created by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The creator of the record	IconCreativeCommonsSa	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	8f66191f-927d-4a6d-a15f-d0ff8cfc5a6d	4a5dec44-2fb8-4d70-a6e0-6f483b222082
36180681-bf63-47ab-8b41-0f00dd90b2f5	22213a4b-0696-4b0b-90e1-975e86ba2902	ACTOR	updatedBy	Updated by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The workspace member who last updated the record	IconUserCircle	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	81dc29fc-c872-4efd-bf31-d07872cd260e	4a5dec44-2fb8-4d70-a6e0-6f483b222082
634be97d-b6e2-4d71-b946-8f4430dd2add	22213a4b-0696-4b0b-90e1-975e86ba2902	POSITION	position	Position	0	Timeline activity record position	IconHierarchy2	\N	\N	\N	f	t	t	f	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	e245d799-3e4b-4c69-ab9a-6b7c91d71195	4a5dec44-2fb8-4d70-a6e0-6f483b222082
c5590fe1-039b-4655-a029-ed1191a1228f	22213a4b-0696-4b0b-90e1-975e86ba2902	DATE_TIME	happensAt	Creation date	"now"	Creation date	IconCalendar	\N	\N	\N	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-9526-4993-b339-c4318c4d39f0	4a5dec44-2fb8-4d70-a6e0-6f483b222082
64022fb2-0733-4676-b365-eb1383b031d2	22213a4b-0696-4b0b-90e1-975e86ba2902	TEXT	name	Event name	\N	Event name	IconAbc	\N	\N	\N	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-7207-46e8-9dab-849505ae8497	4a5dec44-2fb8-4d70-a6e0-6f483b222082
4914fa4a-6715-4d67-be58-23afb878ace8	22213a4b-0696-4b0b-90e1-975e86ba2902	RAW_JSON	properties	Event details	\N	Json value for event details	IconListDetails	\N	\N	\N	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-f142-4b04-b91b-6a2b4af3bf11	4a5dec44-2fb8-4d70-a6e0-6f483b222082
fee11081-5832-4ad2-a784-d460d127d8a2	22213a4b-0696-4b0b-90e1-975e86ba2902	TEXT	linkedRecordCachedName	Linked Record cached name	\N	Cached record name	IconAbc	\N	\N	\N	f	t	t	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-cfdb-4bef-bbce-a29f41230934	4a5dec44-2fb8-4d70-a6e0-6f483b222082
79185614-eda5-4a31-9fad-05daf3a2e596	22213a4b-0696-4b0b-90e1-975e86ba2902	UUID	linkedRecordId	Linked Record id	\N	Linked Record id	IconAbc	\N	\N	\N	f	t	t	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-2e0e-48c0-b445-ee6c1e61687d	4a5dec44-2fb8-4d70-a6e0-6f483b222082
963c03e8-f2e3-43e7-b874-8ad850fa97b0	22213a4b-0696-4b0b-90e1-975e86ba2902	UUID	linkedObjectMetadataId	Linked Object Metadata Id	\N	Linked Object Metadata Id	IconAbc	\N	\N	\N	f	t	t	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-c595-449d-9f89-562758c9ee69	4a5dec44-2fb8-4d70-a6e0-6f483b222082
3de520ef-dd68-48d7-8262-19374529499b	22213a4b-0696-4b0b-90e1-975e86ba2902	TS_VECTOR	searchVector	Search vector	\N	Field used for full-text search	IconUser	\N	\N	{"asExpression": "to_tsvector('simple', COALESCE(public.unaccent_immutable(\\"name\\"), ''))", "generatedType": "STORED"}	f	t	t	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	bc1d1b67-903a-4354-8272-4a6efc4cbe63	4a5dec44-2fb8-4d70-a6e0-6f483b222082
9c898a90-1b97-4dbc-a68a-8bd789f410e2	0f1f4454-5436-4ddd-b99b-5426058af575	UUID	id	Id	"uuid"	Id	Icon123	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-f02a-4181-8a81-efabcdefabcd	4a5dec44-2fb8-4d70-a6e0-6f483b222082
628f9e39-8249-4918-be7e-8d7bf47fc067	0f1f4454-5436-4ddd-b99b-5426058af575	DATE_TIME	createdAt	Creation date	"now"	Creation date	IconCalendar	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-f02b-4182-9b82-fabcdefabcde	4a5dec44-2fb8-4d70-a6e0-6f483b222082
a6a0162d-7eaa-47d6-bb1b-4e10807afb61	0f1f4454-5436-4ddd-b99b-5426058af575	DATE_TIME	updatedAt	Last update	"now"	Last time the record was changed	IconCalendarClock	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-f02c-4183-8c83-abcdefabcdef	4a5dec44-2fb8-4d70-a6e0-6f483b222082
cfbbd792-ec80-4cee-8df2-d53d093aea75	0f1f4454-5436-4ddd-b99b-5426058af575	DATE_TIME	deletedAt	Deleted at	\N	Date when the record was deleted	IconCalendarMinus	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-f02d-4184-9d84-bcdefabcdefa	4a5dec44-2fb8-4d70-a6e0-6f483b222082
f07e2729-d9af-40dd-b837-3e31e8028a98	0f1f4454-5436-4ddd-b99b-5426058af575	TEXT	name	Name	\N	The workflow name	IconSettingsAutomation	\N	\N	\N	f	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-b3d3-478f-acc0-5d901e725b20	4a5dec44-2fb8-4d70-a6e0-6f483b222082
e5dd47cc-8efd-4630-b206-2e87b36d11f8	0f1f4454-5436-4ddd-b99b-5426058af575	TEXT	lastPublishedVersionId	Last published Version Id	\N	The workflow last published version id	IconVersions	\N	\N	\N	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-326a-4fba-8639-3456c0a169e8	4a5dec44-2fb8-4d70-a6e0-6f483b222082
e04aa62b-87c8-4120-be6b-7ffe9a1e61b9	a64cec42-2523-4102-b0d6-fdbb2f937bb6	DATE_TIME	createdAt	Creation date	"now"	Creation date	IconCalendar	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 12:15:04.225+00	2026-04-25 12:15:04.225+00	162153ec-7874-4ad8-a26b-b52b0b7a87d1	8c07d085-7bf4-4849-934d-3c70dcf4340d
a8bd8932-3af3-4070-a9cb-64e58e6729f6	0f1f4454-5436-4ddd-b99b-5426058af575	MULTI_SELECT	statuses	Statuses	\N	The current statuses of the workflow versions	IconStatusChange	\N	[{"id": "20202020-e9d8-41df-8262-31bb04948366", "color": "yellow", "label": "Draft", "value": "DRAFT", "position": 0}, {"id": "20202020-e47e-4d57-913a-7b29e1f140ef", "color": "green", "label": "Active", "value": "ACTIVE", "position": 1}, {"id": "20202020-bdfa-4d35-bf5c-e410cccfc765", "color": "gray", "label": "Deactivated", "value": "DEACTIVATED", "position": 2}]	\N	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-357c-4432-8c50-8c31b4a552d9	4a5dec44-2fb8-4d70-a6e0-6f483b222082
9c7a62f6-2ad8-4b5f-b3b9-380a173b28f7	0f1f4454-5436-4ddd-b99b-5426058af575	POSITION	position	Position	0	Workflow record position	IconHierarchy2	\N	\N	\N	f	t	t	f	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-39b0-4d8c-8c5f-33c2326deb5f	4a5dec44-2fb8-4d70-a6e0-6f483b222082
feb38287-ad4c-4fd1-b631-cff0ae830f07	0f1f4454-5436-4ddd-b99b-5426058af575	ACTOR	createdBy	Created by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The creator of the record	IconCreativeCommonsSa	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-6007-401a-8aa5-e6f48581a6f3	4a5dec44-2fb8-4d70-a6e0-6f483b222082
dade4606-9546-4f2b-b6d7-e14d402dda45	0f1f4454-5436-4ddd-b99b-5426058af575	ACTOR	updatedBy	Updated by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The workspace member who last updated the record	IconUserCircle	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	3559831e-caf2-4eb5-9db1-b47bf968c774	4a5dec44-2fb8-4d70-a6e0-6f483b222082
33469b0f-7f2a-45c7-be4e-f684462d5e9b	0f1f4454-5436-4ddd-b99b-5426058af575	TS_VECTOR	searchVector	Search vector	\N	Field used for full-text search	IconUser	\N	\N	{"asExpression": "to_tsvector('simple', COALESCE(public.unaccent_immutable(\\"name\\"), ''))", "generatedType": "STORED"}	f	t	t	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-535d-4ffa-b7f3-4fa0d5da1b7a	4a5dec44-2fb8-4d70-a6e0-6f483b222082
322b10e9-8d52-4954-8fd2-aa845d70bfe6	c407d619-2c05-491f-b2fd-b9481d652bc9	UUID	id	Id	"uuid"	Id	Icon123	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-f01a-4171-8a71-abcdefabcdef	4a5dec44-2fb8-4d70-a6e0-6f483b222082
259969d1-1fbf-4d8f-8d29-2a4b7f54f010	c407d619-2c05-491f-b2fd-b9481d652bc9	DATE_TIME	createdAt	Creation date	"now"	Creation date	IconCalendar	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-f01b-4172-9b72-bcdefabcdefa	4a5dec44-2fb8-4d70-a6e0-6f483b222082
30ef687e-90bb-4878-a200-8b4bfe42c537	c407d619-2c05-491f-b2fd-b9481d652bc9	DATE_TIME	updatedAt	Last update	"now"	Last time the record was changed	IconCalendarClock	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-f01c-4173-8c73-cdefabcdefab	4a5dec44-2fb8-4d70-a6e0-6f483b222082
784d668a-6bef-4bc7-96d8-6727058041b9	c407d619-2c05-491f-b2fd-b9481d652bc9	DATE_TIME	deletedAt	Deleted at	\N	Date when the record was deleted	IconCalendarMinus	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-f01d-4174-9d74-defabcdefabc	4a5dec44-2fb8-4d70-a6e0-6f483b222082
cedac3b2-acfd-4438-b360-d46c2f5e416c	c407d619-2c05-491f-b2fd-b9481d652bc9	ACTOR	createdBy	Created by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The creator of the record	IconCreativeCommonsSa	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	5cea2f46-3779-4782-9fce-3062652e2dfd	4a5dec44-2fb8-4d70-a6e0-6f483b222082
2132da32-ba4b-48cc-a65e-bf4e3748cfaf	c407d619-2c05-491f-b2fd-b9481d652bc9	ACTOR	updatedBy	Updated by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The workspace member who last updated the record	IconUserCircle	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	017d3587-98bd-43ad-b5a6-cb8125105641	4a5dec44-2fb8-4d70-a6e0-6f483b222082
a9afd23e-f2b6-42e0-8781-6ff58cab9717	c407d619-2c05-491f-b2fd-b9481d652bc9	POSITION	position	Position	0	WorkflowAutomatedTrigger record position	IconHierarchy2	\N	\N	\N	f	t	t	f	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	f4c5eb0a-8a86-49a2-a775-941eaad98fc9	4a5dec44-2fb8-4d70-a6e0-6f483b222082
26384a1b-fa3a-4c9a-8ecf-f89d3f6afcca	c407d619-2c05-491f-b2fd-b9481d652bc9	TS_VECTOR	searchVector	Search vector	\N	Field used for full-text search	IconUser	\N	\N	{"asExpression": "to_tsvector('simple', COALESCE(\\"id\\"::text, ''))", "generatedType": "STORED"}	f	t	t	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	dae934ca-bfca-4101-8211-8eae6e2b5513	4a5dec44-2fb8-4d70-a6e0-6f483b222082
794053a0-1aae-464c-971d-ea5b49d93c87	c407d619-2c05-491f-b2fd-b9481d652bc9	SELECT	type	Automated Trigger Type	"'DATABASE_EVENT'"	The workflow automated trigger type	IconSettingsAutomation	\N	[{"id": "20202020-ccd5-4f45-9292-f6b2fe81b22c", "color": "green", "label": "Database Event", "value": "DATABASE_EVENT", "position": 0}, {"id": "20202020-07b8-4e8f-b218-997ac813c209", "color": "blue", "label": "Cron", "value": "CRON", "position": 1}]	\N	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-3319-4234-a34c-3f92c1ab56e7	4a5dec44-2fb8-4d70-a6e0-6f483b222082
49ec88f5-496b-45b3-93b4-a9164d989851	c407d619-2c05-491f-b2fd-b9481d652bc9	RAW_JSON	settings	Settings	\N	The workflow automated trigger settings	IconSettings	\N	\N	\N	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-3319-4234-a34c-bac8f903de12	4a5dec44-2fb8-4d70-a6e0-6f483b222082
2d26e05f-7098-4745-b830-3683b15317fb	bfd36b0d-202c-430c-8f42-12ed18cb1f6a	UUID	id	Id	"uuid"	Id	Icon123	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-f03a-4191-8a91-cdefabcdefab	4a5dec44-2fb8-4d70-a6e0-6f483b222082
0d1df512-322b-4393-a550-020136106c56	bfd36b0d-202c-430c-8f42-12ed18cb1f6a	DATE_TIME	createdAt	Creation date	"now"	Creation date	IconCalendar	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-f03b-4192-9b92-defabcdefabc	4a5dec44-2fb8-4d70-a6e0-6f483b222082
14982767-b8f0-483f-8d06-345f909ad6cb	bfd36b0d-202c-430c-8f42-12ed18cb1f6a	DATE_TIME	updatedAt	Last update	"now"	Last time the record was changed	IconCalendarClock	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-f03c-4193-8c93-efabcdefabcd	4a5dec44-2fb8-4d70-a6e0-6f483b222082
a21b7ba4-6b7a-43b3-a337-02d01ce63a2c	bfd36b0d-202c-430c-8f42-12ed18cb1f6a	DATE_TIME	deletedAt	Deleted at	\N	Date when the record was deleted	IconCalendarMinus	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-f03d-4194-9d94-fabcdefabcde	4a5dec44-2fb8-4d70-a6e0-6f483b222082
b5ed8ed4-8c72-499c-b17e-35f2eeb3a9f5	bfd36b0d-202c-430c-8f42-12ed18cb1f6a	TEXT	name	Name	\N	Name of the workflow run	IconSettingsAutomation	\N	\N	\N	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-b840-4253-aef9-4e5013694587	4a5dec44-2fb8-4d70-a6e0-6f483b222082
a994647f-0433-4421-b730-d8f6b71da741	bfd36b0d-202c-430c-8f42-12ed18cb1f6a	DATE_TIME	enqueuedAt	Workflow run enqueued at	\N	Workflow run enqueued at	IconHistory	\N	\N	\N	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-f1e3-4de1-a461-b5c4fdbc861d	4a5dec44-2fb8-4d70-a6e0-6f483b222082
cdbf5216-6711-4bc7-bd98-de556d768a6d	bfd36b0d-202c-430c-8f42-12ed18cb1f6a	DATE_TIME	startedAt	Workflow run started at	\N	Workflow run started at	IconHistory	\N	\N	\N	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-a234-4e2d-bd15-85bcea6bb183	4a5dec44-2fb8-4d70-a6e0-6f483b222082
f699a7b3-aa54-4dbb-a995-209dff601f08	bfd36b0d-202c-430c-8f42-12ed18cb1f6a	DATE_TIME	endedAt	Workflow run ended at	\N	Workflow run ended at	IconHistory	\N	\N	\N	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-e1c1-4b6b-bbbd-b2beaf2e159e	4a5dec44-2fb8-4d70-a6e0-6f483b222082
d57949a5-3b30-465c-9f20-1d879d020050	bfd36b0d-202c-430c-8f42-12ed18cb1f6a	SELECT	status	Workflow run status	"'NOT_STARTED'"	Workflow run status	IconStatusChange	\N	[{"id": "20202020-2ec6-40d8-b9e1-1b1e567bcca9", "color": "gray", "label": "Not started", "value": "NOT_STARTED", "position": 0}, {"id": "20202020-3166-46be-995a-67cb1f4c41d5", "color": "yellow", "label": "Running", "value": "RUNNING", "position": 1}, {"id": "20202020-cde8-4fb6-840a-2fdc4f021b0c", "color": "green", "label": "Completed", "value": "COMPLETED", "position": 2}, {"id": "20202020-fb77-41c7-bf7c-9be97cce805e", "color": "red", "label": "Failed", "value": "FAILED", "position": 3}, {"id": "20202020-c518-4c95-8255-82a05739c88d", "color": "blue", "label": "Enqueued", "value": "ENQUEUED", "position": 4}, {"id": "20202020-e8df-4314-829d-165e296c4eb6", "color": "orange", "label": "Stopping", "value": "STOPPING", "position": 5}, {"id": "20202020-729b-44f9-a9c7-0bf401a0b51c", "color": "gray", "label": "Stopped", "value": "STOPPED", "position": 6}]	\N	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-6b3e-4f9c-8c2b-2e5b8e6d6f3b	4a5dec44-2fb8-4d70-a6e0-6f483b222082
87347a47-0d27-4eeb-9401-b53f14a5bc31	bfd36b0d-202c-430c-8f42-12ed18cb1f6a	ACTOR	createdBy	Executed by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The executor of the workflow	IconCreativeCommonsSa	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-6007-401a-8aa5-e6f38581a6f3	4a5dec44-2fb8-4d70-a6e0-6f483b222082
bfb9b231-2885-4aa7-b3af-293af2fd0b8b	bfd36b0d-202c-430c-8f42-12ed18cb1f6a	ACTOR	updatedBy	Updated by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The workspace member who last updated the record	IconUserCircle	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	730dc1c9-34f5-4c22-84a6-bcb55b7604e2	4a5dec44-2fb8-4d70-a6e0-6f483b222082
66b605a5-e513-4a84-aaee-e067e8042940	bfd36b0d-202c-430c-8f42-12ed18cb1f6a	RAW_JSON	state	State	\N	State of the workflow run	IconHierarchy2	\N	\N	\N	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-611f-45f3-9cde-d64927e8ec57	4a5dec44-2fb8-4d70-a6e0-6f483b222082
93b1b679-fc39-450e-82a9-abecc4aaf2b3	bfd36b0d-202c-430c-8f42-12ed18cb1f6a	POSITION	position	Position	0	Workflow run position	IconHierarchy2	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-7802-4c40-ae89-1f506fe3365c	4a5dec44-2fb8-4d70-a6e0-6f483b222082
b2ff6c93-f60c-43bf-95f9-26419f15051b	bfd36b0d-202c-430c-8f42-12ed18cb1f6a	TS_VECTOR	searchVector	Search vector	\N	Field used for full-text search	IconUser	\N	\N	{"asExpression": "to_tsvector('simple', COALESCE(public.unaccent_immutable(\\"name\\"), ''))", "generatedType": "STORED"}	f	t	t	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-0b91-4ded-b1ac-cbd5efa58cb9	4a5dec44-2fb8-4d70-a6e0-6f483b222082
a4292b30-b8e4-4379-a895-3059b88086b6	72cb4e16-ed23-4e5a-8ed3-47fd5f979113	UUID	id	Id	"uuid"	Id	Icon123	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-f04a-41a1-8aa1-abcdefabcdef	4a5dec44-2fb8-4d70-a6e0-6f483b222082
80e08f12-8afa-4032-bbfd-e542d130a1fe	72cb4e16-ed23-4e5a-8ed3-47fd5f979113	DATE_TIME	createdAt	Creation date	"now"	Creation date	IconCalendar	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-f04b-41a2-9ba2-bcdefabcdefa	4a5dec44-2fb8-4d70-a6e0-6f483b222082
6e233089-4495-4b9a-8c3e-4a374d0e5d57	72cb4e16-ed23-4e5a-8ed3-47fd5f979113	DATE_TIME	updatedAt	Last update	"now"	Last time the record was changed	IconCalendarClock	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-f04c-41a3-8ca3-cdefabcdefab	4a5dec44-2fb8-4d70-a6e0-6f483b222082
b253e8fc-15ee-4b25-97f7-a75ae74ceea4	72cb4e16-ed23-4e5a-8ed3-47fd5f979113	DATE_TIME	deletedAt	Deleted at	\N	Date when the record was deleted	IconCalendarMinus	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-f04d-41a4-9da4-defabcdefabc	4a5dec44-2fb8-4d70-a6e0-6f483b222082
3a962b3b-e171-42b6-9348-060308d31793	72cb4e16-ed23-4e5a-8ed3-47fd5f979113	ACTOR	createdBy	Created by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The creator of the record	IconCreativeCommonsSa	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	34f592a7-5c13-4c8b-8473-7bef00848b4e	4a5dec44-2fb8-4d70-a6e0-6f483b222082
5f54e1b0-d776-4f27-91a7-1bd552f6e986	72cb4e16-ed23-4e5a-8ed3-47fd5f979113	ACTOR	updatedBy	Updated by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The workspace member who last updated the record	IconUserCircle	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	4f8777e6-c5eb-40c6-bb4c-ed9dcf0d81e9	4a5dec44-2fb8-4d70-a6e0-6f483b222082
807e5d28-3977-4723-95cf-ab69bd3f76e0	72cb4e16-ed23-4e5a-8ed3-47fd5f979113	TEXT	name	Name	\N	The workflow version name	IconSettingsAutomation	\N	\N	\N	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-a12f-4cca-9937-a2e40cc65509	4a5dec44-2fb8-4d70-a6e0-6f483b222082
3aff55f0-4487-4ac7-8812-a157d53cfa66	72cb4e16-ed23-4e5a-8ed3-47fd5f979113	RAW_JSON	trigger	Version trigger	\N	Json object to provide trigger	IconSettingsAutomation	\N	\N	\N	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-4eae-43e7-86e0-212b41a30b48	4a5dec44-2fb8-4d70-a6e0-6f483b222082
7599d2e1-e1bf-4f0c-88aa-1ad0bd7af903	72cb4e16-ed23-4e5a-8ed3-47fd5f979113	RAW_JSON	steps	Version steps	\N	Json object to provide steps	IconSettingsAutomation	\N	\N	\N	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-5988-4a64-b94a-1f9b7b989039	4a5dec44-2fb8-4d70-a6e0-6f483b222082
4b98fcdc-aa4f-4fa6-b666-282891c18d43	72cb4e16-ed23-4e5a-8ed3-47fd5f979113	SELECT	status	Version status	"'DRAFT'"	The workflow version status	IconStatusChange	\N	[{"id": "20202020-e3fe-4308-bb57-931bb8098aa0", "color": "yellow", "label": "Draft", "value": "DRAFT", "position": 0}, {"id": "20202020-e9da-428f-8499-bce1b020660b", "color": "green", "label": "Active", "value": "ACTIVE", "position": 1}, {"id": "20202020-e48d-4159-980d-2cc1235fc918", "color": "orange", "label": "Deactivated", "value": "DEACTIVATED", "position": 2}, {"id": "20202020-5e5e-48fe-bcd6-7688ec280b30", "color": "gray", "label": "Archived", "value": "ARCHIVED", "position": 3}]	\N	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-5a34-440e-8a25-39d8c3d1d4cf	4a5dec44-2fb8-4d70-a6e0-6f483b222082
a0926b76-d572-4853-b91a-f7c691cb1728	72cb4e16-ed23-4e5a-8ed3-47fd5f979113	POSITION	position	Position	0	Workflow version position	IconHierarchy2	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-791d-4950-ab28-0e704767ae1c	4a5dec44-2fb8-4d70-a6e0-6f483b222082
9b520cca-5d16-4d80-8126-246caa292304	72cb4e16-ed23-4e5a-8ed3-47fd5f979113	TS_VECTOR	searchVector	Search vector	\N	Field used for full-text search	IconUser	\N	\N	{"asExpression": "to_tsvector('simple', COALESCE(public.unaccent_immutable(\\"name\\"), ''))", "generatedType": "STORED"}	f	t	t	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-3f17-44ef-b8c1-b282ae8469b2	4a5dec44-2fb8-4d70-a6e0-6f483b222082
904f2056-fe77-4327-bcb8-aa92ea1a1d33	0286cdc7-a914-4a77-9afa-1fd5831fcb59	UUID	id	Id	"uuid"	Id	Icon123	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-fb1a-41b1-8ab1-efabcdefabcd	4a5dec44-2fb8-4d70-a6e0-6f483b222082
2a984736-b2e5-495e-9a68-3004d2f86262	0286cdc7-a914-4a77-9afa-1fd5831fcb59	DATE_TIME	createdAt	Creation date	"now"	Creation date	IconCalendar	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-fb1b-41b2-9bb2-fabcdefabcde	4a5dec44-2fb8-4d70-a6e0-6f483b222082
cc08afaa-3559-4699-8563-a199b13809df	0286cdc7-a914-4a77-9afa-1fd5831fcb59	DATE_TIME	updatedAt	Last update	"now"	Last time the record was changed	IconCalendarClock	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-fb1c-41b3-8cb3-abcdefabcdef	4a5dec44-2fb8-4d70-a6e0-6f483b222082
e3babcb9-7767-4e27-927c-58ff099ac8d5	0286cdc7-a914-4a77-9afa-1fd5831fcb59	DATE_TIME	deletedAt	Deleted at	\N	Date when the record was deleted	IconCalendarMinus	\N	\N	{"displayFormat": "RELATIVE"}	f	t	t	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-fb1d-41b4-9db4-bcdefabcdefa	4a5dec44-2fb8-4d70-a6e0-6f483b222082
8a7c75b9-edf4-455a-a8ac-43721c238005	0286cdc7-a914-4a77-9afa-1fd5831fcb59	POSITION	position	Position	0	Workspace member position	IconHierarchy2	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-1810-4591-a93c-d0df97dca843	4a5dec44-2fb8-4d70-a6e0-6f483b222082
a10e8873-0026-486c-a0e5-72a1f31b2f34	0286cdc7-a914-4a77-9afa-1fd5831fcb59	FULL_NAME	name	Name	\N	Workspace member name	IconCircleUser	\N	\N	\N	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-e914-43a6-9c26-3603c59065f4	4a5dec44-2fb8-4d70-a6e0-6f483b222082
9e1c29b9-3ec6-4a62-a832-fd50c3dc3c1c	0286cdc7-a914-4a77-9afa-1fd5831fcb59	TEXT	colorScheme	Color Scheme	"'System'"	Preferred color scheme	IconColorSwatch	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-66bc-47f2-adac-f2ef7c598b63	4a5dec44-2fb8-4d70-a6e0-6f483b222082
444fded3-571c-42f8-96d3-713218bce06e	0286cdc7-a914-4a77-9afa-1fd5831fcb59	TEXT	locale	Language	"'en'"	Preferred language	IconLanguage	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-402e-4695-b169-794fa015afbe	4a5dec44-2fb8-4d70-a6e0-6f483b222082
d9ac4542-85a7-4d64-9226-188909c4f87b	0286cdc7-a914-4a77-9afa-1fd5831fcb59	TEXT	avatarUrl	Avatar Url	\N	Workspace member avatar	IconFileUpload	\N	\N	\N	f	t	t	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-0ced-4c4f-a376-c98a966af3f6	4a5dec44-2fb8-4d70-a6e0-6f483b222082
ad54a378-b88d-4af3-bb41-c2782f34a7e9	0286cdc7-a914-4a77-9afa-1fd5831fcb59	TEXT	userEmail	User Email	\N	Related user email address	IconMail	\N	\N	\N	f	t	t	t	t	t	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-4c5f-4e09-bebc-9e624e21ecf4	4a5dec44-2fb8-4d70-a6e0-6f483b222082
0afd137f-cfa6-4a24-acff-b3e26f8e2785	0286cdc7-a914-4a77-9afa-1fd5831fcb59	NUMBER	calendarStartDay	Start of the week	7	User's preferred start day of the week	IconCalendar	\N	\N	{"dataType": "int"}	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-1ecc-4562-84c9-ff3a2f6cce85	4a5dec44-2fb8-4d70-a6e0-6f483b222082
044d76a6-0653-4d2f-9fe2-6482224184f7	0286cdc7-a914-4a77-9afa-1fd5831fcb59	UUID	userId	User Id	\N	Associated User Id	IconCircleUsers	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-75a9-4dfc-bf25-2e4b43e89820	4a5dec44-2fb8-4d70-a6e0-6f483b222082
f5f53fab-e917-4d66-8025-af19d2e4d50c	0286cdc7-a914-4a77-9afa-1fd5831fcb59	TEXT	timeZone	Time zone	"'system'"	User time zone	IconTimezone	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-2d33-4c21-a86e-5943b050dd54	4a5dec44-2fb8-4d70-a6e0-6f483b222082
d711648b-d862-4b80-bb34-3fdecf265be1	d7c8875d-11aa-42e2-a58a-07bb30bf96af	RELATION	workspaceMember	WorkspaceMember	\N	WorkspaceMember	IconCircleUser	\N	\N	{"onDelete": "SET_NULL", "relationType": "MANY_TO_ONE", "joinColumnName": "workspaceMemberId"}	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	7caafe6e-6a20-4f42-9819-9ca78cbec5ed	0286cdc7-a914-4a77-9afa-1fd5831fcb59	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-548d-4084-a947-fa20a39f7c06	4a5dec44-2fb8-4d70-a6e0-6f483b222082
f640a82d-d9bc-4db0-a1fc-e50cd82edf64	0286cdc7-a914-4a77-9afa-1fd5831fcb59	SELECT	dateFormat	Date format	"'SYSTEM'"	User's preferred date format	IconCalendarEvent	\N	[{"id": "20202020-4b6a-4a08-8506-09bd59ef118e", "color": "turquoise", "label": "System", "value": "SYSTEM", "position": 0}, {"id": "20202020-6981-4e21-bb11-43ac1081be04", "color": "red", "label": "Month First", "value": "MONTH_FIRST", "position": 1}, {"id": "20202020-bf56-4199-b013-27ee921d046d", "color": "purple", "label": "Day First", "value": "DAY_FIRST", "position": 2}, {"id": "20202020-fd23-47d3-b01d-0479c11e5a2d", "color": "sky", "label": "Year First", "value": "YEAR_FIRST", "position": 3}]	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-af13-4e11-b1e7-b8cf5ea13dc0	4a5dec44-2fb8-4d70-a6e0-6f483b222082
75ea0926-6994-48b1-a497-88a06c8c3254	0286cdc7-a914-4a77-9afa-1fd5831fcb59	SELECT	timeFormat	Time format	"'SYSTEM'"	User's preferred time format	IconClock2	\N	[{"id": "20202020-349f-4ff8-82be-3eb52e7ec5f5", "color": "sky", "label": "System", "value": "SYSTEM", "position": 0}, {"id": "20202020-592c-4e33-a457-f4dcde59a3fc", "color": "red", "label": "24HRS", "value": "HOUR_24", "position": 1}, {"id": "20202020-151c-43c2-a463-5bc42e5ce434", "color": "purple", "label": "12HRS", "value": "HOUR_12", "position": 2}]	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-8acb-4cf8-a851-a6ed443c8d81	4a5dec44-2fb8-4d70-a6e0-6f483b222082
e072ac8d-0b15-4122-bceb-d91c0f6d6c55	0286cdc7-a914-4a77-9afa-1fd5831fcb59	SELECT	numberFormat	Number format	"'SYSTEM'"	User's preferred number format	IconNumbers	\N	[{"id": "20202020-8b5b-4cee-8449-ca48d7c65c11", "color": "turquoise", "label": "System", "value": "SYSTEM", "position": 0}, {"id": "20202020-657d-409b-9c2a-d8c3b8842859", "color": "blue", "label": "Commas and dot", "value": "COMMAS_AND_DOT", "position": 1}, {"id": "20202020-8703-4475-a92b-42e631851d8b", "color": "green", "label": "Spaces and comma", "value": "SPACES_AND_COMMA", "position": 2}, {"id": "20202020-2ea4-4b99-b72b-bebac01fd7db", "color": "orange", "label": "Dots and comma", "value": "DOTS_AND_COMMA", "position": 3}, {"id": "20202020-9d07-4353-8ce9-d067d639abf5", "color": "purple", "label": "Apostrophe and dot", "value": "APOSTROPHE_AND_DOT", "position": 4}]	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-7f40-4e7f-b126-11c0eda6b141	4a5dec44-2fb8-4d70-a6e0-6f483b222082
53c18a4a-d4e3-47a7-8a89-cadba152652d	0286cdc7-a914-4a77-9afa-1fd5831fcb59	TS_VECTOR	searchVector	Search vector	\N	Field used for full-text search	IconUser	\N	\N	{"asExpression": "to_tsvector('simple', COALESCE(public.unaccent_immutable(\\"nameFirstName\\"), '') || ' ' || COALESCE(public.unaccent_immutable(\\"nameLastName\\"), '') || ' ' || COALESCE(public.unaccent_immutable(\\"userEmail\\"), ''))", "generatedType": "STORED"}	f	t	t	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-46d0-4e7f-bc26-74c0edaeb619	4a5dec44-2fb8-4d70-a6e0-6f483b222082
bfd58b0d-cbff-44c1-a8b7-16cc8a2bffd8	0286cdc7-a914-4a77-9afa-1fd5831fcb59	ACTOR	createdBy	Created by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The creator of the record	IconCreativeCommonsSa	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	4a3f26d1-033e-4d84-b23a-9adc2fd0c2a8	4a5dec44-2fb8-4d70-a6e0-6f483b222082
fbd7edf2-4aa8-4662-9f9d-fbca01a3fadc	0286cdc7-a914-4a77-9afa-1fd5831fcb59	ACTOR	updatedBy	Updated by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The workspace member who last updated the record	IconUserCircle	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	29f84ad0-509f-4aef-9f9c-2691dd60cd87	4a5dec44-2fb8-4d70-a6e0-6f483b222082
a9c755af-5eac-4c2b-a3d7-db338392a7c6	55f3cb52-620e-4800-9570-47a43ee138c5	MORPH_RELATION	targetTask	Target	\N	Attachment target	IconArrowUpRight	\N	\N	{"onDelete": "SET_NULL", "relationType": "MANY_TO_ONE", "joinColumnName": "targetTaskId"}	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	f726d24e-3c6e-4bdf-a77a-1c7d6bbb31a3	a91a647d-4acf-456b-961b-40fbb3788c6d	20202020-f634-435d-ab8d-e1168b375c69	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-51e5-4621-9cf8-215487951c4b	4a5dec44-2fb8-4d70-a6e0-6f483b222082
f726d24e-3c6e-4bdf-a77a-1c7d6bbb31a3	a91a647d-4acf-456b-961b-40fbb3788c6d	RELATION	attachments	Attachments	\N	Task attachments	IconFileImport	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	a9c755af-5eac-4c2b-a3d7-db338392a7c6	55f3cb52-620e-4800-9570-47a43ee138c5	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-794d-4783-a8ff-cecdb15be139	4a5dec44-2fb8-4d70-a6e0-6f483b222082
cdb30fc4-de45-4792-8cec-f0f10e375179	55f3cb52-620e-4800-9570-47a43ee138c5	MORPH_RELATION	targetNote	Target	\N	Attachment target	IconArrowUpRight	\N	\N	{"onDelete": "SET_NULL", "relationType": "MANY_TO_ONE", "joinColumnName": "targetNoteId"}	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	c33f3c91-9ec9-437f-b923-d7bee9ff46a0	0996fb48-437d-4a52-a0bd-098f18a09105	20202020-f634-435d-ab8d-e1168b375c69	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-4f4b-4503-a6fc-6b982f3dffb5	4a5dec44-2fb8-4d70-a6e0-6f483b222082
c33f3c91-9ec9-437f-b923-d7bee9ff46a0	0996fb48-437d-4a52-a0bd-098f18a09105	RELATION	attachments	Attachments	\N	Note attachments	IconFileImport	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	cdb30fc4-de45-4792-8cec-f0f10e375179	55f3cb52-620e-4800-9570-47a43ee138c5	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-4986-4c92-bf19-39934b149b16	4a5dec44-2fb8-4d70-a6e0-6f483b222082
3d6af4d7-ed38-446f-b01a-ffdf90b743f4	55f3cb52-620e-4800-9570-47a43ee138c5	MORPH_RELATION	targetPerson	Target	\N	Attachment target	IconArrowUpRight	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "targetPersonId"}	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	5641f081-6c3e-40d6-891c-67436434c18e	f59c15d0-9a52-4e93-b44f-ed4fc4bd90be	20202020-f634-435d-ab8d-e1168b375c69	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-0158-4aa2-965c-5cdafe21ffa2	4a5dec44-2fb8-4d70-a6e0-6f483b222082
5641f081-6c3e-40d6-891c-67436434c18e	f59c15d0-9a52-4e93-b44f-ed4fc4bd90be	RELATION	attachments	Attachments	\N	Attachments linked to the contact.	IconFileImport	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	3d6af4d7-ed38-446f-b01a-ffdf90b743f4	55f3cb52-620e-4800-9570-47a43ee138c5	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-cd97-451f-87fa-bcb789bdbf3a	4a5dec44-2fb8-4d70-a6e0-6f483b222082
6d09a296-a84f-47cb-b3b5-960ec4f9df77	55f3cb52-620e-4800-9570-47a43ee138c5	MORPH_RELATION	targetCompany	Target	\N	Attachment target	IconArrowUpRight	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "targetCompanyId"}	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	67da3999-31b5-4cb3-8b10-08510a4692fa	1b9bb040-2722-44d7-a5ac-4e251b541f13	20202020-f634-435d-ab8d-e1168b375c69	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-ceab-4a28-b546-73b06b4c08d5	4a5dec44-2fb8-4d70-a6e0-6f483b222082
67da3999-31b5-4cb3-8b10-08510a4692fa	1b9bb040-2722-44d7-a5ac-4e251b541f13	RELATION	attachments	Attachments	\N	Attachments linked to the company	IconFileImport	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	6d09a296-a84f-47cb-b3b5-960ec4f9df77	55f3cb52-620e-4800-9570-47a43ee138c5	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-c1b5-4120-b0f0-987ca401ed53	4a5dec44-2fb8-4d70-a6e0-6f483b222082
9a8f7ba6-f719-4153-be2b-4b3b3fa1aa46	55f3cb52-620e-4800-9570-47a43ee138c5	MORPH_RELATION	targetOpportunity	Target	\N	Attachment target	IconArrowUpRight	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "targetOpportunityId"}	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	55a02f1e-47e3-409a-9acf-35d2f43943b3	19d8f9ef-3d91-4bea-8281-59d7548d04da	20202020-f634-435d-ab8d-e1168b375c69	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-7374-499d-bea3-9354890755b5	4a5dec44-2fb8-4d70-a6e0-6f483b222082
55a02f1e-47e3-409a-9acf-35d2f43943b3	19d8f9ef-3d91-4bea-8281-59d7548d04da	RELATION	attachments	Attachments	\N	Attachments linked to the opportunity	IconFileImport	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	9a8f7ba6-f719-4153-be2b-4b3b3fa1aa46	55f3cb52-620e-4800-9570-47a43ee138c5	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-87c7-4118-83d6-2f4031005209	4a5dec44-2fb8-4d70-a6e0-6f483b222082
89a36664-7be5-4c3d-a50e-1e63daeaf4eb	55f3cb52-620e-4800-9570-47a43ee138c5	MORPH_RELATION	targetDashboard	Target	\N	Attachment target	IconArrowUpRight	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "targetDashboardId"}	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	0207b2a0-9608-4880-b2ec-5f439c2ea59d	8bf7b8ba-a68b-49dc-8e9a-661cf9d528c4	20202020-f634-435d-ab8d-e1168b375c69	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-5324-43f3-9dbf-1a33e7de0ce6	4a5dec44-2fb8-4d70-a6e0-6f483b222082
0207b2a0-9608-4880-b2ec-5f439c2ea59d	8bf7b8ba-a68b-49dc-8e9a-661cf9d528c4	RELATION	attachments	Attachments	\N	Attachments linked to the dashboard	IconFileImport	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	89a36664-7be5-4c3d-a50e-1e63daeaf4eb	55f3cb52-620e-4800-9570-47a43ee138c5	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-bf6f-4220-8c55-2764f1175870	4a5dec44-2fb8-4d70-a6e0-6f483b222082
e9023f36-6e73-42ee-9701-0272b29535b6	55f3cb52-620e-4800-9570-47a43ee138c5	MORPH_RELATION	targetWorkflow	Target	\N	Attachment target	IconArrowUpRight	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "targetWorkflowId"}	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	8743399a-b6b4-4a13-87ab-3403fa4847ae	0f1f4454-5436-4ddd-b99b-5426058af575	20202020-f634-435d-ab8d-e1168b375c69	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-f1e8-4c9d-8a7b-3f5e1d2c9a8b	4a5dec44-2fb8-4d70-a6e0-6f483b222082
8743399a-b6b4-4a13-87ab-3403fa4847ae	0f1f4454-5436-4ddd-b99b-5426058af575	RELATION	attachments	Attachments	\N	Attachments linked to the workflow	IconFileUpload	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	f	f	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	e9023f36-6e73-42ee-9701-0272b29535b6	55f3cb52-620e-4800-9570-47a43ee138c5	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-4a8c-4e2d-9b1c-7e5f3a2b4c6d	4a5dec44-2fb8-4d70-a6e0-6f483b222082
7caafe6e-6a20-4f42-9819-9ca78cbec5ed	0286cdc7-a914-4a77-9afa-1fd5831fcb59	RELATION	blocklist	Blocklist	\N	Blocklisted handles	IconForbid2	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	d711648b-d862-4b80-bb34-3fdecf265be1	d7c8875d-11aa-42e2-a58a-07bb30bf96af	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-6cb2-4161-9f29-a4b7f1283859	4a5dec44-2fb8-4d70-a6e0-6f483b222082
95456be8-21b6-4912-9e54-395f87a0983e	6be8bb14-8b85-4a2d-ba87-40a4e6b9a586	RELATION	connectedAccount	Connected Account	\N	Connected Account	IconUserCircle	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "connectedAccountId"}	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	1770524e-7b3e-4bfc-b814-88d9a747d671	45600963-91d4-4b77-8fb6-449c8e3c1f44	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-95b1-4f44-82dc-61b042ae2414	4a5dec44-2fb8-4d70-a6e0-6f483b222082
1770524e-7b3e-4bfc-b814-88d9a747d671	45600963-91d4-4b77-8fb6-449c8e3c1f44	RELATION	calendarChannels	Calendar Channels	\N	Calendar Channels	IconCalendar	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	95456be8-21b6-4912-9e54-395f87a0983e	6be8bb14-8b85-4a2d-ba87-40a4e6b9a586	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-af4a-47bb-99ec-51911c1d3977	4a5dec44-2fb8-4d70-a6e0-6f483b222082
c4ad21b9-7f00-420c-9ca6-caa67bf8e36e	e96a74e5-e74b-47b2-a74d-e4558552dd98	RELATION	calendarEvent	Event ID	\N	Event ID	IconCalendar	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "calendarEventId"}	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	9648fb28-9bea-4233-8ed6-b4e2f562bca5	a1cedc36-00da-4425-9ea1-41ef7e522606	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-5aa5-437e-bb86-f42d457783e3	4a5dec44-2fb8-4d70-a6e0-6f483b222082
9648fb28-9bea-4233-8ed6-b4e2f562bca5	a1cedc36-00da-4425-9ea1-41ef7e522606	RELATION	calendarChannelEventAssociations	Calendar Channel Event Associations	\N	Calendar Channel Event Associations	IconCalendar	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	c4ad21b9-7f00-420c-9ca6-caa67bf8e36e	e96a74e5-e74b-47b2-a74d-e4558552dd98	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-bdf8-4572-a2cc-ecbb6bcc3a02	4a5dec44-2fb8-4d70-a6e0-6f483b222082
f3bab687-fba2-40a3-9a54-203f4ce5bfbb	03a73b6b-0eb4-4b17-b71f-a44968cea457	RELATION	calendarEvent	Event ID	\N	Event ID	IconCalendar	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "calendarEventId"}	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	ebe5ff7a-0caf-4e52-9afd-3ba883c4196f	a1cedc36-00da-4425-9ea1-41ef7e522606	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-fe3a-401c-b889-af4f4657a861	4a5dec44-2fb8-4d70-a6e0-6f483b222082
ebe5ff7a-0caf-4e52-9afd-3ba883c4196f	a1cedc36-00da-4425-9ea1-41ef7e522606	RELATION	calendarEventParticipants	Event Participants	\N	Event Participants	IconUserCircle	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	f3bab687-fba2-40a3-9a54-203f4ce5bfbb	03a73b6b-0eb4-4b17-b71f-a44968cea457	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-e07e-4ccb-88f5-6f3d00458eec	4a5dec44-2fb8-4d70-a6e0-6f483b222082
8264d38c-6f85-4f69-8609-6718282128e2	03a73b6b-0eb4-4b17-b71f-a44968cea457	RELATION	person	Person	\N	Person	IconUser	\N	\N	{"onDelete": "SET_NULL", "relationType": "MANY_TO_ONE", "joinColumnName": "personId"}	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	77a457a8-5c65-460f-8602-5293199dee2c	f59c15d0-9a52-4e93-b44f-ed4fc4bd90be	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-5761-4842-8186-e1898ef93966	4a5dec44-2fb8-4d70-a6e0-6f483b222082
77a457a8-5c65-460f-8602-5293199dee2c	f59c15d0-9a52-4e93-b44f-ed4fc4bd90be	RELATION	calendarEventParticipants	Calendar Event Participants	\N	Calendar Event Participants	IconCalendar	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	8264d38c-6f85-4f69-8609-6718282128e2	03a73b6b-0eb4-4b17-b71f-a44968cea457	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-52ee-45e9-a702-b64b3753e3a9	4a5dec44-2fb8-4d70-a6e0-6f483b222082
22e58cd2-2f15-400a-bf7c-3f2c7b81300f	03a73b6b-0eb4-4b17-b71f-a44968cea457	RELATION	workspaceMember	Workspace Member	\N	Workspace Member	IconUser	\N	\N	{"onDelete": "SET_NULL", "relationType": "MANY_TO_ONE", "joinColumnName": "workspaceMemberId"}	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	b6b7082c-d98a-4445-b399-0372abf2c39e	0286cdc7-a914-4a77-9afa-1fd5831fcb59	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-20e4-4591-93ed-aeb17a4dcbd2	4a5dec44-2fb8-4d70-a6e0-6f483b222082
b6b7082c-d98a-4445-b399-0372abf2c39e	0286cdc7-a914-4a77-9afa-1fd5831fcb59	RELATION	calendarEventParticipants	Calendar Event Participants	\N	Calendar Event Participants	IconCalendar	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	22e58cd2-2f15-400a-bf7c-3f2c7b81300f	03a73b6b-0eb4-4b17-b71f-a44968cea457	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-0dbc-4841-9ce1-3e793b5b3512	4a5dec44-2fb8-4d70-a6e0-6f483b222082
f69f6a99-a81b-4454-a642-65d601c20cd2	1b9bb040-2722-44d7-a5ac-4e251b541f13	RELATION	people	People	\N	People linked to the company.	IconUsers	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	a045fbba-8284-497a-bba2-cd71dff54cef	f59c15d0-9a52-4e93-b44f-ed4fc4bd90be	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-3213-4ddf-9494-6422bcff8d7c	4a5dec44-2fb8-4d70-a6e0-6f483b222082
a045fbba-8284-497a-bba2-cd71dff54cef	f59c15d0-9a52-4e93-b44f-ed4fc4bd90be	RELATION	company	Company	\N	Contact's company	IconBuildingSkyscraper	\N	\N	{"onDelete": "SET_NULL", "relationType": "MANY_TO_ONE", "joinColumnName": "companyId"}	f	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	f69f6a99-a81b-4454-a642-65d601c20cd2	1b9bb040-2722-44d7-a5ac-4e251b541f13	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-e2f3-448e-b34c-2d625f0025fd	4a5dec44-2fb8-4d70-a6e0-6f483b222082
bebb69c6-7327-4c21-ba85-70039c4154a0	1b9bb040-2722-44d7-a5ac-4e251b541f13	RELATION	accountOwner	Account Owner	\N	Your team member responsible for managing the company account	IconUserCircle	\N	\N	{"onDelete": "SET_NULL", "relationType": "MANY_TO_ONE", "joinColumnName": "accountOwnerId"}	f	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	5f9dd60b-b4ea-424c-9f7a-5601c3f6a9e0	0286cdc7-a914-4a77-9afa-1fd5831fcb59	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-95b8-4e10-9881-edb5d4765f9d	4a5dec44-2fb8-4d70-a6e0-6f483b222082
5f9dd60b-b4ea-424c-9f7a-5601c3f6a9e0	0286cdc7-a914-4a77-9afa-1fd5831fcb59	RELATION	accountOwnerForCompanies	Account Owner For Companies	\N	Account owner for companies	IconBriefcase	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	bebb69c6-7327-4c21-ba85-70039c4154a0	1b9bb040-2722-44d7-a5ac-4e251b541f13	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-dc29-4bd4-a3c1-29eafa324bee	4a5dec44-2fb8-4d70-a6e0-6f483b222082
535a2425-131b-49a5-ae34-83cef2588067	1b9bb040-2722-44d7-a5ac-4e251b541f13	RELATION	taskTargets	Tasks	\N	Tasks tied to the company	IconCheckbox	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	334625c7-9fe4-4a7e-b8ac-dcfacb1c4d25	5277c856-9ccc-41e4-ae01-f077f1c61574	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-cb17-4a61-8f8f-3be6730480de	4a5dec44-2fb8-4d70-a6e0-6f483b222082
334625c7-9fe4-4a7e-b8ac-dcfacb1c4d25	5277c856-9ccc-41e4-ae01-f077f1c61574	MORPH_RELATION	targetCompany	Target	\N	TaskTarget target	IconArrowUpRight	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "targetCompanyId"}	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	535a2425-131b-49a5-ae34-83cef2588067	1b9bb040-2722-44d7-a5ac-4e251b541f13	20202020-f636-435d-ab8d-e1168b375c71	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-4703-4a4e-948c-487b0c60a92c	4a5dec44-2fb8-4d70-a6e0-6f483b222082
3fdd495c-117b-45d8-a3e0-68d6dc6c179e	1b9bb040-2722-44d7-a5ac-4e251b541f13	RELATION	noteTargets	Notes	\N	Notes tied to the company	IconNotes	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	a116dd6c-217f-4112-ac61-8b75e2f679e0	2f8e7625-5a41-40dd-be67-29f99a4dc30e	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-bae0-4556-a74a-a9c686f77a88	4a5dec44-2fb8-4d70-a6e0-6f483b222082
a116dd6c-217f-4112-ac61-8b75e2f679e0	2f8e7625-5a41-40dd-be67-29f99a4dc30e	MORPH_RELATION	targetCompany	Target	\N	NoteTarget target	IconArrowUpRight	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "targetCompanyId"}	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	3fdd495c-117b-45d8-a3e0-68d6dc6c179e	1b9bb040-2722-44d7-a5ac-4e251b541f13	20202020-f635-435d-ab8d-e1168b375c70	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	c500fbc0-d6f2-4982-a959-5a755431696c	4a5dec44-2fb8-4d70-a6e0-6f483b222082
a9481120-7fd7-4e51-8ab7-e9dd7e93c295	1b9bb040-2722-44d7-a5ac-4e251b541f13	RELATION	opportunities	Opportunities	\N	Opportunities linked to the company.	IconTargetArrow	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	58b25376-e2c8-4809-b2e5-f9e8566e8b54	19d8f9ef-3d91-4bea-8281-59d7548d04da	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-add3-4658-8e23-d70dccb6d0ec	4a5dec44-2fb8-4d70-a6e0-6f483b222082
58b25376-e2c8-4809-b2e5-f9e8566e8b54	19d8f9ef-3d91-4bea-8281-59d7548d04da	RELATION	company	Company	\N	Opportunity company	IconBuildingSkyscraper	\N	\N	{"onDelete": "SET_NULL", "relationType": "MANY_TO_ONE", "joinColumnName": "companyId"}	f	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	a9481120-7fd7-4e51-8ab7-e9dd7e93c295	1b9bb040-2722-44d7-a5ac-4e251b541f13	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-cbac-457e-b565-adece5fc815f	4a5dec44-2fb8-4d70-a6e0-6f483b222082
0c8314fb-3f2b-4161-acae-1968a36c8b9e	1b9bb040-2722-44d7-a5ac-4e251b541f13	RELATION	timelineActivities	Timeline Activities	\N	Timeline Activities linked to the company	IconIconTimelineEvent	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	bb5e8c18-22f2-47c3-8556-3dd2997d9ad9	22213a4b-0696-4b0b-90e1-975e86ba2902	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-0414-4daf-9c0d-64fe7b27f89f	4a5dec44-2fb8-4d70-a6e0-6f483b222082
bb5e8c18-22f2-47c3-8556-3dd2997d9ad9	22213a4b-0696-4b0b-90e1-975e86ba2902	MORPH_RELATION	targetCompany	Target	\N	Event target	IconArrowUpRight	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "targetCompanyId"}	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	0c8314fb-3f2b-4161-acae-1968a36c8b9e	1b9bb040-2722-44d7-a5ac-4e251b541f13	20202020-9a2b-4c3d-a4e5-f6a7b8c9d0e1	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-04ad-4221-a744-7a8278a5ce21	4a5dec44-2fb8-4d70-a6e0-6f483b222082
350023d2-c715-43e1-a260-9c2535cadfbd	45600963-91d4-4b77-8fb6-449c8e3c1f44	RELATION	accountOwner	Account Owner	\N	Account Owner	IconUserCircle	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "accountOwnerId"}	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	52d0a6a1-1125-4703-bc67-92cebc744fd4	0286cdc7-a914-4a77-9afa-1fd5831fcb59	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-3517-4896-afac-b1d0aa362af6	4a5dec44-2fb8-4d70-a6e0-6f483b222082
52d0a6a1-1125-4703-bc67-92cebc744fd4	0286cdc7-a914-4a77-9afa-1fd5831fcb59	RELATION	connectedAccounts	Connected accounts	\N	Connected accounts	IconAt	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	350023d2-c715-43e1-a260-9c2535cadfbd	45600963-91d4-4b77-8fb6-449c8e3c1f44	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-e322-4bde-a525-727079b4a100	4a5dec44-2fb8-4d70-a6e0-6f483b222082
b86917ba-ac12-4ef5-b919-1dcbc394c8ec	a64cec42-2523-4102-b0d6-fdbb2f937bb6	TEXT	name	Name	\N	Name	IconAbc	\N	\N	\N	f	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 12:15:04.225+00	2026-04-25 12:15:04.225+00	afa0d70c-69fe-42b5-9bfc-d92ab7a55cfb	8c07d085-7bf4-4849-934d-3c70dcf4340d
cd784c54-13c9-4f22-a3a7-bf19a4961f45	45600963-91d4-4b77-8fb6-449c8e3c1f44	RELATION	messageChannels	Message Channels	\N	Message Channels	IconMessage	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	05449e7f-c123-4371-85e6-705da0118859	711ed2e9-cc32-45af-ba39-7066034c618e	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-24f7-4362-8468-042204d1e445	4a5dec44-2fb8-4d70-a6e0-6f483b222082
05449e7f-c123-4371-85e6-705da0118859	711ed2e9-cc32-45af-ba39-7066034c618e	RELATION	connectedAccount	Connected Account	\N	Connected Account	IconUserCircle	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "connectedAccountId"}	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	cd784c54-13c9-4f22-a3a7-bf19a4961f45	45600963-91d4-4b77-8fb6-449c8e3c1f44	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-49a2-44a4-b470-282c0440d15d	4a5dec44-2fb8-4d70-a6e0-6f483b222082
7f2065d4-ce50-4980-8d12-e2fd30c5f4e3	8bf7b8ba-a68b-49dc-8e9a-661cf9d528c4	RELATION	timelineActivities	Timeline Activities	\N	Timeline activities linked to the dashboard	IconTimelineEvent	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	468c0533-dc1e-4ca9-8a33-f0e98c58999e	22213a4b-0696-4b0b-90e1-975e86ba2902	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	99c330c0-5b7d-4276-a764-aed84499dfb5	4a5dec44-2fb8-4d70-a6e0-6f483b222082
468c0533-dc1e-4ca9-8a33-f0e98c58999e	22213a4b-0696-4b0b-90e1-975e86ba2902	MORPH_RELATION	targetDashboard	Target	\N	Event target	IconArrowUpRight	\N	\N	{"onDelete": "SET_NULL", "relationType": "MANY_TO_ONE", "joinColumnName": "targetDashboardId"}	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	7f2065d4-ce50-4980-8d12-e2fd30c5f4e3	8bf7b8ba-a68b-49dc-8e9a-661cf9d528c4	20202020-9a2b-4c3d-a4e5-f6a7b8c9d0e1	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-7864-48f5-af7c-9e4b60140948	4a5dec44-2fb8-4d70-a6e0-6f483b222082
844a9e91-1be3-47be-a191-c6a0cfd85056	8e627e4e-e9cf-4890-af92-46559fb5f36e	RELATION	messageThread	Message Thread Id	\N	Message Thread Id	IconHash	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "messageThreadId"}	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	219828ef-70b4-4b54-9a67-34105cb15114	cc4a7ab5-3ba0-4ac7-9ae5-896edd7b3d25	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-30f2-4ccd-9f5c-e41bb9d26214	4a5dec44-2fb8-4d70-a6e0-6f483b222082
219828ef-70b4-4b54-9a67-34105cb15114	cc4a7ab5-3ba0-4ac7-9ae5-896edd7b3d25	RELATION	messages	Messages	\N	Messages from the thread.	IconMessage	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	844a9e91-1be3-47be-a191-c6a0cfd85056	8e627e4e-e9cf-4890-af92-46559fb5f36e	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-3115-404f-aade-e1154b28e35a	4a5dec44-2fb8-4d70-a6e0-6f483b222082
75fe196e-65ad-45b8-b1e8-f03c83726d7d	8e627e4e-e9cf-4890-af92-46559fb5f36e	RELATION	messageParticipants	Message Participants	\N	Message Participants	IconUserCircle	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	00bb1055-4d42-4ef1-9860-3a9749d3770f	ee0c23a3-0eb3-4d06-9b63-e89466584e21	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-7cff-4a74-b63c-73228448cbd9	4a5dec44-2fb8-4d70-a6e0-6f483b222082
00bb1055-4d42-4ef1-9860-3a9749d3770f	ee0c23a3-0eb3-4d06-9b63-e89466584e21	RELATION	message	Message	\N	Message	IconMessage	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "messageId"}	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	75fe196e-65ad-45b8-b1e8-f03c83726d7d	8e627e4e-e9cf-4890-af92-46559fb5f36e	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-985b-429a-9db9-9e55f4898a2a	4a5dec44-2fb8-4d70-a6e0-6f483b222082
630c9eef-eae6-44b9-9fd2-062fefaedd6f	8e627e4e-e9cf-4890-af92-46559fb5f36e	RELATION	messageChannelMessageAssociations	Message Channel Association	\N	Messages from the channel.	IconMessage	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	4a6d34b9-effe-43ca-bde6-488f553fa3ad	254569df-6932-4d1b-abcd-cb0f250b72ed	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-3cef-43a3-82c6-50e7cfbc9ae4	4a5dec44-2fb8-4d70-a6e0-6f483b222082
4a6d34b9-effe-43ca-bde6-488f553fa3ad	254569df-6932-4d1b-abcd-cb0f250b72ed	RELATION	message	Message Id	\N	Message Id	IconHash	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "messageId"}	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	630c9eef-eae6-44b9-9fd2-062fefaedd6f	8e627e4e-e9cf-4890-af92-46559fb5f36e	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-da5d-4ac5-8743-342ab0a0336b	4a5dec44-2fb8-4d70-a6e0-6f483b222082
cd657174-a9c4-448a-8dba-653d6615bb2c	254569df-6932-4d1b-abcd-cb0f250b72ed	RELATION	messageThread	Message Thread Id	\N	Message Thread Id	IconHash	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "messageThreadId"}	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	266a787f-a373-4924-b75a-d6e6f132df00	cc4a7ab5-3ba0-4ac7-9ae5-896edd7b3d25	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-fac8-42a8-94dd-44dbc920ae16	4a5dec44-2fb8-4d70-a6e0-6f483b222082
266a787f-a373-4924-b75a-d6e6f132df00	cc4a7ab5-3ba0-4ac7-9ae5-896edd7b3d25	RELATION	messageChannelMessageAssociations	Message Channel Association	\N	Messages from the channel.	IconMessage	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	cd657174-a9c4-448a-8dba-653d6615bb2c	254569df-6932-4d1b-abcd-cb0f250b72ed	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-314e-40a4-906d-a5d5d6c285f6	4a5dec44-2fb8-4d70-a6e0-6f483b222082
6e805074-b9f6-4d62-9ee0-608dd3ea6606	254569df-6932-4d1b-abcd-cb0f250b72ed	RELATION	messageFolders	Message Folders	\N	Message Folders (supports multiple folders/labels)	IconFolders	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	d455814b-643d-4187-90f2-f90366d57851	b03dcd32-17eb-4bd2-b529-7e0bbc7d4cdd	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	9bfc9da7-ae2d-44fd-9563-ede90c5d6222	4a5dec44-2fb8-4d70-a6e0-6f483b222082
d455814b-643d-4187-90f2-f90366d57851	b03dcd32-17eb-4bd2-b529-7e0bbc7d4cdd	RELATION	messageChannelMessageAssociation	Message Channel Message Association	\N	Message Channel Message Association	IconMessage	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "messageChannelMessageAssociationId"}	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	6e805074-b9f6-4d62-9ee0-608dd3ea6606	254569df-6932-4d1b-abcd-cb0f250b72ed	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	7411cfa3-4fd9-4b90-a636-940015fd7243	4a5dec44-2fb8-4d70-a6e0-6f483b222082
436823ef-336d-4176-8b8d-084a30001e47	ee0c23a3-0eb3-4d06-9b63-e89466584e21	RELATION	person	Person	\N	Person	IconUser	\N	\N	{"onDelete": "SET_NULL", "relationType": "MANY_TO_ONE", "joinColumnName": "personId"}	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	1eb02c97-3929-4260-a36a-d1d781b439e2	f59c15d0-9a52-4e93-b44f-ed4fc4bd90be	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-249d-4e0f-82cd-1b9df5cd3da2	4a5dec44-2fb8-4d70-a6e0-6f483b222082
1eb02c97-3929-4260-a36a-d1d781b439e2	f59c15d0-9a52-4e93-b44f-ed4fc4bd90be	RELATION	messageParticipants	Message Participants	\N	Message Participants	IconUserCircle	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	436823ef-336d-4176-8b8d-084a30001e47	ee0c23a3-0eb3-4d06-9b63-e89466584e21	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-498e-4c61-8158-fa04f0638334	4a5dec44-2fb8-4d70-a6e0-6f483b222082
75ce68ce-8092-4832-a106-3a6975462adf	ee0c23a3-0eb3-4d06-9b63-e89466584e21	RELATION	workspaceMember	Workspace Member	\N	Workspace member	IconCircleUser	\N	\N	{"onDelete": "SET_NULL", "relationType": "MANY_TO_ONE", "joinColumnName": "workspaceMemberId"}	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	403975a4-127a-4972-b9d9-f7a7f901b8c0	0286cdc7-a914-4a77-9afa-1fd5831fcb59	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-77a7-4845-99ed-1bcbb478be6f	4a5dec44-2fb8-4d70-a6e0-6f483b222082
403975a4-127a-4972-b9d9-f7a7f901b8c0	0286cdc7-a914-4a77-9afa-1fd5831fcb59	RELATION	messageParticipants	Message Participants	\N	Message Participants	IconUserCircle	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	75ce68ce-8092-4832-a106-3a6975462adf	ee0c23a3-0eb3-4d06-9b63-e89466584e21	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-8f99-48bc-a5eb-edd33dd54188	4a5dec44-2fb8-4d70-a6e0-6f483b222082
612f3569-317a-43a1-975d-540ec3e6a09c	0996fb48-437d-4a52-a0bd-098f18a09105	RELATION	noteTargets	Relations	\N	Note targets	IconArrowUpRight	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	daff680d-a7fd-4c14-9be5-ba45e510dd32	2f8e7625-5a41-40dd-be67-29f99a4dc30e	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-1f25-43fe-8b00-af212fdde823	4a5dec44-2fb8-4d70-a6e0-6f483b222082
daff680d-a7fd-4c14-9be5-ba45e510dd32	2f8e7625-5a41-40dd-be67-29f99a4dc30e	RELATION	note	Note	\N	NoteTarget note	IconNotes	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "noteId"}	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	612f3569-317a-43a1-975d-540ec3e6a09c	0996fb48-437d-4a52-a0bd-098f18a09105	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-57f3-4f50-9599-fc0f671df003	4a5dec44-2fb8-4d70-a6e0-6f483b222082
5b682777-b57c-459a-a909-3900873ef490	0996fb48-437d-4a52-a0bd-098f18a09105	RELATION	timelineActivities	Timeline Activities	\N	Timeline Activities linked to the note.	IconTimelineEvent	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	85977dc6-1954-4150-8a54-df245c56fdab	22213a4b-0696-4b0b-90e1-975e86ba2902	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-7030-42f8-929c-1a57b25d6bce	4a5dec44-2fb8-4d70-a6e0-6f483b222082
85977dc6-1954-4150-8a54-df245c56fdab	22213a4b-0696-4b0b-90e1-975e86ba2902	MORPH_RELATION	targetNote	Target	\N	Event target	IconArrowUpRight	\N	\N	{"onDelete": "SET_NULL", "relationType": "MANY_TO_ONE", "joinColumnName": "targetNoteId"}	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	5b682777-b57c-459a-a909-3900873ef490	0996fb48-437d-4a52-a0bd-098f18a09105	20202020-9a2b-4c3d-a4e5-f6a7b8c9d0e1	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-ec55-4135-8da5-3a20badc0156	4a5dec44-2fb8-4d70-a6e0-6f483b222082
92596925-815b-41d5-8434-8969a57449ee	2f8e7625-5a41-40dd-be67-29f99a4dc30e	MORPH_RELATION	targetPerson	Target	\N	NoteTarget target	IconArrowUpRight	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "targetPersonId"}	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	9a80f61b-5358-4693-af25-530936e76e7d	f59c15d0-9a52-4e93-b44f-ed4fc4bd90be	20202020-f635-435d-ab8d-e1168b375c70	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-38ca-4aab-92f5-8a605ca2e4c5	4a5dec44-2fb8-4d70-a6e0-6f483b222082
9a80f61b-5358-4693-af25-530936e76e7d	f59c15d0-9a52-4e93-b44f-ed4fc4bd90be	RELATION	noteTargets	Notes	\N	Notes tied to the contact	IconNotes	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	92596925-815b-41d5-8434-8969a57449ee	2f8e7625-5a41-40dd-be67-29f99a4dc30e	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-c8fc-4258-8250-15905d3fcfec	4a5dec44-2fb8-4d70-a6e0-6f483b222082
28308b78-9d3e-40de-be19-5060f6bd15cf	2f8e7625-5a41-40dd-be67-29f99a4dc30e	MORPH_RELATION	targetOpportunity	Target	\N	NoteTarget target	IconArrowUpRight	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "targetOpportunityId"}	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	38df3bd7-363b-445c-b0a4-b6d780308eba	19d8f9ef-3d91-4bea-8281-59d7548d04da	20202020-f635-435d-ab8d-e1168b375c70	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-4e42-417a-a705-76581c9ade79	4a5dec44-2fb8-4d70-a6e0-6f483b222082
38df3bd7-363b-445c-b0a4-b6d780308eba	19d8f9ef-3d91-4bea-8281-59d7548d04da	RELATION	noteTargets	Notes	\N	Notes tied to the opportunity	IconNotes	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	28308b78-9d3e-40de-be19-5060f6bd15cf	2f8e7625-5a41-40dd-be67-29f99a4dc30e	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-dd3f-42d5-a382-db58aabf43d3	4a5dec44-2fb8-4d70-a6e0-6f483b222082
a7ee5091-aff7-40d4-9337-976de32fb5d5	19d8f9ef-3d91-4bea-8281-59d7548d04da	RELATION	pointOfContact	Point of Contact	\N	Opportunity point of contact	IconUser	\N	\N	{"onDelete": "SET_NULL", "relationType": "MANY_TO_ONE", "joinColumnName": "pointOfContactId"}	f	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	5b4c829e-7157-44bf-aae1-ce604f3b9845	f59c15d0-9a52-4e93-b44f-ed4fc4bd90be	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-8dfb-42fc-92b6-01afb759ed16	4a5dec44-2fb8-4d70-a6e0-6f483b222082
5b4c829e-7157-44bf-aae1-ce604f3b9845	f59c15d0-9a52-4e93-b44f-ed4fc4bd90be	RELATION	pointOfContactForOpportunities	Opportunities	\N	List of opportunities for which that person is the point of contact	IconTargetArrow	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	a7ee5091-aff7-40d4-9337-976de32fb5d5	19d8f9ef-3d91-4bea-8281-59d7548d04da	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-911b-4a7d-b67b-918aa9a5b33a	4a5dec44-2fb8-4d70-a6e0-6f483b222082
300790e6-877c-445a-aa62-c63836a31943	19d8f9ef-3d91-4bea-8281-59d7548d04da	RELATION	taskTargets	Tasks	\N	Tasks tied to the opportunity	IconCheckbox	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	0c24b242-9fda-4189-8779-afb446ca0d2b	5277c856-9ccc-41e4-ae01-f077f1c61574	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-59c0-4179-a208-4a255f04a5be	4a5dec44-2fb8-4d70-a6e0-6f483b222082
0c24b242-9fda-4189-8779-afb446ca0d2b	5277c856-9ccc-41e4-ae01-f077f1c61574	MORPH_RELATION	targetOpportunity	Target	\N	TaskTarget target	IconArrowUpRight	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "targetOpportunityId"}	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	300790e6-877c-445a-aa62-c63836a31943	19d8f9ef-3d91-4bea-8281-59d7548d04da	20202020-f636-435d-ab8d-e1168b375c71	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-6cb2-4c01-a9a5-aca3dbc11d41	4a5dec44-2fb8-4d70-a6e0-6f483b222082
089f6e27-77b1-4c1f-a423-ac4117bcad54	19d8f9ef-3d91-4bea-8281-59d7548d04da	RELATION	timelineActivities	Timeline Activities	\N	Timeline Activities linked to the opportunity.	IconTimelineEvent	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	e10b8c81-a73c-40c3-9a30-fd7aefe2405f	22213a4b-0696-4b0b-90e1-975e86ba2902	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-30e2-421f-96c7-19c69d1cf631	4a5dec44-2fb8-4d70-a6e0-6f483b222082
e10b8c81-a73c-40c3-9a30-fd7aefe2405f	22213a4b-0696-4b0b-90e1-975e86ba2902	MORPH_RELATION	targetOpportunity	Target	\N	Event target	IconArrowUpRight	\N	\N	{"onDelete": "SET_NULL", "relationType": "MANY_TO_ONE", "joinColumnName": "targetOpportunityId"}	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	089f6e27-77b1-4c1f-a423-ac4117bcad54	19d8f9ef-3d91-4bea-8281-59d7548d04da	20202020-9a2b-4c3d-a4e5-f6a7b8c9d0e1	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-7664-4a35-a3df-580d389fd527	4a5dec44-2fb8-4d70-a6e0-6f483b222082
2046bbe4-93d8-4abe-96f2-e393477293c5	19d8f9ef-3d91-4bea-8281-59d7548d04da	RELATION	owner	Owner	\N	Opportunity owner	IconUserCircle	\N	\N	{"onDelete": "SET_NULL", "relationType": "MANY_TO_ONE", "joinColumnName": "ownerId"}	f	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	07a8067b-aff3-4d27-9dde-e2bda38e9d12	0286cdc7-a914-4a77-9afa-1fd5831fcb59	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-be7e-4d1e-8e19-3d5c7c4b9f2a	4a5dec44-2fb8-4d70-a6e0-6f483b222082
07a8067b-aff3-4d27-9dde-e2bda38e9d12	0286cdc7-a914-4a77-9afa-1fd5831fcb59	RELATION	ownedOpportunities	Owned opportunities	\N	Opportunities owned by the workspace member	IconTargetArrow	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	2046bbe4-93d8-4abe-96f2-e393477293c5	19d8f9ef-3d91-4bea-8281-59d7548d04da	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-9e4d-4b3a-8c1f-6d7e8f9a0b1c	4a5dec44-2fb8-4d70-a6e0-6f483b222082
913d6c4e-fbf1-40fa-9338-acd551034541	f59c15d0-9a52-4e93-b44f-ed4fc4bd90be	RELATION	taskTargets	Tasks	\N	Tasks tied to the contact	IconCheckbox	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	7039ad06-78a1-4f9b-92a6-f6d2db8f5653	5277c856-9ccc-41e4-ae01-f077f1c61574	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-584b-4d3e-88b6-53ab1fa03c3a	4a5dec44-2fb8-4d70-a6e0-6f483b222082
7039ad06-78a1-4f9b-92a6-f6d2db8f5653	5277c856-9ccc-41e4-ae01-f077f1c61574	MORPH_RELATION	targetPerson	Target	\N	TaskTarget target	IconArrowUpRight	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "targetPersonId"}	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	913d6c4e-fbf1-40fa-9338-acd551034541	f59c15d0-9a52-4e93-b44f-ed4fc4bd90be	20202020-f636-435d-ab8d-e1168b375c71	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-c8a0-4e85-a016-87e2349cfbec	4a5dec44-2fb8-4d70-a6e0-6f483b222082
2173b259-899f-4342-b91d-d8d398a855a6	f59c15d0-9a52-4e93-b44f-ed4fc4bd90be	RELATION	timelineActivities	Events	\N	Events linked to the person	IconTimelineEvent	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	5e6cd9bd-9f3a-46c5-adf2-afc15f8560f9	22213a4b-0696-4b0b-90e1-975e86ba2902	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-a43e-4873-9c23-e522de906ce5	4a5dec44-2fb8-4d70-a6e0-6f483b222082
5e6cd9bd-9f3a-46c5-adf2-afc15f8560f9	22213a4b-0696-4b0b-90e1-975e86ba2902	MORPH_RELATION	targetPerson	Target	\N	Event target	IconArrowUpRight	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "targetPersonId"}	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	2173b259-899f-4342-b91d-d8d398a855a6	f59c15d0-9a52-4e93-b44f-ed4fc4bd90be	20202020-9a2b-4c3d-a4e5-f6a7b8c9d0e1	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-c414-45b9-a60a-ac27aa96229f	4a5dec44-2fb8-4d70-a6e0-6f483b222082
a99ae526-dca5-4f0f-ad93-7a843e235ea9	a91a647d-4acf-456b-961b-40fbb3788c6d	RELATION	taskTargets	Relations	\N	Task targets	IconArrowUpRight	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	0ad97923-b3dc-4dab-af95-5e487949a35f	5277c856-9ccc-41e4-ae01-f077f1c61574	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-de9c-4d0e-a452-713d4a3e5fc7	4a5dec44-2fb8-4d70-a6e0-6f483b222082
0ad97923-b3dc-4dab-af95-5e487949a35f	5277c856-9ccc-41e4-ae01-f077f1c61574	RELATION	task	Task	\N	TaskTarget task	IconCheckbox	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "taskId"}	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	a99ae526-dca5-4f0f-ad93-7a843e235ea9	a91a647d-4acf-456b-961b-40fbb3788c6d	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-e881-457a-8758-74aaef4ae78a	4a5dec44-2fb8-4d70-a6e0-6f483b222082
1a641c8f-05e2-47d2-89dc-92cb49b71b9e	a91a647d-4acf-456b-961b-40fbb3788c6d	RELATION	assignee	Assignee	\N	Task assignee	IconUserCircle	\N	\N	{"onDelete": "SET_NULL", "relationType": "MANY_TO_ONE", "joinColumnName": "assigneeId"}	f	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	65041402-8e7a-4d47-89df-82cb2f62b785	0286cdc7-a914-4a77-9afa-1fd5831fcb59	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-065a-4f42-a906-e20422c1753f	4a5dec44-2fb8-4d70-a6e0-6f483b222082
65041402-8e7a-4d47-89df-82cb2f62b785	0286cdc7-a914-4a77-9afa-1fd5831fcb59	RELATION	assignedTasks	Assigned tasks	\N	Tasks assigned to the workspace member	IconCheckbox	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	1a641c8f-05e2-47d2-89dc-92cb49b71b9e	a91a647d-4acf-456b-961b-40fbb3788c6d	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-61dc-4a1c-99e8-38ebf8d2bbeb	4a5dec44-2fb8-4d70-a6e0-6f483b222082
0001ac53-87a7-4ff7-8e0b-94789d19eda0	a91a647d-4acf-456b-961b-40fbb3788c6d	RELATION	timelineActivities	Timeline Activities	\N	Timeline Activities linked to the task.	IconTimelineEvent	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	0e2fe8e7-4043-4e50-872c-cbd97e12f823	22213a4b-0696-4b0b-90e1-975e86ba2902	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-c778-4278-99ee-23a2837aee64	4a5dec44-2fb8-4d70-a6e0-6f483b222082
0e2fe8e7-4043-4e50-872c-cbd97e12f823	22213a4b-0696-4b0b-90e1-975e86ba2902	MORPH_RELATION	targetTask	Target	\N	Event target	IconArrowUpRight	\N	\N	{"onDelete": "SET_NULL", "relationType": "MANY_TO_ONE", "joinColumnName": "targetTaskId"}	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	0001ac53-87a7-4ff7-8e0b-94789d19eda0	a91a647d-4acf-456b-961b-40fbb3788c6d	20202020-9a2b-4c3d-a4e5-f6a7b8c9d0e1	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-b2f5-415c-9135-a31dfe49501b	4a5dec44-2fb8-4d70-a6e0-6f483b222082
bb16eb12-13a0-4abd-a0f6-30201292484a	22213a4b-0696-4b0b-90e1-975e86ba2902	RELATION	workspaceMember	Workspace Member	\N	Event workspace member	IconCircleUser	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "workspaceMemberId"}	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	1596c4b5-a6c6-429f-a40e-84ee16724ea9	0286cdc7-a914-4a77-9afa-1fd5831fcb59	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-af23-4479-9a30-868edc474b36	4a5dec44-2fb8-4d70-a6e0-6f483b222082
1596c4b5-a6c6-429f-a40e-84ee16724ea9	0286cdc7-a914-4a77-9afa-1fd5831fcb59	RELATION	timelineActivities	Events	\N	Events linked to the workspace member	IconTimelineEvent	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	bb16eb12-13a0-4abd-a0f6-30201292484a	22213a4b-0696-4b0b-90e1-975e86ba2902	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-e15b-47b8-94fe-8200e3c66615	4a5dec44-2fb8-4d70-a6e0-6f483b222082
4f65c2b1-6a3c-4f68-beb2-6355e08c7c14	22213a4b-0696-4b0b-90e1-975e86ba2902	MORPH_RELATION	targetWorkflow	Target	\N	Event target	IconArrowUpRight	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "targetWorkflowId"}	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	af535d90-2a9e-4be9-94c2-cf6bb1e44093	0f1f4454-5436-4ddd-b99b-5426058af575	20202020-9a2b-4c3d-a4e5-f6a7b8c9d0e1	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-616c-4ad3-a2e9-c477c341e295	4a5dec44-2fb8-4d70-a6e0-6f483b222082
af535d90-2a9e-4be9-94c2-cf6bb1e44093	0f1f4454-5436-4ddd-b99b-5426058af575	RELATION	timelineActivities	Timeline Activities	\N	Timeline activities linked to the workflow	IconTimelineEvent	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	f	f	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	4f65c2b1-6a3c-4f68-beb2-6355e08c7c14	22213a4b-0696-4b0b-90e1-975e86ba2902	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-906e-486a-a798-131a5f081faf	4a5dec44-2fb8-4d70-a6e0-6f483b222082
fe524c8a-7374-4930-b0f2-43e4e64160fe	22213a4b-0696-4b0b-90e1-975e86ba2902	MORPH_RELATION	targetWorkflowVersion	Target	\N	Event target	IconArrowUpRight	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "targetWorkflowVersionId"}	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	c22f29f6-f0d2-4b28-8581-721be7a35a2b	72cb4e16-ed23-4e5a-8ed3-47fd5f979113	20202020-9a2b-4c3d-a4e5-f6a7b8c9d0e1	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-74f1-4711-a129-e14ca0ecd744	4a5dec44-2fb8-4d70-a6e0-6f483b222082
c22f29f6-f0d2-4b28-8581-721be7a35a2b	72cb4e16-ed23-4e5a-8ed3-47fd5f979113	RELATION	timelineActivities	Timeline Activities	\N	Timeline activities linked to the version	IconTimelineEvent	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	fe524c8a-7374-4930-b0f2-43e4e64160fe	22213a4b-0696-4b0b-90e1-975e86ba2902	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-fcb0-4695-b17e-3b43a421c633	4a5dec44-2fb8-4d70-a6e0-6f483b222082
1fe9ea4b-fc48-43d8-88e7-1bb880d1ed35	22213a4b-0696-4b0b-90e1-975e86ba2902	MORPH_RELATION	targetWorkflowRun	Target	\N	Event target	IconArrowUpRight	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "targetWorkflowRunId"}	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	0505a05f-c155-449a-87bf-79a53c2e4f06	bfd36b0d-202c-430c-8f42-12ed18cb1f6a	20202020-9a2b-4c3d-a4e5-f6a7b8c9d0e1	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-96f0-401b-9186-a3a0759225ac	4a5dec44-2fb8-4d70-a6e0-6f483b222082
0505a05f-c155-449a-87bf-79a53c2e4f06	bfd36b0d-202c-430c-8f42-12ed18cb1f6a	RELATION	timelineActivities	Timeline Activities	\N	Timeline activities linked to the run	IconTimelineEvent	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	1fe9ea4b-fc48-43d8-88e7-1bb880d1ed35	22213a4b-0696-4b0b-90e1-975e86ba2902	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-af4d-4eb0-babc-eb960a45b356	4a5dec44-2fb8-4d70-a6e0-6f483b222082
392a39d5-ef32-4e94-adba-c53c53431037	0f1f4454-5436-4ddd-b99b-5426058af575	RELATION	versions	Versions	\N	Workflow versions linked to the workflow.	IconVersions	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	fd7c4c80-01c7-4736-a495-ee703a78dcbf	72cb4e16-ed23-4e5a-8ed3-47fd5f979113	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-9432-416e-8f3c-27ee3153d099	4a5dec44-2fb8-4d70-a6e0-6f483b222082
fd7c4c80-01c7-4736-a495-ee703a78dcbf	72cb4e16-ed23-4e5a-8ed3-47fd5f979113	RELATION	workflow	Workflow	\N	WorkflowVersion workflow	IconSettingsAutomation	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "workflowId"}	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	392a39d5-ef32-4e94-adba-c53c53431037	0f1f4454-5436-4ddd-b99b-5426058af575	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-afa3-46c3-91b0-0631ca6aa1c8	4a5dec44-2fb8-4d70-a6e0-6f483b222082
9a031255-606d-49c1-afea-7aad7ddd841f	0f1f4454-5436-4ddd-b99b-5426058af575	RELATION	runs	Runs	\N	Workflow runs linked to the workflow.	IconRun	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	bfbcf2ce-5ff0-4dc1-a799-1943f4eda720	bfd36b0d-202c-430c-8f42-12ed18cb1f6a	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-759b-4340-b58b-e73595c4df4f	4a5dec44-2fb8-4d70-a6e0-6f483b222082
bfbcf2ce-5ff0-4dc1-a799-1943f4eda720	bfd36b0d-202c-430c-8f42-12ed18cb1f6a	RELATION	workflow	Workflow	\N	Workflow linked to the run.	IconSettingsAutomation	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "workflowId"}	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	9a031255-606d-49c1-afea-7aad7ddd841f	0f1f4454-5436-4ddd-b99b-5426058af575	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-8c57-4e7f-84f5-f373f68e1b82	4a5dec44-2fb8-4d70-a6e0-6f483b222082
fadbce9a-3355-40a4-ba83-641317af7781	0f1f4454-5436-4ddd-b99b-5426058af575	RELATION	automatedTriggers	Automated Triggers	\N	Workflow automated triggers linked to the workflow.	IconSettingsAutomation	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	57f637a3-3e2e-4581-b4f1-6b938c95eebd	c407d619-2c05-491f-b2fd-b9481d652bc9	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-3319-4234-a34c-117ecad2b8a9	4a5dec44-2fb8-4d70-a6e0-6f483b222082
57f637a3-3e2e-4581-b4f1-6b938c95eebd	c407d619-2c05-491f-b2fd-b9481d652bc9	RELATION	workflow	Workflow	\N	WorkflowAutomatedTrigger workflow	IconSettingsAutomation	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "workflowId"}	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	fadbce9a-3355-40a4-ba83-641317af7781	0f1f4454-5436-4ddd-b99b-5426058af575	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-3319-4234-a34c-8e1a4d2f7c03	4a5dec44-2fb8-4d70-a6e0-6f483b222082
60e0339f-0c06-4d94-a3f4-3d8e2387eb09	bfd36b0d-202c-430c-8f42-12ed18cb1f6a	RELATION	workflowVersion	Workflow version	\N	Workflow version linked to the run.	IconVersions	\N	\N	{"onDelete": "SET_NULL", "relationType": "MANY_TO_ONE", "joinColumnName": "workflowVersionId"}	f	t	f	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	e528b0eb-3b76-4745-bc4a-127501de555c	72cb4e16-ed23-4e5a-8ed3-47fd5f979113	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-2f52-4ba8-8dc4-d0d6adb9578d	4a5dec44-2fb8-4d70-a6e0-6f483b222082
e528b0eb-3b76-4745-bc4a-127501de555c	72cb4e16-ed23-4e5a-8ed3-47fd5f979113	RELATION	runs	Runs	\N	Workflow runs linked to the version.	IconRun	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	f	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	60e0339f-0c06-4d94-a3f4-3d8e2387eb09	bfd36b0d-202c-430c-8f42-12ed18cb1f6a	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	20202020-1d08-46df-901a-85045f18099a	4a5dec44-2fb8-4d70-a6e0-6f483b222082
a0c251b8-41ee-4d21-94ab-bd3f35bbf304	a64cec42-2523-4102-b0d6-fdbb2f937bb6	ACTOR	createdBy	Created by	{"name": "''", "source": "'MANUAL'"}	The creator of the record	IconCreativeCommonsSa	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 12:15:04.225+00	2026-04-25 12:15:04.225+00	2859dff3-b5a1-4393-bb2d-1dcee733f742	8c07d085-7bf4-4849-934d-3c70dcf4340d
52bd18bc-abf8-4dde-bd25-3d845ef42868	a64cec42-2523-4102-b0d6-fdbb2f937bb6	DATE_TIME	deletedAt	Deleted at	\N	Deletion date	IconCalendarClock	\N	\N	\N	f	t	t	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 12:15:04.225+00	2026-04-25 12:15:04.225+00	c6d77baf-0f33-4173-b52e-1ba09999f70f	8c07d085-7bf4-4849-934d-3c70dcf4340d
ba4d151b-c9a8-4e50-9f9c-645a3967ef0f	a64cec42-2523-4102-b0d6-fdbb2f937bb6	POSITION	position	Position	0	Position	IconHierarchy2	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 12:15:04.225+00	2026-04-25 12:15:04.225+00	4ed46eef-9538-41bf-a44f-9b1b3acbce67	8c07d085-7bf4-4849-934d-3c70dcf4340d
50eafb63-5b53-485c-b734-ca8fdc19e6df	a64cec42-2523-4102-b0d6-fdbb2f937bb6	TS_VECTOR	searchVector	Search vector	\N	Search vector	IconSearch	\N	\N	{"asExpression": "to_tsvector('simple', COALESCE(public.unaccent_immutable(\\"name\\"), ''))", "generatedType": "STORED"}	f	t	t	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 12:15:04.225+00	2026-04-25 12:15:04.225+00	38c41701-b2d4-4f55-a08e-c61040b941e6	8c07d085-7bf4-4849-934d-3c70dcf4340d
ff2e5736-06f4-4acc-9ef8-b0efdd6a39fa	a64cec42-2523-4102-b0d6-fdbb2f937bb6	DATE_TIME	updatedAt	Last update	"now"	Last time the record was changed	IconCalendarClock	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 12:15:04.225+00	2026-04-25 12:15:04.225+00	f3b0121a-e4aa-47a2-aec0-2d222ff1d4c0	8c07d085-7bf4-4849-934d-3c70dcf4340d
392016ef-5c6b-4c65-a6b3-f1de739e63dc	a64cec42-2523-4102-b0d6-fdbb2f937bb6	ACTOR	updatedBy	Updated by	{"name": "''", "source": "'MANUAL'"}	The workspace member who last updated the record	IconUserCircle	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 12:15:04.225+00	2026-04-25 12:15:04.225+00	927e028b-fe62-4cf9-9484-a79bb23ba337	8c07d085-7bf4-4849-934d-3c70dcf4340d
700096f4-aabf-4ace-b23c-8fbdd07984df	a64cec42-2523-4102-b0d6-fdbb2f937bb6	RELATION	timelineActivities	Timeline Activities	\N	Habits tied to the Timeline Activity	IconBuildingSkyscraper	\N	\N	{"relationType": "ONE_TO_MANY"}	t	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	56f27d3e-296e-47ae-a60f-fc9ecd0b8610	22213a4b-0696-4b0b-90e1-975e86ba2902	\N	2026-04-25 12:15:04.226+00	2026-04-25 12:15:04.226+00	3ec95227-0350-4ac4-8de4-253cf721d245	8c07d085-7bf4-4849-934d-3c70dcf4340d
56f27d3e-296e-47ae-a60f-fc9ecd0b8610	22213a4b-0696-4b0b-90e1-975e86ba2902	MORPH_RELATION	targetHabit	Habit	\N	TimelineActivities Habit	IconTimelineEvent	\N	\N	{"onDelete": "SET_NULL", "relationType": "MANY_TO_ONE", "joinColumnName": "targetHabitId"}	t	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	700096f4-aabf-4ace-b23c-8fbdd07984df	a64cec42-2523-4102-b0d6-fdbb2f937bb6	20202020-9a2b-4c3d-a4e5-f6a7b8c9d0e1	2026-04-25 12:15:04.226+00	2026-04-25 12:15:04.226+00	21d2c2ce-6e1b-40c1-9a32-81cddf0b2ecb	8c07d085-7bf4-4849-934d-3c70dcf4340d
46195720-6709-4bf3-93ad-f90223f7dfa9	a64cec42-2523-4102-b0d6-fdbb2f937bb6	RELATION	attachments	Attachments	\N	Habits tied to the Attachment	IconBuildingSkyscraper	\N	\N	{"relationType": "ONE_TO_MANY"}	t	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	04f2268c-a207-4b3b-9ffb-b00b0f4f7eb4	55f3cb52-620e-4800-9570-47a43ee138c5	\N	2026-04-25 12:15:04.227+00	2026-04-25 12:15:04.227+00	97cc7c08-7182-4b50-b35e-22af32b6fc2d	8c07d085-7bf4-4849-934d-3c70dcf4340d
04f2268c-a207-4b3b-9ffb-b00b0f4f7eb4	55f3cb52-620e-4800-9570-47a43ee138c5	MORPH_RELATION	targetHabit	Habit	\N	Attachments Habit	IconFileImport	\N	\N	{"onDelete": "SET_NULL", "relationType": "MANY_TO_ONE", "joinColumnName": "targetHabitId"}	t	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	46195720-6709-4bf3-93ad-f90223f7dfa9	a64cec42-2523-4102-b0d6-fdbb2f937bb6	20202020-f634-435d-ab8d-e1168b375c69	2026-04-25 12:15:04.227+00	2026-04-25 12:15:04.227+00	5a1486da-e671-47e6-8009-200fe6c6e7d2	8c07d085-7bf4-4849-934d-3c70dcf4340d
03009722-668d-41a2-bbcb-4245ee406817	a64cec42-2523-4102-b0d6-fdbb2f937bb6	RELATION	noteTargets	Note Targets	\N	Habits tied to the Note Target	IconBuildingSkyscraper	\N	\N	{"relationType": "ONE_TO_MANY"}	t	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	c46f8b71-cd4c-4517-ae38-065505de12a2	2f8e7625-5a41-40dd-be67-29f99a4dc30e	\N	2026-04-25 12:15:04.227+00	2026-04-25 12:15:04.227+00	3679b5b4-6af2-443b-92c4-a2472abd3fc6	8c07d085-7bf4-4849-934d-3c70dcf4340d
c46f8b71-cd4c-4517-ae38-065505de12a2	2f8e7625-5a41-40dd-be67-29f99a4dc30e	MORPH_RELATION	targetHabit	Habit	\N	NoteTargets Habit	IconCheckbox	\N	\N	{"onDelete": "SET_NULL", "relationType": "MANY_TO_ONE", "joinColumnName": "targetHabitId"}	t	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	03009722-668d-41a2-bbcb-4245ee406817	a64cec42-2523-4102-b0d6-fdbb2f937bb6	20202020-f635-435d-ab8d-e1168b375c70	2026-04-25 12:15:04.227+00	2026-04-25 12:15:04.227+00	f1c93448-8d50-4f38-8ae2-b83f1d7708ae	8c07d085-7bf4-4849-934d-3c70dcf4340d
7df7ef2c-5c28-4a12-84f1-23b5cfc34b09	a64cec42-2523-4102-b0d6-fdbb2f937bb6	RELATION	taskTargets	Task Targets	\N	Habits tied to the Task Target	IconBuildingSkyscraper	\N	\N	{"relationType": "ONE_TO_MANY"}	t	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	88dae09b-0b9a-42be-a262-859179f70f63	5277c856-9ccc-41e4-ae01-f077f1c61574	\N	2026-04-25 12:15:04.227+00	2026-04-25 12:15:04.227+00	4864e257-1108-4571-8d70-faa8c2b3593d	8c07d085-7bf4-4849-934d-3c70dcf4340d
88dae09b-0b9a-42be-a262-859179f70f63	5277c856-9ccc-41e4-ae01-f077f1c61574	MORPH_RELATION	targetHabit	Habit	\N	TaskTargets Habit	IconCheckbox	\N	\N	{"onDelete": "SET_NULL", "relationType": "MANY_TO_ONE", "joinColumnName": "targetHabitId"}	t	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	7df7ef2c-5c28-4a12-84f1-23b5cfc34b09	a64cec42-2523-4102-b0d6-fdbb2f937bb6	20202020-f636-435d-ab8d-e1168b375c71	2026-04-25 12:15:04.227+00	2026-04-25 12:15:04.227+00	86b1980c-4d43-4092-a148-ab2c74edc59b	8c07d085-7bf4-4849-934d-3c70dcf4340d
eb81c0e0-f480-4407-902c-fdaa39928202	a64cec42-2523-4102-b0d6-fdbb2f937bb6	TEXT	title	title	\N	\N	IconTypography	\N	\N	{"displayedMaxRows": 0}	t	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	t	\N	\N	\N	2026-04-25 12:23:15.545+00	2026-04-25 12:23:15.545+00	86b5249b-903b-476e-8662-47c93d438be0	8c07d085-7bf4-4849-934d-3c70dcf4340d
454da54d-bcb0-413b-8d0b-ff4d7d591bfb	a64cec42-2523-4102-b0d6-fdbb2f937bb6	TEXT	mainGoal	main_goal	\N	\N	IconTypography	\N	\N	{"displayedMaxRows": 0}	t	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	t	\N	\N	\N	2026-04-25 12:23:39+00	2026-04-25 12:23:39+00	04be8e10-7c91-4e6c-b634-3eca71ac01c7	8c07d085-7bf4-4849-934d-3c70dcf4340d
a781233c-e5ca-412b-b9fd-ab8130ee0c28	a64cec42-2523-4102-b0d6-fdbb2f937bb6	TEXT	microStep	micro_step	\N	\N	IconTypography	\N	\N	{"displayedMaxRows": 0}	t	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	t	\N	\N	\N	2026-04-25 12:23:48.706+00	2026-04-25 12:23:48.706+00	dfecceb8-1df3-4c71-b897-c7c97bb9c471	8c07d085-7bf4-4849-934d-3c70dcf4340d
983e19f6-93ab-4a04-9e7d-3b2300759db9	a64cec42-2523-4102-b0d6-fdbb2f937bb6	TEXT	recurrenceRule	recurrence_rule	\N	\N	IconTypography	\N	\N	{"displayedMaxRows": 0}	t	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	t	\N	\N	\N	2026-04-25 12:23:55.981+00	2026-04-25 12:23:55.981+00	4fe85cb7-81a6-41cc-8ee8-f00dbd92c163	8c07d085-7bf4-4849-934d-3c70dcf4340d
4256c196-e3a2-429d-a3ae-32809060cccb	a64cec42-2523-4102-b0d6-fdbb2f937bb6	TEXT	deadlineType	deadline_type	\N	\N	IconTypography	\N	\N	{"displayedMaxRows": 0}	t	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	t	\N	\N	\N	2026-04-25 12:24:11.621+00	2026-04-25 12:24:11.621+00	52ef9b5c-a7df-415d-b661-e21c1fb77c47	8c07d085-7bf4-4849-934d-3c70dcf4340d
e6c53f0b-d2fc-47fe-bb1f-98b12dfc773a	a64cec42-2523-4102-b0d6-fdbb2f937bb6	TEXT	deadlineValue	deadline_value	\N	\N	IconTypography	\N	\N	{"displayedMaxRows": 0}	t	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	t	\N	\N	\N	2026-04-25 12:24:19.308+00	2026-04-25 12:24:19.308+00	22a3f4e7-6f5c-4305-8ca5-2bfadb2a8e95	8c07d085-7bf4-4849-934d-3c70dcf4340d
543e9eca-2271-41a0-af8d-51cc126248f8	185d031c-a8d4-42b4-b9b8-55a8e1c6e608	TEXT	name	Name	\N	Name	IconAbc	\N	\N	\N	f	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 12:25:53.065+00	2026-04-25 12:25:53.065+00	c04b3c8b-c901-4143-a5b1-5fd0e43c7c54	8c07d085-7bf4-4849-934d-3c70dcf4340d
b85a6561-03e4-41a4-be10-e734400c1387	185d031c-a8d4-42b4-b9b8-55a8e1c6e608	UUID	id	Id	"uuid"	Id	Icon123	\N	\N	\N	f	t	t	t	f	t	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 12:25:53.065+00	2026-04-25 12:25:53.065+00	dee02653-ddc3-45c7-bdc4-a92a5832c5a1	8c07d085-7bf4-4849-934d-3c70dcf4340d
53e9a52f-a4d8-42e9-a167-0a5c4ed26294	185d031c-a8d4-42b4-b9b8-55a8e1c6e608	DATE_TIME	createdAt	Creation date	"now"	Creation date	IconCalendar	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 12:25:53.065+00	2026-04-25 12:25:53.065+00	2e93ae67-7eb0-40a5-903a-457d37071143	8c07d085-7bf4-4849-934d-3c70dcf4340d
9aca448c-a9a3-4b94-80ed-cfc3b44db139	185d031c-a8d4-42b4-b9b8-55a8e1c6e608	ACTOR	createdBy	Created by	{"name": "''", "source": "'MANUAL'"}	The creator of the record	IconCreativeCommonsSa	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 12:25:53.065+00	2026-04-25 12:25:53.065+00	b20dcce8-7274-411f-b47e-fa7e16392027	8c07d085-7bf4-4849-934d-3c70dcf4340d
91ed6a6b-0b1d-4609-8896-68270ccf7c95	185d031c-a8d4-42b4-b9b8-55a8e1c6e608	DATE_TIME	deletedAt	Deleted at	\N	Deletion date	IconCalendarClock	\N	\N	\N	f	t	t	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 12:25:53.065+00	2026-04-25 12:25:53.065+00	4f698dde-b684-4c9d-8276-8afe22a37412	8c07d085-7bf4-4849-934d-3c70dcf4340d
25a66748-9950-4ed2-b7f6-e4fcd9d372e4	185d031c-a8d4-42b4-b9b8-55a8e1c6e608	POSITION	position	Position	0	Position	IconHierarchy2	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 12:25:53.065+00	2026-04-25 12:25:53.065+00	476199af-f330-4c20-8008-120a6cf7b58c	8c07d085-7bf4-4849-934d-3c70dcf4340d
58cade63-d20f-4e00-bb68-ce7fcc6a8857	185d031c-a8d4-42b4-b9b8-55a8e1c6e608	TS_VECTOR	searchVector	Search vector	\N	Search vector	IconSearch	\N	\N	{"asExpression": "to_tsvector('simple', COALESCE(public.unaccent_immutable(\\"name\\"), ''))", "generatedType": "STORED"}	f	t	t	t	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 12:25:53.065+00	2026-04-25 12:25:53.065+00	bfcedf87-050d-43f2-b7f4-3d0ab9a56f16	8c07d085-7bf4-4849-934d-3c70dcf4340d
dc1257f4-a2dc-4284-aa61-2304b2cd78ca	185d031c-a8d4-42b4-b9b8-55a8e1c6e608	DATE_TIME	updatedAt	Last update	"now"	Last time the record was changed	IconCalendarClock	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 12:25:53.065+00	2026-04-25 12:25:53.065+00	69598af0-3ffb-40ca-aaf5-afdcf53ea0ff	8c07d085-7bf4-4849-934d-3c70dcf4340d
fe7674fd-2ac8-43f3-be06-3a05c75d1951	185d031c-a8d4-42b4-b9b8-55a8e1c6e608	ACTOR	updatedBy	Updated by	{"name": "''", "source": "'MANUAL'"}	The workspace member who last updated the record	IconUserCircle	\N	\N	\N	f	t	t	t	f	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	\N	\N	\N	2026-04-25 12:25:53.065+00	2026-04-25 12:25:53.065+00	9a2e36a1-6027-41df-b29f-c9c795bd3050	8c07d085-7bf4-4849-934d-3c70dcf4340d
b986b038-2865-4903-9286-18b83e31874d	185d031c-a8d4-42b4-b9b8-55a8e1c6e608	RELATION	timelineActivities	Timeline Activities	\N	HabitLogs tied to the Timeline Activity	IconBuildingSkyscraper	\N	\N	{"relationType": "ONE_TO_MANY"}	t	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	825d65de-4d16-4477-b284-963083b91a04	22213a4b-0696-4b0b-90e1-975e86ba2902	\N	2026-04-25 12:25:53.065+00	2026-04-25 12:25:53.065+00	f5e53e7c-5eba-4e32-b979-ef798c4f138d	8c07d085-7bf4-4849-934d-3c70dcf4340d
825d65de-4d16-4477-b284-963083b91a04	22213a4b-0696-4b0b-90e1-975e86ba2902	MORPH_RELATION	targetHabitLog	HabitLog	\N	TimelineActivities Habit Log	IconTimelineEvent	\N	\N	{"onDelete": "SET_NULL", "relationType": "MANY_TO_ONE", "joinColumnName": "targetHabitLogId"}	t	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	b986b038-2865-4903-9286-18b83e31874d	185d031c-a8d4-42b4-b9b8-55a8e1c6e608	20202020-9a2b-4c3d-a4e5-f6a7b8c9d0e1	2026-04-25 12:25:53.065+00	2026-04-25 12:25:53.065+00	3840df81-4b0e-4daf-a410-b3205a5b5115	8c07d085-7bf4-4849-934d-3c70dcf4340d
2c2a8f9b-9e6c-483d-b1b1-9da9664fb5d8	185d031c-a8d4-42b4-b9b8-55a8e1c6e608	RELATION	attachments	Attachments	\N	HabitLogs tied to the Attachment	IconBuildingSkyscraper	\N	\N	{"relationType": "ONE_TO_MANY"}	t	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	261255a0-47af-4033-be82-a502f0032cbe	55f3cb52-620e-4800-9570-47a43ee138c5	\N	2026-04-25 12:25:53.066+00	2026-04-25 12:25:53.066+00	9a1b3b80-d573-40e5-a0ed-4e8cfe2b1f56	8c07d085-7bf4-4849-934d-3c70dcf4340d
261255a0-47af-4033-be82-a502f0032cbe	55f3cb52-620e-4800-9570-47a43ee138c5	MORPH_RELATION	targetHabitLog	HabitLog	\N	Attachments Habit Log	IconFileImport	\N	\N	{"onDelete": "SET_NULL", "relationType": "MANY_TO_ONE", "joinColumnName": "targetHabitLogId"}	t	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	2c2a8f9b-9e6c-483d-b1b1-9da9664fb5d8	185d031c-a8d4-42b4-b9b8-55a8e1c6e608	20202020-f634-435d-ab8d-e1168b375c69	2026-04-25 12:25:53.066+00	2026-04-25 12:25:53.066+00	4c034ade-4fab-4317-a8f7-34f01f68228e	8c07d085-7bf4-4849-934d-3c70dcf4340d
c935b0fd-c1d9-4298-a878-4be6af7241e1	185d031c-a8d4-42b4-b9b8-55a8e1c6e608	RELATION	noteTargets	Note Targets	\N	HabitLogs tied to the Note Target	IconBuildingSkyscraper	\N	\N	{"relationType": "ONE_TO_MANY"}	t	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	104f5fe0-681c-48da-bdee-c3078624120b	2f8e7625-5a41-40dd-be67-29f99a4dc30e	\N	2026-04-25 12:25:53.066+00	2026-04-25 12:25:53.066+00	b58aefca-47d4-4b87-8dc5-142685457e30	8c07d085-7bf4-4849-934d-3c70dcf4340d
104f5fe0-681c-48da-bdee-c3078624120b	2f8e7625-5a41-40dd-be67-29f99a4dc30e	MORPH_RELATION	targetHabitLog	HabitLog	\N	NoteTargets Habit Log	IconCheckbox	\N	\N	{"onDelete": "SET_NULL", "relationType": "MANY_TO_ONE", "joinColumnName": "targetHabitLogId"}	t	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	c935b0fd-c1d9-4298-a878-4be6af7241e1	185d031c-a8d4-42b4-b9b8-55a8e1c6e608	20202020-f635-435d-ab8d-e1168b375c70	2026-04-25 12:25:53.066+00	2026-04-25 12:25:53.066+00	267cde77-73ed-486b-bd4c-81c844e0307b	8c07d085-7bf4-4849-934d-3c70dcf4340d
15a32c66-d95f-478d-90de-7a4cd0974811	185d031c-a8d4-42b4-b9b8-55a8e1c6e608	RELATION	taskTargets	Task Targets	\N	HabitLogs tied to the Task Target	IconBuildingSkyscraper	\N	\N	{"relationType": "ONE_TO_MANY"}	t	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	5600e4ac-6ac2-4bfb-aa9e-00c4cc27c18d	5277c856-9ccc-41e4-ae01-f077f1c61574	\N	2026-04-25 12:25:53.066+00	2026-04-25 12:25:53.066+00	4b22eaea-7e14-43ef-ba50-2b2d88b71d91	8c07d085-7bf4-4849-934d-3c70dcf4340d
5600e4ac-6ac2-4bfb-aa9e-00c4cc27c18d	5277c856-9ccc-41e4-ae01-f077f1c61574	MORPH_RELATION	targetHabitLog	HabitLog	\N	TaskTargets Habit Log	IconCheckbox	\N	\N	{"onDelete": "SET_NULL", "relationType": "MANY_TO_ONE", "joinColumnName": "targetHabitLogId"}	t	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	15a32c66-d95f-478d-90de-7a4cd0974811	185d031c-a8d4-42b4-b9b8-55a8e1c6e608	20202020-f636-435d-ab8d-e1168b375c71	2026-04-25 12:25:53.066+00	2026-04-25 12:25:53.066+00	79a541fe-696d-41cf-879c-126c2ed74f8a	8c07d085-7bf4-4849-934d-3c70dcf4340d
a0141d57-0b6e-4721-9e40-461a4a1032d9	185d031c-a8d4-42b4-b9b8-55a8e1c6e608	RELATION	habit	habit	\N	HabitLogs tied to the Habit	IconRelationOneToMany	\N	\N	{"onDelete": "SET_NULL", "relationType": "MANY_TO_ONE", "joinColumnName": "habitId"}	t	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	t	d0b12356-7a1b-4f60-b788-7abd825e7233	a64cec42-2523-4102-b0d6-fdbb2f937bb6	\N	2026-04-25 12:31:08.48+00	2026-04-25 12:31:08.48+00	b6a32bc2-bdd1-4fe6-8859-c6186535078a	8c07d085-7bf4-4849-934d-3c70dcf4340d
d0b12356-7a1b-4f60-b788-7abd825e7233	a64cec42-2523-4102-b0d6-fdbb2f937bb6	RELATION	habitLogs	habit_logs	\N	Habits Habit Log	IconUsers	\N	\N	{"relationType": "ONE_TO_MANY"}	t	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f	a0141d57-0b6e-4721-9e40-461a4a1032d9	185d031c-a8d4-42b4-b9b8-55a8e1c6e608	\N	2026-04-25 12:31:08.48+00	2026-04-25 12:31:08.48+00	15ff02c5-014d-4244-814a-5db77cc2a1e3	8c07d085-7bf4-4849-934d-3c70dcf4340d
de5e1e30-f16b-4af1-bf25-af35b04be032	185d031c-a8d4-42b4-b9b8-55a8e1c6e608	DATE_TIME	date	date	\N	\N	IconCalendarClock	\N	\N	{"displayFormat": "USER_SETTINGS"}	t	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	t	\N	\N	\N	2026-04-25 12:32:09.988+00	2026-04-25 12:32:09.988+00	337fffd1-d068-49a1-a308-ed9ed5aab05d	8c07d085-7bf4-4849-934d-3c70dcf4340d
61b7412b-a282-4b75-a4b4-3ab43b46c346	185d031c-a8d4-42b4-b9b8-55a8e1c6e608	SELECT	status	status	\N	\N	IconTag	\N	[{"id": "ed1b2246-2096-45ed-88b2-01b07589b0f7", "color": "green", "label": "full", "value": "FULL", "position": 0}, {"id": "1731ec5d-4374-4981-8a89-1a3c94af0e50", "color": "yellow", "label": "micro", "value": "MICRO", "position": 1}, {"id": "2bc495e6-7f53-4f49-8d2d-87e2092ae0ba", "color": "red", "label": "missed", "value": "MISSED", "position": 2}]	\N	t	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	t	\N	\N	\N	2026-04-25 12:34:04.559+00	2026-04-25 12:34:04.559+00	ee42340e-8dd2-406a-bccf-c89471cbd4d4	8c07d085-7bf4-4849-934d-3c70dcf4340d
cbd90c7f-de3c-4d6e-b26c-12885c1355a6	185d031c-a8d4-42b4-b9b8-55a8e1c6e608	TEXT	notes	notes	\N	\N	IconTypography	\N	\N	{"displayedMaxRows": 0}	t	t	f	f	t	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	t	\N	\N	\N	2026-04-25 12:34:16.737+00	2026-04-25 12:34:16.737+00	f7ed19f6-5fb1-4b61-b99a-835d80d36c5a	8c07d085-7bf4-4849-934d-3c70dcf4340d
\.


--
-- Data for Name: fieldPermission; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."fieldPermission" (id, "roleId", "objectMetadataId", "fieldMetadataId", "canReadFieldValue", "canUpdateFieldValue", "workspaceId", "createdAt", "updatedAt", "universalIdentifier", "applicationId") FROM stdin;
\.


--
-- Data for Name: file; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core.file (id, size, "workspaceId", "createdAt", "applicationId", path, "updatedAt", "deletedAt", "isStaticAsset", settings, "mimeType") FROM stdin;
cb03054c-380e-4c18-9339-a58fd19f2c67	1409	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:33:51.040463+00	8c07d085-7bf4-4849-934d-3c70dcf4340d	dependencies/package.json	2026-04-25 11:33:51.040463+00	\N	f	{"toDelete": false, "isTemporaryFile": false}	application/octet-stream
c67b194a-ecf0-46e7-93bd-5e8460a84aea	112864	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:33:51.040463+00	8c07d085-7bf4-4849-934d-3c70dcf4340d	dependencies/yarn.lock	2026-04-25 11:33:51.040463+00	\N	f	{"toDelete": false, "isTemporaryFile": false}	application/octet-stream
e8874b35-e30f-4ef2-8984-266f2dab7694	1409	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:16.948057+00	4a5dec44-2fb8-4d70-a6e0-6f483b222082	dependencies/package.json	2026-04-25 11:34:16.948057+00	\N	f	{"toDelete": false, "isTemporaryFile": false}	application/octet-stream
85c9ac99-32af-414d-8838-6e3f4ae113a0	112864	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:16.956447+00	4a5dec44-2fb8-4d70-a6e0-6f483b222082	dependencies/yarn.lock	2026-04-25 11:34:16.956447+00	\N	f	{"toDelete": false, "isTemporaryFile": false}	application/octet-stream
7aa4a574-d443-437b-b5e9-c5389a2efe62	336	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:18.973361+00	8c07d085-7bf4-4849-934d-3c70dcf4340d	source/a82e3309-11ae-552c-a456-d803c30162d1/src/index.ts	2026-04-25 11:34:18.973361+00	\N	f	{"toDelete": false, "isTemporaryFile": false}	application/typescript
7c06a86d-96b3-4e88-a29f-b717f33ac5c4	1011	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:19.025007+00	8c07d085-7bf4-4849-934d-3c70dcf4340d	source/8e00d17d-60e3-5bbc-bc04-1a591fd2d50e/src/index.ts	2026-04-25 11:34:19.025007+00	\N	f	{"toDelete": false, "isTemporaryFile": false}	application/typescript
3cc4accb-cbc5-49b0-bd4c-03b521610aa3	1098	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:19.047247+00	8c07d085-7bf4-4849-934d-3c70dcf4340d	source/e74f8dec-3d4a-5504-94ec-de196a36805e/src/index.ts	2026-04-25 11:34:19.047247+00	\N	f	{"toDelete": false, "isTemporaryFile": false}	application/typescript
ad40a838-d118-43b5-9310-a6beed3ade47	419981	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:21.197129+00	4a5dec44-2fb8-4d70-a6e0-6f483b222082	generated-sdk-client/twenty-client-sdk.zip	2026-04-25 11:34:21.197129+00	\N	f	{"toDelete": false, "isTemporaryFile": false}	application/zip
ce45c75e-476e-4719-922c-6d97a6c71f51	419983	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:22.499049+00	8c07d085-7bf4-4849-934d-3c70dcf4340d	generated-sdk-client/twenty-client-sdk.zip	2026-04-25 11:34:22.499049+00	\N	f	{"toDelete": false, "isTemporaryFile": false}	application/zip
\.


--
-- Data for Name: frontComponent; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."frontComponent" ("workspaceId", "universalIdentifier", "applicationId", id, name, "createdAt", "updatedAt", description, "sourceComponentPath", "builtComponentPath", "componentName", "builtComponentChecksum", "isHeadless", "usesSdkClient") FROM stdin;
\.


--
-- Data for Name: indexFieldMetadata; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."indexFieldMetadata" (id, "indexMetadataId", "fieldMetadataId", "order", "createdAt", "updatedAt", "workspaceId") FROM stdin;
c5897066-9efe-4505-afd3-48b1d92d8bc1	33873497-d8e2-4611-be68-0189b0e7ff61	a9c755af-5eac-4c2b-a3d7-db338392a7c6	0	2026-04-25 11:34:17.773+00	2026-04-25 11:34:17.773+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
0ad80ff4-d7ea-44b4-ae6d-67d3ed69d202	8dbcffe4-4d51-4b4b-af66-33b3eaad52da	cdb30fc4-de45-4792-8cec-f0f10e375179	0	2026-04-25 11:34:17.782+00	2026-04-25 11:34:17.782+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
2608584b-f0b4-42aa-8dd9-2f916f45650b	8f109e14-69af-4c96-9122-c336f0608fb9	3d6af4d7-ed38-446f-b01a-ffdf90b743f4	0	2026-04-25 11:34:17.787+00	2026-04-25 11:34:17.787+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
a60a5506-3c79-47c2-a4bd-76609ec3da5d	bcb82fa3-0c8d-4186-b575-77e28f269380	6d09a296-a84f-47cb-b3b5-960ec4f9df77	0	2026-04-25 11:34:17.792+00	2026-04-25 11:34:17.792+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
5ef3bf8b-52f3-42fe-ab92-278a5c2a51ca	158c7567-1683-485c-8743-1471b5e075ef	9a8f7ba6-f719-4153-be2b-4b3b3fa1aa46	0	2026-04-25 11:34:17.798+00	2026-04-25 11:34:17.798+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
207b2473-6403-48c7-9d32-f789a1ae380d	fa29b61f-4dbd-43c4-8fab-ef0cb8998898	89a36664-7be5-4c3d-a50e-1e63daeaf4eb	0	2026-04-25 11:34:17.808+00	2026-04-25 11:34:17.808+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
af86aea8-2ad8-44ca-ab75-e6e3698ad218	0359748f-6575-4902-83af-6586f7faecf4	e9023f36-6e73-42ee-9701-0272b29535b6	0	2026-04-25 11:34:17.813+00	2026-04-25 11:34:17.813+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
4512ab01-1f35-443d-9fc1-ff727ce6a007	d72d2416-1357-4d11-9f24-e32b58accca5	d711648b-d862-4b80-bb34-3fdecf265be1	0	2026-04-25 11:34:17.818+00	2026-04-25 11:34:17.818+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
d457882d-4c35-475a-ba19-5bd5063d0f8b	ba2646e8-7c87-43ce-83e0-5505fde9cbaa	70ca63da-16cd-478f-9c18-7650083fe012	0	2026-04-25 11:34:17.823+00	2026-04-25 11:34:17.823+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
64f1f9e7-0ce3-41b5-a1fc-f29bfba7a1ae	13a4c1ba-43fc-41b6-925f-b8af5d6b8e55	c4ad21b9-7f00-420c-9ca6-caa67bf8e36e	0	2026-04-25 11:34:17.828+00	2026-04-25 11:34:17.828+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
ad9ae0b1-7dec-4c05-85c0-54925735640b	5500fd1e-5feb-455f-9e2f-35e5b442d7e5	95456be8-21b6-4912-9e54-395f87a0983e	0	2026-04-25 11:34:17.833+00	2026-04-25 11:34:17.833+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
f0528adb-cded-42c9-bd8d-b04ca08120c7	e84c0dd4-7a76-4e78-98b2-d3190056393d	f3bab687-fba2-40a3-9a54-203f4ce5bfbb	0	2026-04-25 11:34:17.838+00	2026-04-25 11:34:17.838+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
f2ba47d1-164d-4ace-bc57-d31db7f3a629	c2d74d16-bfc1-44c6-9480-e92a6244ed28	8264d38c-6f85-4f69-8609-6718282128e2	0	2026-04-25 11:34:17.843+00	2026-04-25 11:34:17.843+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
425fc255-9f9e-411f-b9e1-a70086c57536	ccee7b8f-f0ed-4601-929b-6a75251634e0	22e58cd2-2f15-400a-bf7c-3f2c7b81300f	0	2026-04-25 11:34:17.848+00	2026-04-25 11:34:17.848+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
f1549dc2-508d-4cb2-a4ba-3def4b3ef2f0	5fd7e084-0975-4322-a256-83ab031e61e5	bebb69c6-7327-4c21-ba85-70039c4154a0	0	2026-04-25 11:34:17.853+00	2026-04-25 11:34:17.853+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
e3b975d7-0c89-4a7a-b15b-6a6baeee8af3	40caeac6-5187-44c4-bcb2-a9d5eb5b6d4c	1293a7d1-bf10-4dc2-a75f-c0166cef618e	0	2026-04-25 11:34:17.858+00	2026-04-25 11:34:17.858+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
51658e06-05c6-491f-a1db-50929a7f35db	191686d1-bd9f-4ab6-b9e5-b60b396813e8	4bf0fb2e-e259-4a3f-8ef0-2af2170cca03	0	2026-04-25 11:34:17.864+00	2026-04-25 11:34:17.864+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
7ecf82a8-ba40-4daf-ae0f-f26aca79069d	eb214fea-41d2-4d37-8a95-a449506fdfc8	350023d2-c715-43e1-a260-9c2535cadfbd	0	2026-04-25 11:34:17.866+00	2026-04-25 11:34:17.866+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
47585bfd-0bcc-458f-bfa7-1b67df62ffb8	bd07cac1-d9a1-46b6-bc81-c5757a819eb1	838823c6-79f7-4de1-a21c-62e5389014ce	0	2026-04-25 11:34:17.871+00	2026-04-25 11:34:17.871+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
526ff2e9-a6d4-4d7d-93a7-4bed8507f478	030a3529-8177-40c3-bccc-7d2c3768aa86	844a9e91-1be3-47be-a191-c6a0cfd85056	0	2026-04-25 11:34:17.872+00	2026-04-25 11:34:17.872+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
70a4f16b-ce8b-4ff4-897a-8f812186ecc1	bde60e2c-19ec-48b7-be16-0cd3301db0f4	05449e7f-c123-4371-85e6-705da0118859	0	2026-04-25 11:34:17.877+00	2026-04-25 11:34:17.877+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
af6c2b9e-3ee7-4e98-80e8-649b367cd66e	7371e91d-01bc-4051-99a6-8175fc541d10	a3ac02f1-25ec-4448-86f8-413a066a775a	0	2026-04-25 11:34:17.882+00	2026-04-25 11:34:17.882+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
d1b76019-a570-45d5-b68c-94aaa522be2b	43db0cb7-d744-4e0b-96b7-57ecfa538762	4a6d34b9-effe-43ca-bde6-488f553fa3ad	0	2026-04-25 11:34:17.887+00	2026-04-25 11:34:17.887+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
301f9247-2160-4bb9-8f8d-41cfdedfd45c	78d57976-c053-4399-be01-0b0ad81089ea	a3ac02f1-25ec-4448-86f8-413a066a775a	0	2026-04-25 11:34:17.892+00	2026-04-25 11:34:17.892+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
5d1de290-2416-456f-bc88-8caa2f8b0e19	78d57976-c053-4399-be01-0b0ad81089ea	4a6d34b9-effe-43ca-bde6-488f553fa3ad	1	2026-04-25 11:34:17.892+00	2026-04-25 11:34:17.892+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
801d8bfd-775a-4941-b4c9-9a0f4900b1a1	5a9e95ef-4cf9-4d2d-a6b6-aca9841f8ba4	d455814b-643d-4187-90f2-f90366d57851	0	2026-04-25 11:34:17.898+00	2026-04-25 11:34:17.898+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
ab328f4d-dff6-4aa1-98ef-233d5c8b41f1	305c6920-6f7d-46a3-a78f-099291ee60ad	409b77a0-fb30-44b8-bf49-c5d8b4f4018b	0	2026-04-25 11:34:17.903+00	2026-04-25 11:34:17.903+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
bce33714-a6d9-4f64-9a59-81655376a41f	a2f6c295-1d61-4d62-a767-eeddcc1d7cc6	d455814b-643d-4187-90f2-f90366d57851	0	2026-04-25 11:34:17.908+00	2026-04-25 11:34:17.908+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
24325557-16ef-4d1c-948b-baa406c041a0	a2f6c295-1d61-4d62-a767-eeddcc1d7cc6	409b77a0-fb30-44b8-bf49-c5d8b4f4018b	1	2026-04-25 11:34:17.908+00	2026-04-25 11:34:17.908+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
0f9c3efb-3031-4509-a474-6e4fd092ce3c	087b8bd7-6601-45a4-95c3-276231b6cfa1	b7ca047e-f265-4c59-8c82-415ef7296a13	0	2026-04-25 11:34:17.913+00	2026-04-25 11:34:17.913+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
da92e8f3-b634-43fb-8694-5b517e190c98	84694590-f282-4ed5-bd1c-e27698dc93cb	00bb1055-4d42-4ef1-9860-3a9749d3770f	0	2026-04-25 11:34:17.918+00	2026-04-25 11:34:17.918+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
c74a888e-2c37-4aed-b539-e81b59fb11f9	6a2066b7-046d-41ba-b10e-914eeaa1d7e9	436823ef-336d-4176-8b8d-084a30001e47	0	2026-04-25 11:34:17.922+00	2026-04-25 11:34:17.922+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
d10a39e2-fa8f-4290-a331-f6e346d02ae6	9cb3f80b-fac3-4222-a367-16e03c43b5ba	75ce68ce-8092-4832-a106-3a6975462adf	0	2026-04-25 11:34:17.928+00	2026-04-25 11:34:17.928+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
c615cc9c-47c6-4c52-814b-d21fa1c9ff27	a7f3fe4d-72a0-4bc0-bf5a-8e6884a9fcbc	14e58d0c-6fcf-4481-abbf-e1939623f5fc	0	2026-04-25 11:34:17.934+00	2026-04-25 11:34:17.934+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
d5f4a3d2-ba22-40b8-8c30-b0c5683e7ad9	5f3a79f5-88e7-43fa-a056-38c01f6df46e	daff680d-a7fd-4c14-9be5-ba45e510dd32	0	2026-04-25 11:34:17.935+00	2026-04-25 11:34:17.935+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
c8219374-96c1-4715-ae80-86ae9b4992ed	66e6ebae-78bc-4fa8-91d9-8b3dcb88ac00	92596925-815b-41d5-8434-8969a57449ee	0	2026-04-25 11:34:17.941+00	2026-04-25 11:34:17.941+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
9bdf842b-3d5b-4268-8fed-d00597dd958b	99bf96b4-b308-4a3a-bc36-8a87f83879b2	a116dd6c-217f-4112-ac61-8b75e2f679e0	0	2026-04-25 11:34:17.946+00	2026-04-25 11:34:17.946+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
dcb60673-eb12-48de-a969-0f6d17ce7158	f2ca8bd9-fb98-47d0-a4bc-dbed687bcaa5	28308b78-9d3e-40de-be19-5060f6bd15cf	0	2026-04-25 11:34:17.952+00	2026-04-25 11:34:17.952+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
d23252f5-ec95-47f4-b586-b11fa0cd19bd	5253ff8f-10e7-4820-a0ae-1381fad065c7	a7ee5091-aff7-40d4-9337-976de32fb5d5	0	2026-04-25 11:34:17.957+00	2026-04-25 11:34:17.957+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
20b03cc7-af7c-47e4-929f-28f08c8b4bdf	60b2b5f1-baaf-401a-b202-db64f95a2dcd	58b25376-e2c8-4809-b2e5-f9e8566e8b54	0	2026-04-25 11:34:17.962+00	2026-04-25 11:34:17.962+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
12f10819-9d74-4694-9732-d0bbdbd2974d	867fa324-3219-44ce-8956-817b39657a2e	adb354b9-5400-4e8f-ae82-4d527e6da842	0	2026-04-25 11:34:17.969+00	2026-04-25 11:34:17.969+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
477af1fc-8d41-4050-9b69-5d5be331eaeb	173e2a65-a16e-428f-96c5-27af52305315	ac55ade0-43da-4f34-9fef-2188f69242d4	0	2026-04-25 11:34:17.975+00	2026-04-25 11:34:17.975+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
ea9d58b9-c181-483e-8ea7-f2e5a545f0f3	4f5c9cc3-debc-4506-b5b9-c596ec0937ba	a045fbba-8284-497a-bba2-cd71dff54cef	0	2026-04-25 11:34:17.978+00	2026-04-25 11:34:17.978+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
732d5591-6875-4137-816c-1354afc94b85	e5aba424-7399-490c-a110-32b45fc5ce62	0d02b1fa-feb0-48dc-a361-95533309ea0f	0	2026-04-25 11:34:17.984+00	2026-04-25 11:34:17.984+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
d0e204c1-6887-4403-97ae-49f6715f7a90	667e0323-0ae1-4dcf-aea9-d83230bd38e3	907bf219-de82-4bad-806e-e2bd9431adc9	0	2026-04-25 11:34:17.99+00	2026-04-25 11:34:17.99+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
a14e1f89-7be6-4bd6-9077-149ab46968e6	3b4f8900-5e27-4e25-91a3-68a293ce8874	1a641c8f-05e2-47d2-89dc-92cb49b71b9e	0	2026-04-25 11:34:17.992+00	2026-04-25 11:34:17.992+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
39f739b2-4ea9-4d30-8d36-74dae94b8700	93162f51-65d1-453c-bb33-f4bc4292fffe	a8356afc-1b08-444e-b3da-daae79b3a381	0	2026-04-25 11:34:17.997+00	2026-04-25 11:34:17.997+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
d99acdb8-a0ec-4fc1-b586-fcdd9cee309e	51c451b8-e600-40c3-bb16-6fa16661a308	0ad97923-b3dc-4dab-af95-5e487949a35f	0	2026-04-25 11:34:17.998+00	2026-04-25 11:34:17.998+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
015bafdd-8d9f-46f1-8c46-e697242a9c84	3d6e4d02-1f2f-42ae-b3bd-eb431b0e4277	7039ad06-78a1-4f9b-92a6-f6d2db8f5653	0	2026-04-25 11:34:18.004+00	2026-04-25 11:34:18.004+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
fdf14eeb-2343-4961-9f5a-31596e4c967f	209a43c8-512b-4862-9739-17640be0fa5b	334625c7-9fe4-4a7e-b8ac-dcfacb1c4d25	0	2026-04-25 11:34:18.011+00	2026-04-25 11:34:18.011+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
8276bf91-e74f-49d1-928e-1d4b6c7e9d06	e6a94a2b-2954-414a-a518-e534b1379a1c	0c24b242-9fda-4189-8779-afb446ca0d2b	0	2026-04-25 11:34:18.017+00	2026-04-25 11:34:18.017+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
d48a9957-3df0-4746-a300-f9287c2dddf1	6b26d1b1-018a-486a-a92e-a8bc3d88c70e	bb16eb12-13a0-4abd-a0f6-30201292484a	0	2026-04-25 11:34:18.041+00	2026-04-25 11:34:18.041+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
bf1832f2-aac1-486f-a086-f8b4ff1b4f15	02d0a6be-7447-465c-bdcf-bec43555bb6e	5e6cd9bd-9f3a-46c5-adf2-afc15f8560f9	0	2026-04-25 11:34:18.048+00	2026-04-25 11:34:18.048+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
1d13c6b1-abdd-4c7d-9aa6-d116c083433b	ec566285-b08e-4ece-8022-6291c1d9e0ec	bb5e8c18-22f2-47c3-8556-3dd2997d9ad9	0	2026-04-25 11:34:18.053+00	2026-04-25 11:34:18.053+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
ca899465-a4fe-4d65-8d51-d88e600e7ff6	2ba9e5e9-469a-476a-8501-fe410c397a7e	e10b8c81-a73c-40c3-9a30-fd7aefe2405f	0	2026-04-25 11:34:18.058+00	2026-04-25 11:34:18.058+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
34715512-cfd4-4fd0-8c95-5c8fdec0d1ee	bb904ade-4f60-4711-b473-c8ccf3783f6a	85977dc6-1954-4150-8a54-df245c56fdab	0	2026-04-25 11:34:18.064+00	2026-04-25 11:34:18.064+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
1f9544be-ce3c-4560-bd7e-ee9623c68fb1	a6d2224c-6a18-41d8-8ed3-63c9a0cf9b1d	0e2fe8e7-4043-4e50-872c-cbd97e12f823	0	2026-04-25 11:34:18.069+00	2026-04-25 11:34:18.069+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
a54daa52-b0fe-4dc0-88e5-23b71fe03ccc	517e6518-5079-4566-b694-f089dd314deb	4f65c2b1-6a3c-4f68-beb2-6355e08c7c14	0	2026-04-25 11:34:18.074+00	2026-04-25 11:34:18.074+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
5f839bbc-6e7f-488a-9449-5fcbcfa265cb	9fa12d2c-4ad9-4479-adb3-f20786df34c3	fe524c8a-7374-4930-b0f2-43e4e64160fe	0	2026-04-25 11:34:18.079+00	2026-04-25 11:34:18.079+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
21535c81-62a9-4c73-ba7e-00790cd4e20d	5a8b1969-f6ba-41d1-991a-e17109f3fde3	1fe9ea4b-fc48-43d8-88e7-1bb880d1ed35	0	2026-04-25 11:34:18.084+00	2026-04-25 11:34:18.084+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
7ed3e852-c0e4-464d-a404-10b137dba589	e257f50d-2303-4c54-baea-de0e3e6dae74	468c0533-dc1e-4ca9-8a33-f0e98c58999e	0	2026-04-25 11:34:18.09+00	2026-04-25 11:34:18.09+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
d75b6d3c-07b3-424f-9e8e-36b970a1a935	28bb8e48-c675-44a3-883b-652dfcb874de	33469b0f-7f2a-45c7-be4e-f684462d5e9b	0	2026-04-25 11:34:18.095+00	2026-04-25 11:34:18.095+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
faff9935-85d3-4895-a95b-dd1f7ac88a86	a34864bb-f99c-4759-9dd0-df8dea0c20ec	57f637a3-3e2e-4581-b4f1-6b938c95eebd	0	2026-04-25 11:34:18.096+00	2026-04-25 11:34:18.096+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
2937ecd6-f8c5-481b-bfbd-e235d34f2ee3	c4c55984-9264-42e8-a263-d179a0438c19	60e0339f-0c06-4d94-a3f4-3d8e2387eb09	0	2026-04-25 11:34:18.101+00	2026-04-25 11:34:18.101+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
71cb2dc3-0e32-4eb6-b00a-6675dd4f7869	39898786-1691-4a18-b0bf-b60c55d010e3	bfbcf2ce-5ff0-4dc1-a799-1943f4eda720	0	2026-04-25 11:34:18.107+00	2026-04-25 11:34:18.107+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
61972e47-42b2-4370-a7f3-3f57bdf92f6c	8ddc87c9-7879-4441-b35d-3f551174e1fa	b2ff6c93-f60c-43bf-95f9-26419f15051b	0	2026-04-25 11:34:18.112+00	2026-04-25 11:34:18.112+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
4c430212-0f0b-4ff9-8845-6b38661f874b	905a4b0a-713e-4f17-ae88-a2eef256aed3	fd7c4c80-01c7-4736-a495-ee703a78dcbf	0	2026-04-25 11:34:18.113+00	2026-04-25 11:34:18.113+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
c88e4458-5eb2-4c27-93dd-ea3ed2e499f3	025e035f-68ac-473b-9c40-bf00e72850dd	9b520cca-5d16-4d80-8126-246caa292304	0	2026-04-25 11:34:18.117+00	2026-04-25 11:34:18.117+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
6a5767b4-031b-4d86-84b5-06a47fa48d77	c3ad7300-b35c-4112-bf0f-71280156b409	ad54a378-b88d-4af3-bb41-c2782f34a7e9	0	2026-04-25 11:34:18.118+00	2026-04-25 11:34:18.118+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
5ea19e24-3dbc-490d-9f09-56110120fcfd	b20aa986-83ce-44a6-a59b-03487c754a4f	53c18a4a-d4e3-47a7-8a89-cadba152652d	0	2026-04-25 11:34:18.124+00	2026-04-25 11:34:18.124+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
6ca3203b-42bc-4aa5-b650-f827f1c82980	3d0b5c0a-3b07-4316-994b-b0d11e374f61	50eafb63-5b53-485c-b734-ca8fdc19e6df	0	2026-04-25 12:15:04.324+00	2026-04-25 12:15:04.324+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
5b0aa3e7-1691-4ecb-a5e4-91abc1993e44	cb117c5a-47e1-4881-9d67-0b2708e6e609	58cade63-d20f-4e00-bb68-ce7fcc6a8857	0	2026-04-25 12:25:53.111+00	2026-04-25 12:25:53.111+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
7298456c-7e2d-497b-afde-e3fed6f03bba	24085ebb-679c-4a6b-8808-7503a6933dd5	a0141d57-0b6e-4721-9e40-461a4a1032d9	0	2026-04-25 12:31:08.519+00	2026-04-25 12:31:08.519+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00
\.


--
-- Data for Name: indexMetadata; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."indexMetadata" (id, "createdAt", "updatedAt", name, "workspaceId", "objectMetadataId", "isCustom", "isUnique", "indexWhereClause", "indexType", "universalIdentifier", "applicationId") FROM stdin;
33873497-d8e2-4611-be68-0189b0e7ff61	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_3491dc65669342b9bfb1637f5e0	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	55f3cb52-620e-4800-9570-47a43ee138c5	f	f	\N	BTREE	b8d4f9a3-0c25-4e7b-9f6a-2d3e4c5b6f70	4a5dec44-2fb8-4d70-a6e0-6f483b222082
8dbcffe4-4d51-4b4b-af66-33b3eaad52da	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_699ff395576ff0f73cc87464166	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	55f3cb52-620e-4800-9570-47a43ee138c5	f	f	\N	BTREE	9d31ea73-13b6-4e06-84ee-c66c72bf7787	4a5dec44-2fb8-4d70-a6e0-6f483b222082
8f109e14-69af-4c96-9122-c336f0608fb9	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_04d8ad72536bbeb4430998211f8	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	55f3cb52-620e-4800-9570-47a43ee138c5	f	f	\N	BTREE	55637a5a-1edc-4351-8d76-d40020bf8944	4a5dec44-2fb8-4d70-a6e0-6f483b222082
bcb82fa3-0c8d-4186-b575-77e28f269380	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_21649fe7fe250834d1dd37125b1	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	55f3cb52-620e-4800-9570-47a43ee138c5	f	f	\N	BTREE	4137ba06-184d-438f-b484-080f02a97659	4a5dec44-2fb8-4d70-a6e0-6f483b222082
158c7567-1683-485c-8743-1471b5e075ef	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_fde993c7020a17c3282edf5c9b8	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	55f3cb52-620e-4800-9570-47a43ee138c5	f	f	\N	BTREE	8cc162d1-c127-4981-878d-f78622f8f12d	4a5dec44-2fb8-4d70-a6e0-6f483b222082
fa29b61f-4dbd-43c4-8fab-ef0cb8998898	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_4c7e63468918a5d5233ccb65de7	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	55f3cb52-620e-4800-9570-47a43ee138c5	f	f	\N	BTREE	c10eba2d-ff1a-4eab-9285-50481c12a003	4a5dec44-2fb8-4d70-a6e0-6f483b222082
0359748f-6575-4902-83af-6586f7faecf4	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_30f5fd16a4aa058d1a6c4b8ac10	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	55f3cb52-620e-4800-9570-47a43ee138c5	f	f	\N	BTREE	fadeab4b-79ee-4173-af79-72c51fbad888	4a5dec44-2fb8-4d70-a6e0-6f483b222082
d72d2416-1357-4d11-9f24-e32b58accca5	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_9e247b4ab168100e4aa8fb6a853	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	d7c8875d-11aa-42e2-a58a-07bb30bf96af	f	f	\N	BTREE	4daf320e-74d0-4f24-a45a-af3a09d741cb	4a5dec44-2fb8-4d70-a6e0-6f483b222082
ba2646e8-7c87-43ce-83e0-5505fde9cbaa	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_968d4fd721a78b75c13a1b9ec12	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	e96a74e5-e74b-47b2-a74d-e4558552dd98	f	f	\N	BTREE	ff6b86c1-3112-4dfa-b734-c4789111a716	4a5dec44-2fb8-4d70-a6e0-6f483b222082
13a4c1ba-43fc-41b6-925f-b8af5d6b8e55	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_733381453fca683f36c05af5478	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	e96a74e5-e74b-47b2-a74d-e4558552dd98	f	f	\N	BTREE	47a3c8d2-9f14-4b6e-8c5d-1a2b3f4e5c69	4a5dec44-2fb8-4d70-a6e0-6f483b222082
5500fd1e-5feb-455f-9e2f-35e5b442d7e5	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_7b40c7f03dd1f998ba765ad0730	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	6be8bb14-8b85-4a2d-ba87-40a4e6b9a586	f	f	\N	BTREE	58b4d9e3-0a25-4c7f-9d6e-2b3c4a5f6d70	4a5dec44-2fb8-4d70-a6e0-6f483b222082
e84c0dd4-7a76-4e78-98b2-d3190056393d	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_40150517e4f1ab6154e426eafce	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	03a73b6b-0eb4-4b17-b71f-a44968cea457	f	f	\N	BTREE	c458ad97-8b95-43de-9003-88eb68576049	4a5dec44-2fb8-4d70-a6e0-6f483b222082
c2d74d16-bfc1-44c6-9480-e92a6244ed28	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_ba8418718688702d3113fde2fe1	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	03a73b6b-0eb4-4b17-b71f-a44968cea457	f	f	\N	BTREE	30e9b75a-881f-4a85-aaf1-f2d2464be1cf	4a5dec44-2fb8-4d70-a6e0-6f483b222082
ccee7b8f-f0ed-4601-929b-6a75251634e0	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_70c8cfc3c0c8407789db32ad9cf	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	03a73b6b-0eb4-4b17-b71f-a44968cea457	f	f	\N	BTREE	898aa202-428f-4a7a-a3b3-8f0a17a6658e	4a5dec44-2fb8-4d70-a6e0-6f483b222082
5fd7e084-0975-4322-a256-83ab031e61e5	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_f719a95179070eac397ba18dc70	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	1b9bb040-2722-44d7-a5ac-4e251b541f13	f	f	\N	BTREE	ec2ebfc9-0c9b-4597-a87d-aa295e2d8bfe	4a5dec44-2fb8-4d70-a6e0-6f483b222082
40caeac6-5187-44c4-bcb2-a9d5eb5b6d4c	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_UNIQUE_2a32339058d0b6910b0834ddf81	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	1b9bb040-2722-44d7-a5ac-4e251b541f13	f	t	\N	BTREE	dd300c61-f422-467a-91f4-de4f83c4175b	4a5dec44-2fb8-4d70-a6e0-6f483b222082
191686d1-bd9f-4ab6-b9e5-b60b396813e8	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_fb1f4905546cfc6d70a971c76f7	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	1b9bb040-2722-44d7-a5ac-4e251b541f13	f	f	\N	GIN	c3eb62df-2cc1-4cc3-b7aa-e96a4d65c633	4a5dec44-2fb8-4d70-a6e0-6f483b222082
eb214fea-41d2-4d37-8a95-a449506fdfc8	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_3c8bbe54bd34f40dfe2d05ac964	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	45600963-91d4-4b77-8fb6-449c8e3c1f44	f	f	\N	BTREE	8e7ca28e-6002-4304-9dcc-0a8da93ca198	4a5dec44-2fb8-4d70-a6e0-6f483b222082
bd07cac1-d9a1-46b6-bc81-c5757a819eb1	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_f3b76c5322b31cba175b2eccec8	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	8bf7b8ba-a68b-49dc-8e9a-661cf9d528c4	f	f	\N	GIN	e69f71aa-de0f-4b70-845f-7a8369c47928	4a5dec44-2fb8-4d70-a6e0-6f483b222082
030a3529-8177-40c3-bccc-7d2c3768aa86	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_5d002cd3b5be1cb05c0b7b28582	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	8e627e4e-e9cf-4890-af92-46559fb5f36e	f	f	\N	BTREE	7a05b45e-7aa6-4a7e-9bbc-299cbed53c96	4a5dec44-2fb8-4d70-a6e0-6f483b222082
bde60e2c-19ec-48b7-be16-0cd3301db0f4	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_bf1967e8710f32f1a65c67fb4b4	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	711ed2e9-cc32-45af-ba39-7066034c618e	f	f	\N	BTREE	ab09a386-4dcc-41f7-8dc6-a6071e9c64b7	4a5dec44-2fb8-4d70-a6e0-6f483b222082
7371e91d-01bc-4051-99a6-8175fc541d10	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_2e85541b739066142845bdef99a	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	254569df-6932-4d1b-abcd-cb0f250b72ed	f	f	\N	BTREE	9894f9a3-0225-4e7b-9f6a-23d4e2576784	4a5dec44-2fb8-4d70-a6e0-6f483b222082
43db0cb7-d744-4e0b-96b7-57ecfa538762	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_3f4c0095cf17b62868bec089fab	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	254569df-6932-4d1b-abcd-cb0f250b72ed	f	f	\N	BTREE	9bb24d40-60dd-4beb-8c64-a74e8c67f9ee	4a5dec44-2fb8-4d70-a6e0-6f483b222082
78d57976-c053-4399-be01-0b0ad81089ea	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_da56d8b595a778d404eae01f29b	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	254569df-6932-4d1b-abcd-cb0f250b72ed	f	f	"deletedAt" IS NULL	BTREE	1b86ece8-7ce3-4df3-8771-fd4b5d45b2f2	4a5dec44-2fb8-4d70-a6e0-6f483b222082
5a9e95ef-4cf9-4d2d-a6b6-aca9841f8ba4	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_daf00d51b50634730fd77f16bb6	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	b03dcd32-17eb-4bd2-b529-7e0bbc7d4cdd	f	f	\N	BTREE	8e6038aa-1f79-4a84-87b5-f33caa172e98	4a5dec44-2fb8-4d70-a6e0-6f483b222082
305c6920-6f7d-46a3-a78f-099291ee60ad	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_1db95a87400f7679efc43a15e68	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	b03dcd32-17eb-4bd2-b529-7e0bbc7d4cdd	f	f	\N	BTREE	905299c3-ca81-435d-901c-f68b87562516	4a5dec44-2fb8-4d70-a6e0-6f483b222082
a2f6c295-1d61-4d62-a767-eeddcc1d7cc6	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_55c9aaf7039b09cec455a872dde	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	b03dcd32-17eb-4bd2-b529-7e0bbc7d4cdd	f	f	"deletedAt" IS NULL	BTREE	a3de1788-5dff-4849-ac5a-0dabe5fab216	4a5dec44-2fb8-4d70-a6e0-6f483b222082
087b8bd7-6601-45a4-95c3-276231b6cfa1	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_a1bbe482462d9f016582d99d4e6	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	e48dd522-875c-4937-9d9b-3a41a8cb0f1e	f	f	\N	BTREE	6217f2a5-28ac-4b88-8a2a-45eee4580e57	4a5dec44-2fb8-4d70-a6e0-6f483b222082
84694590-f282-4ed5-bd1c-e27698dc93cb	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_19ad12ae96a5d4357ff3a15ba2b	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	ee0c23a3-0eb3-4d06-9b63-e89466584e21	f	f	\N	BTREE	ab0863ba-f95e-493c-b86c-56e1bc7e5bc2	4a5dec44-2fb8-4d70-a6e0-6f483b222082
6a2066b7-046d-41ba-b10e-914eeaa1d7e9	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_47a5ea9e149973d6ef980bdc4f1	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	ee0c23a3-0eb3-4d06-9b63-e89466584e21	f	f	\N	BTREE	df805c2e-3bfe-4d51-8309-75e5eb4052fe	4a5dec44-2fb8-4d70-a6e0-6f483b222082
9cb3f80b-fac3-4222-a367-16e03c43b5ba	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_7a56509bca48a709378017a9135	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	ee0c23a3-0eb3-4d06-9b63-e89466584e21	f	f	\N	BTREE	ce1e3a9e-afe9-439d-abb7-6cc98a6fa405	4a5dec44-2fb8-4d70-a6e0-6f483b222082
a7f3fe4d-72a0-4bc0-bf5a-8e6884a9fcbc	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_f20de8d7fc74a405e4083051275	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	0996fb48-437d-4a52-a0bd-098f18a09105	f	f	\N	GIN	8183c8d2-9114-4b6e-8c5d-12a3b14a5a13	4a5dec44-2fb8-4d70-a6e0-6f483b222082
5f3a79f5-88e7-43fa-a056-38c01f6df46e	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_7e2582241f3b749d7a43d7d0231	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2f8e7625-5a41-40dd-be67-29f99a4dc30e	f	f	\N	BTREE	9294d9e3-0225-4c7f-9d6e-23b4c25b6b24	4a5dec44-2fb8-4d70-a6e0-6f483b222082
66e6ebae-78bc-4fa8-91d9-8b3dcb88ac00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_a1e176335c31525bf3cc12f0e00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2f8e7625-5a41-40dd-be67-29f99a4dc30e	f	f	\N	BTREE	7c069dc0-e83b-4cd5-aaa2-cac7f3e00d80	4a5dec44-2fb8-4d70-a6e0-6f483b222082
99bf96b4-b308-4a3a-bc36-8a87f83879b2	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_2f07fa4cf183061692f8d99df80	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2f8e7625-5a41-40dd-be67-29f99a4dc30e	f	f	\N	BTREE	2d83909a-a383-4e82-b00a-8b7739f3f906	4a5dec44-2fb8-4d70-a6e0-6f483b222082
f2ca8bd9-fb98-47d0-a4bc-dbed687bcaa5	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_9058210268a941b4b77a609e982	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2f8e7625-5a41-40dd-be67-29f99a4dc30e	f	f	\N	BTREE	0d1a59b4-cc87-4b7d-804a-656e8504f371	4a5dec44-2fb8-4d70-a6e0-6f483b222082
5253ff8f-10e7-4820-a0ae-1381fad065c7	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_c0ac950d77b75527f654b7f6a06	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	19d8f9ef-3d91-4bea-8281-59d7548d04da	f	f	\N	BTREE	b8c2a673-a981-4357-a43d-313a358e4daa	4a5dec44-2fb8-4d70-a6e0-6f483b222082
60b2b5f1-baaf-401a-b202-db64f95a2dcd	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_4b9feee3298c853326bf6ff8e42	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	19d8f9ef-3d91-4bea-8281-59d7548d04da	f	f	\N	BTREE	e161072d-37b1-477a-b944-ef0d65289574	4a5dec44-2fb8-4d70-a6e0-6f483b222082
867fa324-3219-44ce-8956-817b39657a2e	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_ae112c10e060420923011767b14	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	19d8f9ef-3d91-4bea-8281-59d7548d04da	f	f	\N	BTREE	ae60d580-b562-44f2-a24d-7b8040063f83	4a5dec44-2fb8-4d70-a6e0-6f483b222082
173e2a65-a16e-428f-96c5-27af52305315	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_9f96d65260c4676faac27cb6bf3	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	19d8f9ef-3d91-4bea-8281-59d7548d04da	f	f	\N	GIN	f53fdd28-a26b-47ba-81b5-6813ad622720	4a5dec44-2fb8-4d70-a6e0-6f483b222082
4f5c9cc3-debc-4506-b5b9-c596ec0937ba	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_ae09ff97967369e0644bacc0fce	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f59c15d0-9a52-4e93-b44f-ed4fc4bd90be	f	f	\N	BTREE	8a265a5c-d3ae-47dc-bdf9-b42cfa2ba639	4a5dec44-2fb8-4d70-a6e0-6f483b222082
e5aba424-7399-490c-a110-32b45fc5ce62	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_UNIQUE_87914cd3ce963115f8cb943e2ac	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f59c15d0-9a52-4e93-b44f-ed4fc4bd90be	f	t	\N	BTREE	8183a8b2-9114-4f6c-8a5b-12e3f14e5e13	4a5dec44-2fb8-4d70-a6e0-6f483b222082
667e0323-0ae1-4dcf-aea9-d83230bd38e3	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_bbd7aec1976fc684a0a5e4816c9	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f59c15d0-9a52-4e93-b44f-ed4fc4bd90be	f	f	\N	GIN	9294b9c3-0225-4a7d-9b6c-23f4a25f6f24	4a5dec44-2fb8-4d70-a6e0-6f483b222082
3b4f8900-5e27-4e25-91a3-68a293ce8874	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_b5b4da613fc4d734f65fb1deb6b	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	a91a647d-4acf-456b-961b-40fbb3788c6d	f	f	\N	BTREE	f48fa3b1-0cec-44da-a9e5-f8a5e766637e	4a5dec44-2fb8-4d70-a6e0-6f483b222082
93162f51-65d1-453c-bb33-f4bc4292fffe	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_d01a000cf26e1225d894dc3d364	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	a91a647d-4acf-456b-961b-40fbb3788c6d	f	f	\N	GIN	a86b32b3-01d3-4302-a152-8b7f247db7b4	4a5dec44-2fb8-4d70-a6e0-6f483b222082
51c451b8-e600-40c3-bb16-6fa16661a308	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_74ad70941560ba6b2a179ad460c	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	5277c856-9ccc-41e4-ae01-f077f1c61574	f	f	\N	BTREE	c882f7a4-b025-4d32-aa26-5ef2595bdbf9	4a5dec44-2fb8-4d70-a6e0-6f483b222082
3d6e4d02-1f2f-42ae-b3bd-eb431b0e4277	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_f3d9b01b0d587804e7beeb2a534	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	5277c856-9ccc-41e4-ae01-f077f1c61574	f	f	\N	BTREE	b7d305d1-6fae-4ed6-9bdc-354fe9032c0e	4a5dec44-2fb8-4d70-a6e0-6f483b222082
209a43c8-512b-4862-9739-17640be0fa5b	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_419778384cd97935db3e246f589	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	5277c856-9ccc-41e4-ae01-f077f1c61574	f	f	\N	BTREE	c0af54c7-751b-4bb2-b102-677cc4e47402	4a5dec44-2fb8-4d70-a6e0-6f483b222082
e6a94a2b-2954-414a-a518-e534b1379a1c	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_f0e95ec5e72b91f28fffac1201b	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	5277c856-9ccc-41e4-ae01-f077f1c61574	f	f	\N	BTREE	6942e0ba-90f6-4c33-bf40-7f00b1ec35ab	4a5dec44-2fb8-4d70-a6e0-6f483b222082
6b26d1b1-018a-486a-a92e-a8bc3d88c70e	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_dc68847d0ff0b17baef8fb632c2	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	22213a4b-0696-4b0b-90e1-975e86ba2902	f	f	\N	BTREE	5e0b2391-85ca-4a66-aef4-52d74245bec2	4a5dec44-2fb8-4d70-a6e0-6f483b222082
02d0a6be-7447-465c-bdcf-bec43555bb6e	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_e49dd7da4ed5c919babcd31c93b	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	22213a4b-0696-4b0b-90e1-975e86ba2902	f	f	\N	BTREE	3e89a914-7bec-47bd-9cf9-743c6b83d001	4a5dec44-2fb8-4d70-a6e0-6f483b222082
ec566285-b08e-4ece-8022-6291c1d9e0ec	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_9b267fc4a89dd1aaec4c5340f05	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	22213a4b-0696-4b0b-90e1-975e86ba2902	f	f	\N	BTREE	8183e8f2-9114-4d6a-8e5f-12c3d14c5c13	4a5dec44-2fb8-4d70-a6e0-6f483b222082
2ba9e5e9-469a-476a-8501-fe410c397a7e	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_62d09af534224aa478109b2d585	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	22213a4b-0696-4b0b-90e1-975e86ba2902	f	f	\N	BTREE	9294f9a3-0225-4e7b-9f6a-23d4e25d6d24	4a5dec44-2fb8-4d70-a6e0-6f483b222082
bb904ade-4f60-4711-b473-c8ccf3783f6a	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_26a021921ba73b428be8f244ded	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	22213a4b-0696-4b0b-90e1-975e86ba2902	f	f	\N	BTREE	995db1d8-0d3e-40f7-b0eb-5e6897bc9966	4a5dec44-2fb8-4d70-a6e0-6f483b222082
a6d2224c-6a18-41d8-8ed3-63c9a0cf9b1d	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_1ff229b8237e8368a92c08d11f0	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	22213a4b-0696-4b0b-90e1-975e86ba2902	f	f	\N	BTREE	609cf622-86ef-48d1-812b-e1cab610a46c	4a5dec44-2fb8-4d70-a6e0-6f483b222082
517e6518-5079-4566-b694-f089dd314deb	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_9a2065c2b56ffe8b74d1a12705f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	22213a4b-0696-4b0b-90e1-975e86ba2902	f	f	\N	BTREE	d6059ec2-92b0-4cfc-9fd8-78050f03108f	4a5dec44-2fb8-4d70-a6e0-6f483b222082
9fa12d2c-4ad9-4479-adb3-f20786df34c3	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_953cb9c73db904f98697f4867b2	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	22213a4b-0696-4b0b-90e1-975e86ba2902	f	f	\N	BTREE	d94329b3-5dc8-4141-ae28-31afe28f7135	4a5dec44-2fb8-4d70-a6e0-6f483b222082
5a8b1969-f6ba-41d1-991a-e17109f3fde3	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_58b130a455b1451066c84dc63e2	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	22213a4b-0696-4b0b-90e1-975e86ba2902	f	f	\N	BTREE	1a2bd046-7c23-4e0a-9f8a-c3ca3a16d3b9	4a5dec44-2fb8-4d70-a6e0-6f483b222082
e257f50d-2303-4c54-baea-de0e3e6dae74	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_6b2a27852dd0e0846577662a33a	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	22213a4b-0696-4b0b-90e1-975e86ba2902	f	f	\N	BTREE	e8821da9-728d-470a-bf5b-5a981fff7880	4a5dec44-2fb8-4d70-a6e0-6f483b222082
28bb8e48-c675-44a3-883b-652dfcb874de	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_d09fc4b1711543f42c127270f1e	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	0f1f4454-5436-4ddd-b99b-5426058af575	f	f	\N	GIN	c7e64c55-eb0c-4b93-b076-5cfcf2e2e042	4a5dec44-2fb8-4d70-a6e0-6f483b222082
a34864bb-f99c-4759-9dd0-df8dea0c20ec	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_397bfb7946782933c476b98d925	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	c407d619-2c05-491f-b2fd-b9481d652bc9	f	f	\N	BTREE	7331ff89-a3f9-4ac0-9fa9-0de5663ae7b2	4a5dec44-2fb8-4d70-a6e0-6f483b222082
c4c55984-9264-42e8-a263-d179a0438c19	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_9fdeb410f15f569f2843698c5b3	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	bfd36b0d-202c-430c-8f42-12ed18cb1f6a	f	f	\N	BTREE	8183c8d2-9114-4b6e-8c5d-12a3b14a5a14	4a5dec44-2fb8-4d70-a6e0-6f483b222082
39898786-1691-4a18-b0bf-b60c55d010e3	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_eced9eb2a6cc8f9a5b49fe4b04e	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	bfd36b0d-202c-430c-8f42-12ed18cb1f6a	f	f	\N	BTREE	9294d9e3-0225-4c7f-9d6e-23b4c25b6b25	4a5dec44-2fb8-4d70-a6e0-6f483b222082
8ddc87c9-7879-4441-b35d-3f551174e1fa	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_261d8661b94dbb98cc85cffab46	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	bfd36b0d-202c-430c-8f42-12ed18cb1f6a	f	f	\N	GIN	e0ac5ad2-d0c8-4f72-b710-8e53b9dc18d9	4a5dec44-2fb8-4d70-a6e0-6f483b222082
905a4b0a-713e-4f17-ae88-a2eef256aed3	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_6dbfc4d091e55b676e5f698c2c2	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	72cb4e16-ed23-4e5a-8ed3-47fd5f979113	f	f	\N	BTREE	8138c3b3-0b14-4ee1-be0e-debdde6b3219	4a5dec44-2fb8-4d70-a6e0-6f483b222082
025e035f-68ac-473b-9c40-bf00e72850dd	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_51329bbcdab6618a75361670c26	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	72cb4e16-ed23-4e5a-8ed3-47fd5f979113	f	f	\N	GIN	6f3a65eb-2aee-4108-b8a0-c62da419d1dc	4a5dec44-2fb8-4d70-a6e0-6f483b222082
c3ad7300-b35c-4112-bf0f-71280156b409	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_UNIQUE_39954942ffa78c957b5dee47739	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	0286cdc7-a914-4a77-9afa-1fd5831fcb59	f	t	\N	BTREE	76da5f27-523c-44b6-ad06-12954f6b949f	4a5dec44-2fb8-4d70-a6e0-6f483b222082
b20aa986-83ce-44a6-a59b-03487c754a4f	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	IDX_e47451872f70c8f187a6b460ac7	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	0286cdc7-a914-4a77-9afa-1fd5831fcb59	f	f	\N	GIN	8678dde9-a804-4a9e-80e3-9af35e471ec5	4a5dec44-2fb8-4d70-a6e0-6f483b222082
3d0b5c0a-3b07-4316-994b-b0d11e374f61	2026-04-25 12:15:04.227+00	2026-04-25 12:15:04.227+00	IDX_a975841121f56bbd023071fce69	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	a64cec42-2523-4102-b0d6-fdbb2f937bb6	f	f	\N	GIN	200a92fb-32cf-4cbf-b95e-8296af19393d	8c07d085-7bf4-4849-934d-3c70dcf4340d
cb117c5a-47e1-4881-9d67-0b2708e6e609	2026-04-25 12:25:53.066+00	2026-04-25 12:25:53.066+00	IDX_22908125b74f1a7984b460d4ccb	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	185d031c-a8d4-42b4-b9b8-55a8e1c6e608	f	f	\N	GIN	cfe315ce-bea7-4737-adf7-f3fdadca96a8	8c07d085-7bf4-4849-934d-3c70dcf4340d
24085ebb-679c-4a6b-8808-7503a6933dd5	2026-04-25 12:31:08.48+00	2026-04-25 12:31:08.48+00	IDX_ad176b81735717e4ff6e46be6c2	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	185d031c-a8d4-42b4-b9b8-55a8e1c6e608	t	f	\N	BTREE	5085a4bb-49a6-4b67-96fd-8c1f5b463ec0	8c07d085-7bf4-4849-934d-3c70dcf4340d
\.


--
-- Data for Name: keyValuePair; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."keyValuePair" (id, "userId", "workspaceId", key, value, "textValueDeprecated", type, "createdAt", "updatedAt", "deletedAt") FROM stdin;
\.


--
-- Data for Name: logicFunction; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."logicFunction" (id, name, description, runtime, "timeoutSeconds", "workspaceId", "createdAt", "updatedAt", "deletedAt", "universalIdentifier", "applicationId", checksum, "sourceHandlerPath", "handlerName", "toolInputSchema", "isTool", "builtHandlerPath", "cronTriggerSettings", "databaseEventTriggerSettings", "httpRouteTriggerSettings", "isBuildUpToDate") FROM stdin;
a82e3309-11ae-552c-a456-d803c30162d1	Extract domain from email	Extracts a normalized company domain and URL from a person email address.	nodejs22.x	300	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:18.982+00	2026-04-25 11:34:18.982+00	\N	9356b6e2-ca40-4b40-9e3d-a0acc2c57c5f	8c07d085-7bf4-4849-934d-3c70dcf4340d	\N	a82e3309-11ae-552c-a456-d803c30162d1/src/index.ts	main	{"type": "object", "required": ["email"], "properties": {"email": {"type": "string"}}}	f	a82e3309-11ae-552c-a456-d803c30162d1/src/index.mjs	\N	\N	\N	f
8e00d17d-60e3-5bbc-bc04-1a591fd2d50e	Find matching company by domain	Finds an existing company whose website matches a normalized registrable domain.	nodejs22.x	300	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:19.031+00	2026-04-25 11:34:19.031+00	\N	1f5a7a45-baa6-4728-9380-795d03055903	8c07d085-7bf4-4849-934d-3c70dcf4340d	\N	8e00d17d-60e3-5bbc-bc04-1a591fd2d50e/src/index.ts	main	{"type": "object", "required": ["companies", "domain"], "properties": {"domain": {"type": "string"}, "companies": {"type": "array", "items": {"type": "object"}}}}	f	8e00d17d-60e3-5bbc-bc04-1a591fd2d50e/src/index.mjs	\N	\N	\N	f
e74f8dec-3d4a-5504-94ec-de196a36805e	Is this a personal email?	Detects whether an email address belongs to a common personal email provider.	nodejs22.x	300	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:19.052+00	2026-04-25 11:34:19.052+00	\N	476f3c55-e6ca-4666-87b8-43169ea8c063	8c07d085-7bf4-4849-934d-3c70dcf4340d	\N	e74f8dec-3d4a-5504-94ec-de196a36805e/src/index.ts	main	{"type": "object", "required": ["primaryEmail"], "properties": {"primaryEmail": {"type": "string"}}}	f	e74f8dec-3d4a-5504-94ec-de196a36805e/src/index.mjs	\N	\N	\N	f
\.


--
-- Data for Name: logicFunctionLayer; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."logicFunctionLayer" (id, "packageJson", "yarnLock", "yarnLockChecksum", "workspaceId", "createdAt", "updatedAt", "packageJsonChecksum", "availablePackages") FROM stdin;
\.


--
-- Data for Name: messageChannel; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."messageChannel" ("workspaceId", id, visibility, handle, type, "isContactAutoCreationEnabled", "contactAutoCreationPolicy", "messageFolderImportPolicy", "excludeNonProfessionalEmails", "excludeGroupEmails", "pendingGroupEmailsAction", "isSyncEnabled", "syncCursor", "syncedAt", "syncStatus", "syncStage", "syncStageStartedAt", "throttleFailureCount", "throttleRetryAfter", "connectedAccountId", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: messageFolder; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."messageFolder" ("workspaceId", id, name, "syncCursor", "isSentFolder", "isSynced", "parentFolderId", "externalId", "pendingSyncAction", "messageChannelId", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: navigationMenuItem; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."navigationMenuItem" ("workspaceId", "universalIdentifier", "applicationId", id, "userWorkspaceId", "targetRecordId", "targetObjectMetadataId", "viewId", name, "folderId", "position", "createdAt", "updatedAt", link, color, icon, type, "pageLayoutId") FROM stdin;
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	20202020-b001-4b01-8b01-c0aba11c0001	4a5dec44-2fb8-4d70-a6e0-6f483b222082	0f683d3a-15f6-49ef-995f-b36a67041b44	\N	\N	1b9bb040-2722-44d7-a5ac-4e251b541f13	\N	\N	\N	0	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	blue	\N	OBJECT	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	20202020-b002-4b02-8b02-c0aba11c0002	4a5dec44-2fb8-4d70-a6e0-6f483b222082	62e0487e-6a0f-4072-bb92-6b91c5fb6bde	\N	\N	8bf7b8ba-a68b-49dc-8e9a-661cf9d528c4	\N	\N	\N	5	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	gray	\N	OBJECT	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	20202020-b003-4b03-8b03-c0aba11c0003	4a5dec44-2fb8-4d70-a6e0-6f483b222082	7642fee1-4aa4-42c5-a6f7-291cb8215a42	\N	\N	0996fb48-437d-4a52-a0bd-098f18a09105	\N	\N	\N	4	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	turquoise	\N	OBJECT	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	20202020-b004-4b04-8b04-c0aba11c0004	4a5dec44-2fb8-4d70-a6e0-6f483b222082	bee834d4-861f-42db-b2d0-f0f97cf015e9	\N	\N	19d8f9ef-3d91-4bea-8281-59d7548d04da	\N	\N	\N	2	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	red	\N	OBJECT	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	20202020-b005-4b05-8b05-c0aba11c0005	4a5dec44-2fb8-4d70-a6e0-6f483b222082	6f7cf20d-3325-419b-b80a-aa967cf754d8	\N	\N	f59c15d0-9a52-4e93-b44f-ed4fc4bd90be	\N	\N	\N	1	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	blue	\N	OBJECT	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	20202020-b006-4b06-8b06-c0aba11c0006	4a5dec44-2fb8-4d70-a6e0-6f483b222082	c748102f-80da-4af5-bc30-c68614ae1257	\N	\N	a91a647d-4acf-456b-961b-40fbb3788c6d	\N	\N	\N	3	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	turquoise	\N	OBJECT	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	20202020-b007-4b07-8b07-c0aba11c0007	4a5dec44-2fb8-4d70-a6e0-6f483b222082	3433433f-6f00-47e4-948c-8d71b841a8a4	\N	\N	\N	\N	Workflows	\N	6	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	orange	IconSettingsAutomation	FOLDER	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	20202020-b008-4b08-8b08-c0aba11c0008	4a5dec44-2fb8-4d70-a6e0-6f483b222082	b8c3a900-a84b-4539-b39b-5013b6f59301	\N	\N	0f1f4454-5436-4ddd-b99b-5426058af575	\N	\N	3433433f-6f00-47e4-948c-8d71b841a8a4	0	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	gray	\N	OBJECT	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	20202020-b009-4b09-8b09-c0aba11c0009	4a5dec44-2fb8-4d70-a6e0-6f483b222082	e447397b-f174-4b20-b174-597a4958b59c	\N	\N	bfd36b0d-202c-430c-8f42-12ed18cb1f6a	\N	\N	3433433f-6f00-47e4-948c-8d71b841a8a4	1	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	gray	\N	OBJECT	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	20202020-b00a-4b0a-8b0a-c0aba11c000a	4a5dec44-2fb8-4d70-a6e0-6f483b222082	9380578e-f37f-4b01-8c79-307e4684f893	\N	\N	72cb4e16-ed23-4e5a-8ed3-47fd5f979113	\N	\N	3433433f-6f00-47e4-948c-8d71b841a8a4	2	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	gray	\N	OBJECT	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	ac5d8555-b1dc-4301-8125-f3890c30055b	8c07d085-7bf4-4849-934d-3c70dcf4340d	ac5d8555-b1dc-4301-8125-f3890c30055b	\N	\N	a64cec42-2523-4102-b0d6-fdbb2f937bb6	\N	\N	\N	8	2026-04-25 12:15:04.228+00	2026-04-25 12:15:04.228+00	\N	\N	\N	OBJECT	\N
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	b4b307f4-5873-4ad9-b662-5f9b6b4788b1	8c07d085-7bf4-4849-934d-3c70dcf4340d	b4b307f4-5873-4ad9-b662-5f9b6b4788b1	\N	\N	185d031c-a8d4-42b4-b9b8-55a8e1c6e608	\N	\N	\N	9	2026-04-25 12:25:53.067+00	2026-04-25 12:25:53.067+00	\N	\N	\N	OBJECT	\N
\.


--
-- Data for Name: objectMetadata; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."objectMetadata" (id, "dataSourceId", "nameSingular", "namePlural", "labelSingular", "labelPlural", description, icon, "standardOverrides", "targetTableName", "isCustom", "isRemote", "isActive", "isSystem", "isUIReadOnly", "isAuditLogged", "isSearchable", "duplicateCriteria", shortcut, "labelIdentifierFieldMetadataId", "imageIdentifierFieldMetadataId", "isLabelSyncedWithName", "workspaceId", "createdAt", "updatedAt", "applicationId", "universalIdentifier", color) FROM stdin;
55f3cb52-620e-4800-9570-47a43ee138c5	\N	attachment	attachments	Attachment	Attachments	An attachment	IconFileImport	\N	DEPRECATED	f	f	t	t	f	t	f	\N	\N	a748e36c-e180-4d65-9b88-2490b949256f	\N	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	4a5dec44-2fb8-4d70-a6e0-6f483b222082	20202020-bd3d-4c60-8dca-571c71d4447a	\N
d7c8875d-11aa-42e2-a58a-07bb30bf96af	\N	blocklist	blocklists	Blocklist	Blocklists	Blocklist	IconForbid2	\N	DEPRECATED	f	f	t	t	f	t	f	\N	\N	0a86787e-385e-48ea-a8f2-4b4d7416edd4	\N	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	4a5dec44-2fb8-4d70-a6e0-6f483b222082	20202020-0408-4f38-b8a8-4d5e3e26e24d	\N
e96a74e5-e74b-47b2-a74d-e4558552dd98	\N	calendarChannelEventAssociation	calendarChannelEventAssociations	Calendar Channel Event Association	Calendar Channel Event Associations	Calendar Channel Event Associations	IconCalendar	\N	DEPRECATED	f	f	t	t	f	f	f	\N	\N	b6166483-79e3-42e9-9c91-344d35a1ee36	\N	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	4a5dec44-2fb8-4d70-a6e0-6f483b222082	20202020-491b-4aaa-9825-afd1bae6ae00	\N
6be8bb14-8b85-4a2d-ba87-40a4e6b9a586	\N	calendarChannel	calendarChannels	Calendar Channel	Calendar Channels	Calendar Channels	IconCalendar	\N	DEPRECATED	f	f	t	t	f	f	f	\N	\N	bf6b952d-9fbd-471b-97c1-235fd7ce1f59	\N	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	4a5dec44-2fb8-4d70-a6e0-6f483b222082	20202020-e8f2-40e1-a39c-c0e0039c5034	\N
03a73b6b-0eb4-4b17-b71f-a44968cea457	\N	calendarEventParticipant	calendarEventParticipants	Calendar event participant	Calendar event participants	Calendar event participants	IconCalendar	\N	DEPRECATED	f	f	t	t	f	f	f	\N	\N	ed83b3a6-ea1c-4849-817f-91cd00c2da6d	\N	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	4a5dec44-2fb8-4d70-a6e0-6f483b222082	20202020-a1c3-47a6-9732-27e5b1e8436d	\N
a1cedc36-00da-4425-9ea1-41ef7e522606	\N	calendarEvent	calendarEvents	Calendar event	Calendar events	Calendar events	IconCalendar	\N	DEPRECATED	f	f	t	t	f	f	f	\N	\N	efd1c758-2fa2-4bb6-939b-65b902e5ebde	\N	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	4a5dec44-2fb8-4d70-a6e0-6f483b222082	20202020-8f1d-4eef-9f85-0d1965e27221	\N
1b9bb040-2722-44d7-a5ac-4e251b541f13	\N	company	companies	Company	Companies	A company	IconBuildingSkyscraper	\N	DEPRECATED	f	f	t	f	f	t	t	[["name"], ["domainNamePrimaryLinkUrl"]]	C	69512596-ab97-4a06-a1c9-006d5983356b	\N	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	4a5dec44-2fb8-4d70-a6e0-6f483b222082	20202020-b374-4779-a561-80086cb2e17f	\N
45600963-91d4-4b77-8fb6-449c8e3c1f44	\N	connectedAccount	connectedAccounts	Connected Account	Connected Accounts	A connected account	IconAt	\N	DEPRECATED	f	f	t	t	f	t	f	\N	\N	97913003-a3d6-43bc-9428-547c89b7d24e	\N	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	4a5dec44-2fb8-4d70-a6e0-6f483b222082	20202020-977e-46b2-890b-c3002ddfd5c5	\N
8bf7b8ba-a68b-49dc-8e9a-661cf9d528c4	\N	dashboard	dashboards	Dashboard	Dashboards	A dashboard	IconLayoutDashboard	\N	DEPRECATED	f	f	t	f	f	t	t	\N	D	a5fe568f-6ae1-484b-9684-a5c9b5192cff	\N	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	4a5dec44-2fb8-4d70-a6e0-6f483b222082	20202020-3840-4b6d-9425-0c5188b05ca8	\N
254569df-6932-4d1b-abcd-cb0f250b72ed	\N	messageChannelMessageAssociation	messageChannelMessageAssociations	Message Channel Message Association	Message Channel Message Associations	Message Synced with a Message Channel	IconMessage	\N	DEPRECATED	f	f	t	t	f	f	f	\N	\N	f6831443-7eda-42a9-a517-b4483a80b4ff	\N	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	4a5dec44-2fb8-4d70-a6e0-6f483b222082	20202020-ad1e-4127-bccb-d83ae04d2ccb	\N
711ed2e9-cc32-45af-ba39-7066034c618e	\N	messageChannel	messageChannels	Message Channel	Message Channels	Message Channels	IconMessage	\N	DEPRECATED	f	f	t	t	f	f	f	\N	\N	401a9543-da3e-45d1-b960-e87733b0a0c4	\N	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	4a5dec44-2fb8-4d70-a6e0-6f483b222082	20202020-fe8c-40bc-a681-b80b771449b7	\N
e48dd522-875c-4937-9d9b-3a41a8cb0f1e	\N	messageFolder	messageFolders	Message Folder	Message Folders	Message Folders	IconFolder	\N	DEPRECATED	f	f	t	t	f	f	f	\N	\N	085f652b-8888-46e4-b82e-200873595269	\N	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	4a5dec44-2fb8-4d70-a6e0-6f483b222082	20202020-4955-4fd9-8e59-2dbd373f2a46	\N
b03dcd32-17eb-4bd2-b529-7e0bbc7d4cdd	\N	messageChannelMessageAssociationMessageFolder	messageChannelMessageAssociationMessageFolders	Message Channel Message Association Message Folder	Message Channel Message Association Message Folders	Join table linking message channel message associations to message folders	IconFolder	\N	DEPRECATED	f	f	t	t	f	f	f	\N	\N	074e9bef-fbb0-4b24-afc6-95b0d28b1f75	\N	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	4a5dec44-2fb8-4d70-a6e0-6f483b222082	20202020-a1b0-40b0-8ab0-5b6c7d8e9f0a	\N
ee0c23a3-0eb3-4d06-9b63-e89466584e21	\N	messageParticipant	messageParticipants	Message Participant	Message Participants	Message Participants	IconUserCircle	\N	DEPRECATED	f	f	t	t	f	f	f	\N	\N	d73214e6-dc4d-414e-874e-f171d63c9963	\N	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	4a5dec44-2fb8-4d70-a6e0-6f483b222082	20202020-a433-4456-aa2d-fd9cb26b774a	\N
cc4a7ab5-3ba0-4ac7-9ae5-896edd7b3d25	\N	messageThread	messageThreads	Message Thread	Message Threads	Message Thread	IconMessage	\N	DEPRECATED	f	f	t	t	f	f	f	\N	\N	038a3b83-315b-4982-aa33-060d991e2957	\N	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	4a5dec44-2fb8-4d70-a6e0-6f483b222082	20202020-849a-4c3e-84f5-a25a7d802271	\N
8e627e4e-e9cf-4890-af92-46559fb5f36e	\N	message	messages	Message	Messages	Message	IconMessage	\N	DEPRECATED	f	f	t	t	f	f	f	\N	\N	3a73b856-56c3-41f2-9cd0-b666cfdc8215	\N	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	4a5dec44-2fb8-4d70-a6e0-6f483b222082	20202020-3f6b-4425-80ab-e468899ab4b2	\N
0996fb48-437d-4a52-a0bd-098f18a09105	\N	note	notes	Note	Notes	A note	IconNotes	\N	DEPRECATED	f	f	t	f	f	t	t	\N	N	060ef747-7b7a-40b0-a358-4c244e73cbde	\N	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	4a5dec44-2fb8-4d70-a6e0-6f483b222082	20202020-0b00-45cd-b6f6-6cd806fc6804	\N
2f8e7625-5a41-40dd-be67-29f99a4dc30e	\N	noteTarget	noteTargets	Note Target	Note Targets	A note target	IconCheckbox	\N	DEPRECATED	f	f	t	t	f	t	f	\N	\N	496756f5-1089-4bd0-88cc-d953371b7d3a	\N	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	4a5dec44-2fb8-4d70-a6e0-6f483b222082	20202020-fff0-4b44-be82-bda313884400	\N
19d8f9ef-3d91-4bea-8281-59d7548d04da	\N	opportunity	opportunities	Opportunity	Opportunities	An opportunity	IconTargetArrow	\N	DEPRECATED	f	f	t	f	f	t	t	\N	O	550596f2-be50-4653-808b-2f9e6d9e0034	\N	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	4a5dec44-2fb8-4d70-a6e0-6f483b222082	20202020-9549-49dd-b2b2-883999db8938	\N
f59c15d0-9a52-4e93-b44f-ed4fc4bd90be	\N	person	people	Person	People	A person	IconUser	\N	DEPRECATED	f	f	t	f	f	t	t	[["nameFirstName", "nameLastName"], ["linkedinLinkPrimaryLinkUrl"], ["emailsPrimaryEmail"]]	P	643bc00b-8772-46ed-bd47-00acc00fb8a5	\N	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	4a5dec44-2fb8-4d70-a6e0-6f483b222082	20202020-e674-48e5-a542-72570eee7213	\N
a91a647d-4acf-456b-961b-40fbb3788c6d	\N	task	tasks	Task	Tasks	A task	IconCheckbox	\N	DEPRECATED	f	f	t	f	f	t	t	\N	T	6663c9ab-59e1-4ec0-acd8-4af184e36234	\N	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	4a5dec44-2fb8-4d70-a6e0-6f483b222082	20202020-1ba1-48ba-bc83-ef7e5990ed10	\N
5277c856-9ccc-41e4-ae01-f077f1c61574	\N	taskTarget	taskTargets	Task Target	Task Targets	A task target	IconCheckbox	\N	DEPRECATED	f	f	t	t	f	t	f	\N	\N	f11a7959-f6d3-4bf3-b85c-d2a24e3c3d8a	\N	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	4a5dec44-2fb8-4d70-a6e0-6f483b222082	20202020-5a9a-44e8-95df-771cd06d0fb1	\N
22213a4b-0696-4b0b-90e1-975e86ba2902	\N	timelineActivity	timelineActivities	Timeline Activity	Timeline Activities	Aggregated / filtered event to be displayed on the timeline	IconTimelineEvent	\N	DEPRECATED	f	f	t	t	f	f	f	\N	\N	64022fb2-0733-4676-b365-eb1383b031d2	\N	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	4a5dec44-2fb8-4d70-a6e0-6f483b222082	20202020-6736-4337-b5c4-8b39fae325a5	\N
0f1f4454-5436-4ddd-b99b-5426058af575	\N	workflow	workflows	Workflow	Workflows	A workflow	IconSettingsAutomation	\N	DEPRECATED	f	f	t	f	f	t	t	\N	W	f07e2729-d9af-40dd-b837-3e31e8028a98	\N	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	4a5dec44-2fb8-4d70-a6e0-6f483b222082	20202020-62be-406c-b9ca-8caa50d51392	\N
c407d619-2c05-491f-b2fd-b9481d652bc9	\N	workflowAutomatedTrigger	workflowAutomatedTriggers	Workflow Automated Trigger	Workflow Automated Triggers	A workflow automated trigger	IconSettingsAutomation	\N	DEPRECATED	f	f	t	t	f	t	f	\N	\N	322b10e9-8d52-4954-8fd2-aa845d70bfe6	\N	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	4a5dec44-2fb8-4d70-a6e0-6f483b222082	20202020-3319-4234-a34c-7f3b9d2e4d1f	\N
bfd36b0d-202c-430c-8f42-12ed18cb1f6a	\N	workflowRun	workflowRuns	Workflow Run	Workflow Runs	A workflow run	IconHistoryToggle	\N	DEPRECATED	f	f	t	t	f	f	f	\N	\N	b5ed8ed4-8c72-499c-b17e-35f2eeb3a9f5	\N	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	4a5dec44-2fb8-4d70-a6e0-6f483b222082	20202020-4e28-4e95-a9d7-6c00874f843c	\N
72cb4e16-ed23-4e5a-8ed3-47fd5f979113	\N	workflowVersion	workflowVersions	Workflow Version	Workflow Versions	A workflow version	IconVersions	\N	DEPRECATED	f	f	t	t	f	t	f	\N	\N	807e5d28-3977-4723-95cf-ab69bd3f76e0	\N	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	4a5dec44-2fb8-4d70-a6e0-6f483b222082	20202020-d65d-4ab9-9344-d77bfb376a3d	\N
0286cdc7-a914-4a77-9afa-1fd5831fcb59	\N	workspaceMember	workspaceMembers	Workspace Member	Workspace Members	A workspace member	IconUserCircle	\N	DEPRECATED	f	f	t	t	f	t	t	\N	\N	a10e8873-0026-486c-a0e5-72a1f31b2f34	\N	f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	4a5dec44-2fb8-4d70-a6e0-6f483b222082	20202020-3319-4234-a34c-82d5c0e881a6	\N
a64cec42-2523-4102-b0d6-fdbb2f937bb6	\N	habit	habits	Habit	Habits	\N	IconListNumbers	\N	DEPRECATED	t	f	t	f	f	t	t	\N	\N	b86917ba-ac12-4ef5-b919-1dcbc394c8ec	\N	t	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 12:15:04.225+00	2026-04-25 12:15:04.225+00	8c07d085-7bf4-4849-934d-3c70dcf4340d	99df8a1c-992d-441d-afb4-b0d2c4473d31	gray
185d031c-a8d4-42b4-b9b8-55a8e1c6e608	\N	habitLog	habitLogs	Habit Log	Habit Logs	\N	IconListNumbers	\N	DEPRECATED	t	f	t	f	f	t	t	\N	\N	543e9eca-2271-41a0-af8d-51cc126248f8	\N	t	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 12:25:53.065+00	2026-04-25 12:25:53.065+00	8c07d085-7bf4-4849-934d-3c70dcf4340d	0c0d698a-b0c9-4b61-96e4-00bd3391ad61	gray
\.


--
-- Data for Name: objectPermission; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."objectPermission" (id, "roleId", "objectMetadataId", "canReadObjectRecords", "canUpdateObjectRecords", "canSoftDeleteObjectRecords", "canDestroyObjectRecords", "workspaceId", "createdAt", "updatedAt", "universalIdentifier", "applicationId") FROM stdin;
\.


--
-- Data for Name: pageLayout; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."pageLayout" (id, name, "workspaceId", type, "objectMetadataId", "createdAt", "updatedAt", "deletedAt", "universalIdentifier", "applicationId", "defaultTabToFocusOnMobileAndSidePanelId") FROM stdin;
525a8cc0-1361-4da3-a502-c8e0cd2b4343	My First Dashboard	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	DASHBOARD	\N	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-d001-4d01-8d01-da5ab0a00001	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N
517b72f7-8652-4018-b71b-154965462334	Default Blocklist Layout	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	RECORD_PAGE	d7c8875d-11aa-42e2-a58a-07bb30bf96af	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-a109-4009-8009-b10c115b0001	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N
23e04984-ea3f-4b90-8040-e60bfdcdf5a8	Default Calendar Channel Layout	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	RECORD_PAGE	6be8bb14-8b85-4a2d-ba87-40a4e6b9a586	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-a10a-400a-800a-ca1c4a0a0001	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N
5e648392-5343-4cda-925a-5846be18cb15	Default Calendar Channel Event Association Layout	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	RECORD_PAGE	e96a74e5-e74b-47b2-a74d-e4558552dd98	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-a10b-400b-800b-ca1c4e0b0001	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N
4c36378f-d33d-45cb-b02a-7aa95af3178f	Default Calendar Event Participant Layout	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	RECORD_PAGE	03a73b6b-0eb4-4b17-b71f-a44968cea457	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-a10c-400c-800c-ca1e0a0c0001	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N
d7cbff85-19bd-4e8d-bc07-5731169c5779	Default Company Layout	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	RECORD_PAGE	1b9bb040-2722-44d7-a5ac-4e251b541f13	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-a101-4001-8001-c0aba11c0001	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N
2204d348-8bab-439c-a745-c16fe0a7e137	Default Connected Account Layout	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	RECORD_PAGE	45600963-91d4-4b77-8fb6-449c8e3c1f44	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-a10d-400d-800d-c0aec10d0001	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N
e0920c4a-b1d2-43f9-bba0-444ee0ad6310	Default Message Channel Layout	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	RECORD_PAGE	711ed2e9-cc32-45af-ba39-7066034c618e	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-a110-4010-8010-a5c4a1100001	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N
9b8eef7a-c3df-481a-9ee5-f220a31ed0cc	Default Message Channel Message Association Layout	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	RECORD_PAGE	254569df-6932-4d1b-abcd-cb0f250b72ed	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-a111-4011-8011-a5c4a5110001	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N
98135399-f240-4446-a221-5411c7fb6ac3	Default Message Channel Message Association Message Folder Layout	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	RECORD_PAGE	b03dcd32-17eb-4bd2-b529-7e0bbc7d4cdd	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-a112-4012-8012-a5c4a6120001	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N
9e3bc7cd-5eee-487e-9afe-e60c0689d27e	Default Message Folder Layout	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	RECORD_PAGE	e48dd522-875c-4937-9d9b-3a41a8cb0f1e	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-a113-4013-8013-a5efd1130001	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N
041165f4-49bc-49f8-851b-6b211e558422	Default Message Participant Layout	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	RECORD_PAGE	ee0c23a3-0eb3-4d06-9b63-e89466584e21	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-a114-4014-8014-a5ea10140001	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N
a1656d12-33d0-486b-9b1b-53f675d7046d	Default Message Thread Layout	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	RECORD_PAGE	cc4a7ab5-3ba0-4ac7-9ae5-896edd7b3d25	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-95bb-40eb-a699-70e7ea02a79e	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N
4fe6da98-07c8-4e61-8435-b7b86d34379c	Default Note Layout	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	RECORD_PAGE	0996fb48-437d-4a52-a0bd-098f18a09105	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-a104-4004-8004-a0be5a11a004	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N
7029f7dc-763a-4237-8d7c-a621fafa8b27	Default Opportunity Layout	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	RECORD_PAGE	19d8f9ef-3d91-4bea-8281-59d7548d04da	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-a103-4003-8003-0aa0b1ca1003	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N
98bf25d3-6f63-4b64-bbbd-7dfc53c02daf	Default Person Layout	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	RECORD_PAGE	f59c15d0-9a52-4e93-b44f-ed4fc4bd90be	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-a102-4002-8002-ae0a1ea11002	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N
699084eb-6eda-42ad-82b0-cf35314d3d78	Default Task Layout	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	RECORD_PAGE	a91a647d-4acf-456b-961b-40fbb3788c6d	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-a105-4005-8005-ba5ca11a1005	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N
4be6200d-20c4-45eb-bf67-e3f4efeff357	Default Workflow Layout	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	RECORD_PAGE	0f1f4454-5436-4ddd-b99b-5426058af575	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-a106-4006-8006-a0bcf10aa006	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N
7dd4da45-f8d7-488c-8a21-376c0d6ba94a	Default Workflow Automated Trigger Layout	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	RECORD_PAGE	c407d619-2c05-491f-b2fd-b9481d652bc9	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-a115-4015-8015-a0bcf1150001	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N
1fc6b487-b0ec-4373-a79f-0f31c25f36b5	Default Workflow Version Layout	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	RECORD_PAGE	72cb4e16-ed23-4e5a-8ed3-47fd5f979113	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-a107-4007-8007-a0bcf10ab007	4a5dec44-2fb8-4d70-a6e0-6f483b222082	44be8268-0182-40b0-8ea3-2a43da7002e1
c696f9e6-abaf-4f13-8cdc-aef80604acb8	Default Workflow Run Layout	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	RECORD_PAGE	bfd36b0d-202c-430c-8f42-12ed18cb1f6a	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-a108-4008-8008-a0bcf10ac008	4a5dec44-2fb8-4d70-a6e0-6f483b222082	5705eb43-4b43-4f31-b5da-58bd907c0337
5bb7a884-c65c-4c32-bf82-863d459bae81	Default Habit Layout	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	RECORD_PAGE	a64cec42-2523-4102-b0d6-fdbb2f937bb6	2026-04-25 12:15:04.773+00	2026-04-25 12:15:04.773+00	\N	4514e9c4-82b7-483f-b2bd-cc40449e3373	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N
2ed19eb6-dcb0-490b-ad83-71c803d836cf	Default Habit Log Layout	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	RECORD_PAGE	185d031c-a8d4-42b4-b9b8-55a8e1c6e608	2026-04-25 12:25:53.47+00	2026-04-25 12:25:53.47+00	\N	5e85a40b-dbee-4acc-bed4-43b97f0d0448	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N
\.


--
-- Data for Name: pageLayoutTab; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."pageLayoutTab" (id, title, "workspaceId", "position", "pageLayoutId", "createdAt", "updatedAt", "deletedAt", "universalIdentifier", "applicationId", icon, "layoutMode", overrides, "isActive") FROM stdin;
76d27a6b-a52a-41d7-8de3-402919be9c24	Tab 1	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	0	525a8cc0-1361-4da3-a502-c8e0cd2b4343	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-d011-4d11-8d11-da5ab0a01001	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	GRID	\N	t
10623491-dedc-4ec8-b428-2ef6570b3f9f	Home	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	10	517b72f7-8652-4018-b71b-154965462334	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ab09-4009-8009-b10c115b0901	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconHome	VERTICAL_LIST	\N	t
196361d5-cd09-4f65-a75b-c51b158f8f5f	Timeline	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	20	517b72f7-8652-4018-b71b-154965462334	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ab09-4009-8009-b10c115b0902	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconTimelineEvent	CANVAS	\N	t
92507504-3555-4e14-9dab-2589480dc5c3	Home	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	10	23e04984-ea3f-4b90-8040-e60bfdcdf5a8	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ab0a-400a-800a-ca1c4a0a0a01	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconHome	VERTICAL_LIST	\N	t
7d63f855-e065-477d-96da-bdd27a120bcd	Timeline	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	20	23e04984-ea3f-4b90-8040-e60bfdcdf5a8	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ab0a-400a-800a-ca1c4a0a0a02	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconTimelineEvent	CANVAS	\N	t
942488d8-8aba-4f9d-bb00-63cd2166baca	Home	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	10	5e648392-5343-4cda-925a-5846be18cb15	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ab0b-400b-800b-ca1c4e0b0b01	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconHome	VERTICAL_LIST	\N	t
bec5b293-6506-4a3b-9eea-ad453892d974	Timeline	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	20	5e648392-5343-4cda-925a-5846be18cb15	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ab0b-400b-800b-ca1c4e0b0b02	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconTimelineEvent	CANVAS	\N	t
97a43f9e-6e2e-4ba4-8445-39f8a985ab4f	Home	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	10	4c36378f-d33d-45cb-b02a-7aa95af3178f	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ab0c-400c-800c-ca1e0a0c0c01	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconHome	VERTICAL_LIST	\N	t
caa9ecaf-26f7-4830-8097-42441b8966cc	Timeline	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	20	4c36378f-d33d-45cb-b02a-7aa95af3178f	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ab0c-400c-800c-ca1e0a0c0c02	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconTimelineEvent	CANVAS	\N	t
bfd29d04-6b69-438c-8ac8-e126c647bde3	Home	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	10	d7cbff85-19bd-4e8d-bc07-5731169c5779	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ab01-4001-8001-c0aba11c0101	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconHome	VERTICAL_LIST	\N	t
852e35f5-89b8-4113-ad4a-ba9ae9410ac3	Timeline	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	20	d7cbff85-19bd-4e8d-bc07-5731169c5779	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ab01-4001-8001-c0aba11c0102	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconTimelineEvent	CANVAS	\N	t
4e61e694-bd76-43c4-9a11-6872e809c789	Tasks	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	30	d7cbff85-19bd-4e8d-bc07-5731169c5779	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ab01-4001-8001-c0aba11c0103	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconCheckbox	CANVAS	\N	t
17e23b93-39e5-4453-83e6-61fbd8ec3e05	Notes	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	40	d7cbff85-19bd-4e8d-bc07-5731169c5779	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ab01-4001-8001-c0aba11c0104	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconNotes	CANVAS	\N	t
e0e3db1b-6ad3-42f1-8200-97021f22cd3c	Files	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	50	d7cbff85-19bd-4e8d-bc07-5731169c5779	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ab01-4001-8001-c0aba11c0105	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconPaperclip	CANVAS	\N	t
cfb58ed0-f779-44fb-bd0d-bb60a74db49a	Emails	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	60	d7cbff85-19bd-4e8d-bc07-5731169c5779	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ab01-4001-8001-c0aba11c0106	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconMail	CANVAS	\N	t
2e7edec6-3ccc-40d5-a7c0-ab799548de44	Calendar	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	70	d7cbff85-19bd-4e8d-bc07-5731169c5779	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ab01-4001-8001-c0aba11c0107	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconCalendarEvent	CANVAS	\N	t
a785c80a-3db5-4b06-b61b-6a49be2993e3	Home	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	10	2204d348-8bab-439c-a745-c16fe0a7e137	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ab0d-400d-800d-c0aec10d0d01	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconHome	VERTICAL_LIST	\N	t
65e779e3-8e8a-4b98-92e9-930194276541	Timeline	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	20	2204d348-8bab-439c-a745-c16fe0a7e137	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ab0d-400d-800d-c0aec10d0d02	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconTimelineEvent	CANVAS	\N	t
0de14020-0d78-4f2b-abee-b1fd049dbddf	Home	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	10	e0920c4a-b1d2-43f9-bba0-444ee0ad6310	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ab10-4010-8010-a5c4a1101001	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconHome	VERTICAL_LIST	\N	t
34f36f64-10e8-4212-94e0-4b56c5b7d417	Timeline	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	20	e0920c4a-b1d2-43f9-bba0-444ee0ad6310	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ab10-4010-8010-a5c4a1101002	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconTimelineEvent	CANVAS	\N	t
9a344eb9-b962-426d-820d-cd93f9973488	Home	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	10	9b8eef7a-c3df-481a-9ee5-f220a31ed0cc	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ab11-4011-8011-a5c4a5111101	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconHome	VERTICAL_LIST	\N	t
d66c0bfe-a136-4a4a-9260-24f28df45fd9	Timeline	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	20	9b8eef7a-c3df-481a-9ee5-f220a31ed0cc	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ab11-4011-8011-a5c4a5111102	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconTimelineEvent	CANVAS	\N	t
68fce7b3-7586-4b25-8d99-a8014cf0b719	Home	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	10	98135399-f240-4446-a221-5411c7fb6ac3	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ab12-4012-8012-a5c4a6121201	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconHome	VERTICAL_LIST	\N	t
72799f98-f768-45c3-aa7a-94e5645c19fe	Timeline	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	20	98135399-f240-4446-a221-5411c7fb6ac3	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ab12-4012-8012-a5c4a6121202	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconTimelineEvent	CANVAS	\N	t
55c04b42-d58b-449c-a2db-005e3afc90e1	Home	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	10	9e3bc7cd-5eee-487e-9afe-e60c0689d27e	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ab13-4013-8013-a5efd1131301	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconHome	VERTICAL_LIST	\N	t
d3c35890-1913-4ff6-8bdf-f8913d0acc66	Timeline	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	20	9e3bc7cd-5eee-487e-9afe-e60c0689d27e	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ab13-4013-8013-a5efd1131302	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconTimelineEvent	CANVAS	\N	t
4aeb21c9-2a99-4db1-9de9-a270912482b1	Home	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	10	041165f4-49bc-49f8-851b-6b211e558422	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ab14-4014-8014-a5ea10141401	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconHome	VERTICAL_LIST	\N	t
bfac345a-2e24-4a19-b715-14239ed1f01a	Timeline	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	20	041165f4-49bc-49f8-851b-6b211e558422	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ab14-4014-8014-a5ea10141402	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconTimelineEvent	CANVAS	\N	t
fdc4780d-7dc6-454d-a42f-072edddd92d1	Home	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	10	a1656d12-33d0-486b-9b1b-53f675d7046d	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-f639-48a0-9a44-027cf4e3cd15	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconHome	VERTICAL_LIST	\N	t
95aaf909-9474-4788-9935-1d01b1050f69	Home	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	10	4fe6da98-07c8-4e61-8435-b7b86d34379c	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ab04-4004-8004-a0be5a11a401	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconHome	VERTICAL_LIST	\N	t
de7a8df4-215a-483d-9198-1ebfc0bc8c28	Note	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	15	4fe6da98-07c8-4e61-8435-b7b86d34379c	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ab04-4004-8004-a0be5a11a402	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconNotes	VERTICAL_LIST	\N	t
1550812d-2fd8-4abf-bc61-9dec4333e7b6	Timeline	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	20	4fe6da98-07c8-4e61-8435-b7b86d34379c	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ab04-4004-8004-a0be5a11a403	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconTimelineEvent	CANVAS	\N	t
e74d67e7-2efd-426d-9b75-242ad47f4ee2	Files	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	50	4fe6da98-07c8-4e61-8435-b7b86d34379c	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ab04-4004-8004-a0be5a11a404	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconPaperclip	CANVAS	\N	t
d858a0f3-5247-4b98-8675-0e770a0106f6	Home	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	10	7029f7dc-763a-4237-8d7c-a621fafa8b27	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ab03-4003-8003-0aa0b1ca1301	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconHome	VERTICAL_LIST	\N	t
956dfb85-3b4e-4298-ad68-dd949310b188	Timeline	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	20	7029f7dc-763a-4237-8d7c-a621fafa8b27	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ab03-4003-8003-0aa0b1ca1302	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconTimelineEvent	CANVAS	\N	t
f82103e8-cdc9-4e8c-89e7-8592e0f5d4dc	Tasks	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	30	7029f7dc-763a-4237-8d7c-a621fafa8b27	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ab03-4003-8003-0aa0b1ca1303	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconCheckbox	CANVAS	\N	t
2dd22e74-bdf6-4475-82ec-9403bd75d293	Notes	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	40	7029f7dc-763a-4237-8d7c-a621fafa8b27	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ab03-4003-8003-0aa0b1ca1304	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconNotes	CANVAS	\N	t
6a657c92-ed83-4f11-90da-1155bdda8e0a	Files	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	50	7029f7dc-763a-4237-8d7c-a621fafa8b27	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ab03-4003-8003-0aa0b1ca1305	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconPaperclip	CANVAS	\N	t
02efbcad-cdd0-4b13-9ece-24e07fbe645c	Emails	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	60	7029f7dc-763a-4237-8d7c-a621fafa8b27	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ab03-4003-8003-0aa0b1ca1306	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconMail	CANVAS	\N	t
4da0a446-2dd6-4ec9-9ba9-740b44dc323e	Calendar	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	70	7029f7dc-763a-4237-8d7c-a621fafa8b27	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ab03-4003-8003-0aa0b1ca1307	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconCalendarEvent	CANVAS	\N	t
3ed805f2-c8d9-4535-83d1-76bf3ca585ad	Home	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	10	98bf25d3-6f63-4b64-bbbd-7dfc53c02daf	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ab02-4002-8002-ae0a1ea11201	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconHome	VERTICAL_LIST	\N	t
7c3688e5-26a1-4647-bbfc-02f886f46ed2	Timeline	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	20	98bf25d3-6f63-4b64-bbbd-7dfc53c02daf	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ab02-4002-8002-ae0a1ea11202	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconTimelineEvent	CANVAS	\N	t
329fe71b-da05-4acc-8d1e-3bb5be6ef315	Tasks	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	30	98bf25d3-6f63-4b64-bbbd-7dfc53c02daf	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ab02-4002-8002-ae0a1ea11203	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconCheckbox	CANVAS	\N	t
9fc1c998-f9d8-4af0-a2ae-f140fe2395c6	Notes	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	40	98bf25d3-6f63-4b64-bbbd-7dfc53c02daf	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ab02-4002-8002-ae0a1ea11204	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconNotes	CANVAS	\N	t
eb9eb1d4-722f-464b-8a73-1450e4a13da3	Files	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	50	98bf25d3-6f63-4b64-bbbd-7dfc53c02daf	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ab02-4002-8002-ae0a1ea11205	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconPaperclip	CANVAS	\N	t
d8d95d19-94e9-4e10-aede-d4a2cce14ed8	Emails	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	60	98bf25d3-6f63-4b64-bbbd-7dfc53c02daf	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ab02-4002-8002-ae0a1ea11206	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconMail	CANVAS	\N	t
2ea08ba8-f34b-4e4e-9de9-244e831f0c1d	Calendar	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	70	98bf25d3-6f63-4b64-bbbd-7dfc53c02daf	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ab02-4002-8002-ae0a1ea11207	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconCalendarEvent	CANVAS	\N	t
d3ffb56f-8a23-44d6-b4c4-3f8282c528ae	Home	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	10	699084eb-6eda-42ad-82b0-cf35314d3d78	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ab05-4005-8005-ba5ca11a5501	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconHome	VERTICAL_LIST	\N	t
5fd19fc2-bdcc-4036-87a9-5612a67e652d	Note	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	15	699084eb-6eda-42ad-82b0-cf35314d3d78	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ab05-4005-8005-ba5ca11a5502	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconNotes	VERTICAL_LIST	\N	t
0b531b30-4cc8-4412-9a93-5edaa3c60038	Timeline	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	20	699084eb-6eda-42ad-82b0-cf35314d3d78	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ab05-4005-8005-ba5ca11a5503	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconTimelineEvent	CANVAS	\N	t
62544cf6-5b8d-4554-86f2-a2f1b40097a4	Files	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	50	699084eb-6eda-42ad-82b0-cf35314d3d78	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ab05-4005-8005-ba5ca11a5504	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconPaperclip	CANVAS	\N	t
c5828c52-f0b2-4a88-b4fb-287f0c74f9de	Flow	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	10	4be6200d-20c4-45eb-bf67-e3f4efeff357	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ab06-4006-8006-a0bcf10a6601	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconSettings	CANVAS	\N	t
f32c05d9-8ebe-4f13-8a5d-1f310aad244e	Home	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	10	7dd4da45-f8d7-488c-8a21-376c0d6ba94a	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ab15-4015-8015-a0bcf1151501	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconHome	VERTICAL_LIST	\N	t
eb95ee99-bdff-4cc4-b78d-ebd7ee752288	Timeline	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	20	7dd4da45-f8d7-488c-8a21-376c0d6ba94a	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ab15-4015-8015-a0bcf1151502	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconTimelineEvent	CANVAS	\N	t
beb7a199-f622-4f68-a993-6876a14298e4	Home	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	10	1fc6b487-b0ec-4373-a79f-0f31c25f36b5	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ab07-4007-8007-a0bcf10a7701	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconHome	VERTICAL_LIST	\N	t
44be8268-0182-40b0-8ea3-2a43da7002e1	Flow	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	20	1fc6b487-b0ec-4373-a79f-0f31c25f36b5	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ab07-4007-8007-a0bcf10a7702	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconSettings	CANVAS	\N	t
f602c4a1-870c-4140-935c-d304b725baea	Home	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	10	c696f9e6-abaf-4f13-8cdc-aef80604acb8	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ab08-4008-8008-a0bcf10a8801	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconHome	VERTICAL_LIST	\N	t
5705eb43-4b43-4f31-b5da-58bd907c0337	Flow	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	20	c696f9e6-abaf-4f13-8cdc-aef80604acb8	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ab08-4008-8008-a0bcf10a8802	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconSettings	CANVAS	\N	t
71ca812f-e8b4-431b-bd6a-8e43a42d08e5	Home	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	10	5bb7a884-c65c-4c32-bf82-863d459bae81	2026-04-25 12:15:04.773+00	2026-04-25 12:15:04.773+00	\N	a54a357c-58b6-4d0c-9351-6f1608b77284	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconHome	VERTICAL_LIST	\N	t
e2304def-b910-4aed-b3d3-4c6a9d71d9a4	Timeline	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	20	5bb7a884-c65c-4c32-bf82-863d459bae81	2026-04-25 12:15:04.773+00	2026-04-25 12:15:04.773+00	\N	0e3da992-ffdb-4f92-9e10-971bdfe9392e	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconTimelineEvent	CANVAS	\N	t
c8593757-705a-4845-89a2-89c7ea33ba1b	Tasks	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	30	5bb7a884-c65c-4c32-bf82-863d459bae81	2026-04-25 12:15:04.773+00	2026-04-25 12:15:04.773+00	\N	f0dc86b3-31f2-434c-9d65-0a615233ac06	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconCheckbox	CANVAS	\N	t
e34081a3-288f-424f-9387-ae1a8df59439	Notes	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	40	5bb7a884-c65c-4c32-bf82-863d459bae81	2026-04-25 12:15:04.773+00	2026-04-25 12:15:04.773+00	\N	b5a3c17a-8f98-4703-95a7-2d558a1b713f	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconNotes	CANVAS	\N	t
8b50377e-5546-4d68-bafe-ebfda0b32d81	Files	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	50	5bb7a884-c65c-4c32-bf82-863d459bae81	2026-04-25 12:15:04.773+00	2026-04-25 12:15:04.773+00	\N	e86ff1b4-4b77-4b34-8979-b112d707a2f9	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconPaperclip	CANVAS	\N	t
96b14e2e-12c8-4022-bd8d-3df009152578	Home	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	10	2ed19eb6-dcb0-490b-ad83-71c803d836cf	2026-04-25 12:25:53.47+00	2026-04-25 12:25:53.47+00	\N	71681e5c-32a9-49ba-9886-8890ebb59b53	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconHome	VERTICAL_LIST	\N	t
373c2257-72b0-4894-a1cf-52d4a3bb8ed8	Timeline	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	20	2ed19eb6-dcb0-490b-ad83-71c803d836cf	2026-04-25 12:25:53.47+00	2026-04-25 12:25:53.47+00	\N	f4ef792a-38d7-4ccb-8b55-84c4ff919ebd	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconTimelineEvent	CANVAS	\N	t
d32467f9-2594-44a8-82e5-fe50446f3eb7	Tasks	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	30	2ed19eb6-dcb0-490b-ad83-71c803d836cf	2026-04-25 12:25:53.47+00	2026-04-25 12:25:53.47+00	\N	a23593b4-04a9-470d-b823-12b0302d3d4a	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconCheckbox	CANVAS	\N	t
04dd8202-3fb7-4654-9b8d-f8ab90e774cf	Notes	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	40	2ed19eb6-dcb0-490b-ad83-71c803d836cf	2026-04-25 12:25:53.47+00	2026-04-25 12:25:53.47+00	\N	073277e5-f6cf-4e1a-8b5a-c924fd7297b7	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconNotes	CANVAS	\N	t
5a194a0b-d7d3-4612-b023-a69e9398bc29	Files	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	50	2ed19eb6-dcb0-490b-ad83-71c803d836cf	2026-04-25 12:25:53.47+00	2026-04-25 12:25:53.47+00	\N	0747668a-b407-42ce-ae8f-3d403f3f9715	4a5dec44-2fb8-4d70-a6e0-6f483b222082	IconPaperclip	CANVAS	\N	t
\.


--
-- Data for Name: pageLayoutWidget; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."pageLayoutWidget" (id, "pageLayoutTabId", "workspaceId", title, type, "objectMetadataId", "gridPosition", configuration, "createdAt", "updatedAt", "deletedAt", "universalIdentifier", "applicationId", "conditionalDisplay", "position", overrides, "isActive", "conditionalAvailabilityExpression") FROM stdin;
712bb3b6-8e8f-44c2-b7d8-28c5b5825e32	76d27a6b-a52a-41d7-8de3-402919be9c24	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Untitled Rich Text	STANDALONE_RICH_TEXT	\N	{"row": 0, "column": 0, "rowSpan": 6, "columnSpan": 6}	{"body": {"markdown": null, "blocknote": "[{\\"id\\":\\"a131e613-69c1-441e-b4f7-cefb3e73b2bc\\",\\"type\\":\\"heading\\",\\"props\\":{\\"textColor\\":\\"default\\",\\"backgroundColor\\":\\"default\\",\\"textAlignment\\":\\"left\\",\\"level\\":3},\\"content\\":[{\\"type\\":\\"text\\",\\"text\\":\\"Welcome to your workspace\\",\\"styles\\":{}}],\\"children\\":[]},{\\"id\\":\\"b9f70d3d-8ec8-4dd5-bcc9-c095a5520ab4\\",\\"type\\":\\"paragraph\\",\\"props\\":{\\"textColor\\":\\"default\\",\\"backgroundColor\\":\\"default\\",\\"textAlignment\\":\\"left\\"},\\"content\\":[],\\"children\\":[]},{\\"id\\":\\"f625a8bb-1e61-40e7-9630-035c24cb0ad7\\",\\"type\\":\\"paragraph\\",\\"props\\":{\\"textColor\\":\\"default\\",\\"backgroundColor\\":\\"default\\",\\"textAlignment\\":\\"left\\"},\\"content\\":[{\\"type\\":\\"text\\",\\"text\\":\\"You can edit this dashboard by clicking the \\",\\"styles\\":{}},{\\"type\\":\\"text\\",\\"text\\":\\"Edit\\",\\"styles\\":{\\"code\\":true}},{\\"type\\":\\"text\\",\\"text\\":\\" button in the top-right corner to add your own charts or customize this one.\\",\\"styles\\":{}}],\\"children\\":[]},{\\"id\\":\\"989cffef-13c7-461a-8e87-8c59b4171a0c\\",\\"type\\":\\"paragraph\\",\\"props\\":{\\"textColor\\":\\"default\\",\\"backgroundColor\\":\\"default\\",\\"textAlignment\\":\\"left\\"},\\"content\\":[],\\"children\\":[]},{\\"id\\":\\"27926806-e0fc-4a14-a19d-7d8a413e95b2\\",\\"type\\":\\"paragraph\\",\\"props\\":{\\"textColor\\":\\"default\\",\\"backgroundColor\\":\\"default\\",\\"textAlignment\\":\\"left\\"},\\"content\\":[{\\"type\\":\\"text\\",\\"text\\":\\"Don't forget to replace the sample data with your own.\\",\\"styles\\":{}}],\\"children\\":[]},{\\"id\\":\\"418eb586-d740-4659-80d2-31897fc98755\\",\\"type\\":\\"paragraph\\",\\"props\\":{\\"textColor\\":\\"default\\",\\"backgroundColor\\":\\"default\\",\\"textAlignment\\":\\"left\\"},\\"content\\":[],\\"children\\":[]},{\\"id\\":\\"375927b0-c649-4e4a-bd58-a4a4d1a90036\\",\\"type\\":\\"paragraph\\",\\"props\\":{\\"textColor\\":\\"default\\",\\"backgroundColor\\":\\"default\\",\\"textAlignment\\":\\"left\\"},\\"content\\":[{\\"type\\":\\"text\\",\\"text\\":\\"If you have any issues, you can check \\",\\"styles\\":{}},{\\"type\\":\\"link\\",\\"href\\":\\"https://docs.twenty.com/getting-started/introduction\\",\\"content\\":[{\\"type\\":\\"text\\",\\"text\\":\\"our documentation\\",\\"styles\\":{}}]},{\\"type\\":\\"text\\",\\"text\\":\\" or contact us through the Support section in Settings.\\",\\"styles\\":{}}],\\"children\\":[]},{\\"id\\":\\"d02a05b9-42d9-444a-b726-57a7ab75f165\\",\\"type\\":\\"paragraph\\",\\"props\\":{\\"textColor\\":\\"default\\",\\"backgroundColor\\":\\"default\\",\\"textAlignment\\":\\"left\\"},\\"content\\":[],\\"children\\":[]}]"}, "configurationType": "STANDALONE_RICH_TEXT"}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-d111-4d11-8d11-da5ab0a11001	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"row": 0, "column": 0, "rowSpan": 6, "columnSpan": 6, "layoutMode": "GRID"}	\N	t	\N
3040fca8-7cf9-4422-bfdc-d864674e09fd	76d27a6b-a52a-41d7-8de3-402919be9c24	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Deals by Company	GRAPH	19d8f9ef-3d91-4bea-8281-59d7548d04da	{"row": 0, "column": 6, "rowSpan": 6, "columnSpan": 6}	{"color": "orange", "orderBy": "FIELD_ASC", "timezone": "UTC", "displayLegend": true, "displayDataLabel": false, "showCenterMetric": true, "configurationType": "PIE_CHART", "firstDayOfTheWeek": 0, "aggregateOperation": "COUNT", "groupBySubFieldName": "name", "groupByFieldMetadataId": "58b25376-e2c8-4809-b2e5-f9e8566e8b54", "aggregateFieldMetadataId": "530072c4-0169-4c26-9d6a-03b2d6d66671"}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-d111-4d11-8d11-da5ab0a11002	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"row": 0, "column": 6, "rowSpan": 6, "columnSpan": 6, "layoutMode": "GRID"}	\N	t	\N
2ca1bcd8-02b4-4848-86ca-90bfa3faa23f	76d27a6b-a52a-41d7-8de3-402919be9c24	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Pipeline Value by Stage	GRAPH	19d8f9ef-3d91-4bea-8281-59d7548d04da	{"row": 6, "column": 0, "rowSpan": 6, "columnSpan": 6}	{"color": "green", "layout": "VERTICAL", "timezone": "UTC", "displayLegend": true, "axisNameDisplay": "NONE", "displayDataLabel": true, "configurationType": "BAR_CHART", "firstDayOfTheWeek": 0, "aggregateOperation": "SUM", "primaryAxisOrderBy": "FIELD_POSITION_ASC", "secondaryAxisOrderBy": "FIELD_ASC", "aggregateFieldMetadataId": "098d9623-f9fe-4218-ba8c-6ec048d1fe1b", "primaryAxisDateGranularity": "DAY", "secondaryAxisGroupBySubFieldName": "name", "primaryAxisGroupByFieldMetadataId": "adb354b9-5400-4e8f-ae82-4d527e6da842", "secondaryAxisGroupByDateGranularity": "DAY", "secondaryAxisGroupByFieldMetadataId": "58b25376-e2c8-4809-b2e5-f9e8566e8b54"}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-d111-4d11-8d11-da5ab0a11003	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"row": 6, "column": 0, "rowSpan": 6, "columnSpan": 6, "layoutMode": "GRID"}	\N	t	\N
8f7ca540-ee00-4299-84da-eba930eba939	76d27a6b-a52a-41d7-8de3-402919be9c24	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Revenue Timeline	GRAPH	19d8f9ef-3d91-4bea-8281-59d7548d04da	{"row": 6, "column": 6, "rowSpan": 6, "columnSpan": 6}	{"color": "crimson", "timezone": "UTC", "isCumulative": false, "displayLegend": true, "axisNameDisplay": "NONE", "displayDataLabel": false, "configurationType": "LINE_CHART", "firstDayOfTheWeek": 0, "aggregateOperation": "SUM", "primaryAxisOrderBy": "FIELD_ASC", "aggregateFieldMetadataId": "098d9623-f9fe-4218-ba8c-6ec048d1fe1b", "primaryAxisDateGranularity": "DAY", "primaryAxisGroupByFieldMetadataId": "ac063534-c91e-40de-8f37-43d34df17166"}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-d111-4d11-8d11-da5ab0a11004	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"row": 6, "column": 6, "rowSpan": 6, "columnSpan": 6, "layoutMode": "GRID"}	\N	t	\N
6ec6e99b-f6d4-46c5-acc9-e07c53f45deb	76d27a6b-a52a-41d7-8de3-402919be9c24	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Opportunities by Owner	GRAPH	19d8f9ef-3d91-4bea-8281-59d7548d04da	{"row": 12, "column": 0, "rowSpan": 6, "columnSpan": 6}	{"color": "blue", "layout": "HORIZONTAL", "timezone": "UTC", "isCumulative": false, "displayLegend": true, "axisNameDisplay": "NONE", "displayDataLabel": false, "configurationType": "BAR_CHART", "firstDayOfTheWeek": 0, "aggregateOperation": "COUNT", "primaryAxisOrderBy": "FIELD_ASC", "secondaryAxisOrderBy": "FIELD_ASC", "aggregateFieldMetadataId": "530072c4-0169-4c26-9d6a-03b2d6d66671", "primaryAxisDateGranularity": "DAY", "primaryAxisGroupBySubFieldName": "name.firstName", "secondaryAxisGroupBySubFieldName": "name.firstName", "primaryAxisGroupByFieldMetadataId": "2046bbe4-93d8-4abe-96f2-e393477293c5", "secondaryAxisGroupByDateGranularity": "DAY", "secondaryAxisGroupByFieldMetadataId": "2046bbe4-93d8-4abe-96f2-e393477293c5"}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-d111-4d11-8d11-da5ab0a11005	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"row": 12, "column": 0, "rowSpan": 6, "columnSpan": 6, "layoutMode": "GRID"}	\N	t	\N
f30abc57-058a-40ef-86e5-58bb5977a330	76d27a6b-a52a-41d7-8de3-402919be9c24	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Stock market (Iframe)	IFRAME	\N	{"row": 12, "column": 6, "rowSpan": 8, "columnSpan": 6}	{"url": "https://www.tradingview.com/embed-widget/hotlists/?locale=en", "configurationType": "IFRAME"}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-d111-4d11-8d11-da5ab0a11006	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"row": 12, "column": 6, "rowSpan": 8, "columnSpan": 6, "layoutMode": "GRID"}	\N	t	\N
ba5ba7be-7059-405b-8806-0b15fb3235a1	76d27a6b-a52a-41d7-8de3-402919be9c24	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Deals created this month	GRAPH	19d8f9ef-3d91-4bea-8281-59d7548d04da	{"row": 18, "column": 0, "rowSpan": 2, "columnSpan": 3}	{"filter": {"recordFilters": [{"type": "DATE_TIME", "label": "Creation date", "value": "THIS_1_MONTH;;UTC;;SUNDAY;;", "operand": "IS_RELATIVE", "displayValue": "THIS_1_MONTH;;UTC;;SUNDAY;;", "fieldMetadataId": "fc5acd1f-1ec2-4d24-b1af-ef62be0cf6a0", "recordFilterGroupId": "12db0303-1879-4c54-afe2-de349683bbf4"}], "recordFilterGroups": [{"id": "12db0303-1879-4c54-afe2-de349683bbf4", "logicalOperator": "AND"}]}, "prefix": "", "timezone": "UTC", "displayDataLabel": false, "configurationType": "AGGREGATE_CHART", "firstDayOfTheWeek": 0, "aggregateOperation": "COUNT", "aggregateFieldMetadataId": "530072c4-0169-4c26-9d6a-03b2d6d66671"}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-d111-4d11-8d11-da5ab0a11007	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"row": 18, "column": 0, "rowSpan": 2, "columnSpan": 3, "layoutMode": "GRID"}	\N	t	\N
f975a59a-ce5b-456a-982a-c52cd28bf457	76d27a6b-a52a-41d7-8de3-402919be9c24	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Deal value created this month	GRAPH	19d8f9ef-3d91-4bea-8281-59d7548d04da	{"row": 18, "column": 3, "rowSpan": 2, "columnSpan": 3}	{"filter": {"recordFilters": [{"type": "DATE_TIME", "label": "Creation date", "value": "THIS_1_MONTH;;UTC;;SUNDAY;;", "operand": "IS_RELATIVE", "displayValue": "THIS_1_MONTH;;UTC;;SUNDAY;;", "fieldMetadataId": "fc5acd1f-1ec2-4d24-b1af-ef62be0cf6a0", "recordFilterGroupId": "d69f0f43-6f92-48b7-ae8d-ea5634d112b1"}], "recordFilterGroups": [{"id": "d69f0f43-6f92-48b7-ae8d-ea5634d112b1", "logicalOperator": "AND"}]}, "prefix": "$", "timezone": "UTC", "displayDataLabel": false, "configurationType": "AGGREGATE_CHART", "firstDayOfTheWeek": 0, "aggregateOperation": "SUM", "aggregateFieldMetadataId": "098d9623-f9fe-4218-ba8c-6ec048d1fe1b"}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-d111-4d11-8d11-da5ab0a11008	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"row": 18, "column": 3, "rowSpan": 2, "columnSpan": 3, "layoutMode": "GRID"}	\N	t	\N
e3841466-ec24-4938-b9df-1c797955ba9f	10623491-dedc-4ec8-b428-2ef6570b3f9f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Fields	FIELDS	d7c8875d-11aa-42e2-a58a-07bb30bf96af	{"row": 0, "column": 0, "rowSpan": 12, "columnSpan": 12}	{"viewId": "e5e9e2d9-6904-4cbe-a0f4-163b1150f972", "configurationType": "FIELDS", "newFieldDefaultVisibility": true}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac09-4009-8009-b10c115b0911	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"index": 0, "layoutMode": "VERTICAL_LIST"}	\N	t	\N
5f68b631-4692-4f90-a1b5-fbe4faa5a824	196361d5-cd09-4f65-a75b-c51b158f8f5f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Timeline	TIMELINE	d7c8875d-11aa-42e2-a58a-07bb30bf96af	{"row": 0, "column": 0, "rowSpan": 6, "columnSpan": 12}	{"configurationType": "TIMELINE"}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac09-4009-8009-b10c115b0921	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"layoutMode": "CANVAS"}	\N	t	\N
fba19d08-a6a4-4439-822a-827cc71998d9	92507504-3555-4e14-9dab-2589480dc5c3	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Fields	FIELDS	6be8bb14-8b85-4a2d-ba87-40a4e6b9a586	{"row": 0, "column": 0, "rowSpan": 12, "columnSpan": 12}	{"viewId": "9e1167fa-3a76-4cfd-bacd-33f45bb8ee19", "configurationType": "FIELDS", "newFieldDefaultVisibility": true}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac0a-400a-800a-ca1c4a0a0a11	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"index": 0, "layoutMode": "VERTICAL_LIST"}	\N	t	\N
47ae7ec4-66ff-4510-9401-69648b366278	7d63f855-e065-477d-96da-bdd27a120bcd	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Timeline	TIMELINE	6be8bb14-8b85-4a2d-ba87-40a4e6b9a586	{"row": 0, "column": 0, "rowSpan": 6, "columnSpan": 12}	{"configurationType": "TIMELINE"}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac0a-400a-800a-ca1c4a0a0a21	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"layoutMode": "CANVAS"}	\N	t	\N
2ad805f7-9661-4023-925c-d2d8447512af	942488d8-8aba-4f9d-bb00-63cd2166baca	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Fields	FIELDS	e96a74e5-e74b-47b2-a74d-e4558552dd98	{"row": 0, "column": 0, "rowSpan": 12, "columnSpan": 12}	{"viewId": "b9b76520-b5a6-4d26-ad5c-4767bb6724ec", "configurationType": "FIELDS", "newFieldDefaultVisibility": true}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac0b-400b-800b-ca1c4e0b0b11	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"index": 0, "layoutMode": "VERTICAL_LIST"}	\N	t	\N
5e49daca-6bd4-452e-bf24-fef3f08b282f	bec5b293-6506-4a3b-9eea-ad453892d974	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Timeline	TIMELINE	e96a74e5-e74b-47b2-a74d-e4558552dd98	{"row": 0, "column": 0, "rowSpan": 6, "columnSpan": 12}	{"configurationType": "TIMELINE"}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac0b-400b-800b-ca1c4e0b0b21	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"layoutMode": "CANVAS"}	\N	t	\N
7f6d0c9a-80e3-49af-be1c-a58e19d16ebb	97a43f9e-6e2e-4ba4-8445-39f8a985ab4f	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Fields	FIELDS	03a73b6b-0eb4-4b17-b71f-a44968cea457	{"row": 0, "column": 0, "rowSpan": 12, "columnSpan": 12}	{"viewId": "1cb25256-f293-4cd6-982a-b28c8d8fd158", "configurationType": "FIELDS", "newFieldDefaultVisibility": true}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac0c-400c-800c-ca1e0a0c0c11	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"index": 0, "layoutMode": "VERTICAL_LIST"}	\N	t	\N
361d2135-3bd6-4c29-94ec-2378b163417f	caa9ecaf-26f7-4830-8097-42441b8966cc	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Timeline	TIMELINE	03a73b6b-0eb4-4b17-b71f-a44968cea457	{"row": 0, "column": 0, "rowSpan": 6, "columnSpan": 12}	{"configurationType": "TIMELINE"}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac0c-400c-800c-ca1e0a0c0c21	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"layoutMode": "CANVAS"}	\N	t	\N
6afc2f47-ccc1-40fb-8917-f8687f845a6d	bfd29d04-6b69-438c-8ac8-e126c647bde3	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Fields	FIELDS	1b9bb040-2722-44d7-a5ac-4e251b541f13	{"row": 0, "column": 0, "rowSpan": 12, "columnSpan": 12}	{"viewId": "f021740c-7b55-447c-818e-d79706d42ad5", "configurationType": "FIELDS", "newFieldDefaultVisibility": true}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac01-4001-8001-c0aba11c0111	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"index": 0, "layoutMode": "VERTICAL_LIST"}	\N	t	\N
8e4ef6ff-a1a4-4e44-ba32-73dc24f50f97	bfd29d04-6b69-438c-8ac8-e126c647bde3	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	People	FIELD	1b9bb040-2722-44d7-a5ac-4e251b541f13	{"row": 0, "column": 0, "rowSpan": 12, "columnSpan": 12}	{"fieldMetadataId": "f69f6a99-a81b-4454-a642-65d601c20cd2", "fieldDisplayMode": "CARD", "configurationType": "FIELD"}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac01-4001-8001-c0aba11c0112	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"index": 1, "layoutMode": "VERTICAL_LIST"}	\N	t	\N
70b60085-97fc-4ecf-978e-7ac0f2d5fb00	bfd29d04-6b69-438c-8ac8-e126c647bde3	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Opportunities	FIELD	1b9bb040-2722-44d7-a5ac-4e251b541f13	{"row": 0, "column": 0, "rowSpan": 12, "columnSpan": 12}	{"fieldMetadataId": "a9481120-7fd7-4e51-8ab7-e9dd7e93c295", "fieldDisplayMode": "CARD", "configurationType": "FIELD"}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac01-4001-8001-c0aba11c0114	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"index": 2, "layoutMode": "VERTICAL_LIST"}	\N	t	\N
3b23a708-4612-4369-b264-659aecd805c2	852e35f5-89b8-4113-ad4a-ba9ae9410ac3	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Timeline	TIMELINE	1b9bb040-2722-44d7-a5ac-4e251b541f13	{"row": 0, "column": 0, "rowSpan": 6, "columnSpan": 12}	{"configurationType": "TIMELINE"}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac01-4001-8001-c0aba11c0121	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"layoutMode": "CANVAS"}	\N	t	\N
68aad58a-06a9-4c1a-b939-d295487fa745	4e61e694-bd76-43c4-9a11-6872e809c789	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Tasks	TASKS	1b9bb040-2722-44d7-a5ac-4e251b541f13	{"row": 0, "column": 0, "rowSpan": 6, "columnSpan": 12}	{"configurationType": "TASKS"}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac01-4001-8001-c0aba11c0131	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"layoutMode": "CANVAS"}	\N	t	\N
deb38924-87f0-44d8-b052-ab9139bf58bc	17e23b93-39e5-4453-83e6-61fbd8ec3e05	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Notes	NOTES	1b9bb040-2722-44d7-a5ac-4e251b541f13	{"row": 0, "column": 0, "rowSpan": 6, "columnSpan": 12}	{"configurationType": "NOTES"}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac01-4001-8001-c0aba11c0141	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"layoutMode": "CANVAS"}	\N	t	\N
4b2aa23c-cfb0-4d01-9450-7c2604e4e07b	e0e3db1b-6ad3-42f1-8200-97021f22cd3c	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Files	FILES	1b9bb040-2722-44d7-a5ac-4e251b541f13	{"row": 0, "column": 0, "rowSpan": 6, "columnSpan": 12}	{"configurationType": "FILES"}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac01-4001-8001-c0aba11c0151	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"layoutMode": "CANVAS"}	\N	t	\N
23c65299-44f2-4bcf-bd0d-f376872d1ee8	cfb58ed0-f779-44fb-bd0d-bb60a74db49a	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Emails	EMAILS	1b9bb040-2722-44d7-a5ac-4e251b541f13	{"row": 0, "column": 0, "rowSpan": 6, "columnSpan": 12}	{"configurationType": "EMAILS"}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac01-4001-8001-c0aba11c0161	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"layoutMode": "CANVAS"}	\N	t	\N
de3c1360-32d1-4606-94ae-fa22bb447c67	2e7edec6-3ccc-40d5-a7c0-ab799548de44	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Calendar	CALENDAR	1b9bb040-2722-44d7-a5ac-4e251b541f13	{"row": 0, "column": 0, "rowSpan": 6, "columnSpan": 12}	{"configurationType": "CALENDAR"}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac01-4001-8001-c0aba11c0171	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"layoutMode": "CANVAS"}	\N	t	\N
bfdafcb4-cf3d-4704-ae9d-9f1922d7d32e	a785c80a-3db5-4b06-b61b-6a49be2993e3	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Fields	FIELDS	45600963-91d4-4b77-8fb6-449c8e3c1f44	{"row": 0, "column": 0, "rowSpan": 12, "columnSpan": 12}	{"viewId": "86d16288-5a26-4f70-8fdb-d6e6e669f31d", "configurationType": "FIELDS", "newFieldDefaultVisibility": true}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac0d-400d-800d-c0aec10d0d11	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"index": 0, "layoutMode": "VERTICAL_LIST"}	\N	t	\N
24a47611-0c48-4119-b9d7-95f14fe93381	65e779e3-8e8a-4b98-92e9-930194276541	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Timeline	TIMELINE	45600963-91d4-4b77-8fb6-449c8e3c1f44	{"row": 0, "column": 0, "rowSpan": 6, "columnSpan": 12}	{"configurationType": "TIMELINE"}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac0d-400d-800d-c0aec10d0d21	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"layoutMode": "CANVAS"}	\N	t	\N
6899dc2b-b3c3-495c-b891-c17d05b77f7b	0de14020-0d78-4f2b-abee-b1fd049dbddf	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Fields	FIELDS	711ed2e9-cc32-45af-ba39-7066034c618e	{"row": 0, "column": 0, "rowSpan": 12, "columnSpan": 12}	{"viewId": "7948282b-6c30-46be-98f3-c2da5bd06e3b", "configurationType": "FIELDS", "newFieldDefaultVisibility": true}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac10-4010-8010-a5c4a1101011	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"index": 0, "layoutMode": "VERTICAL_LIST"}	\N	t	\N
b0fbaed8-d3aa-4d58-9bc2-874a4a502e18	34f36f64-10e8-4212-94e0-4b56c5b7d417	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Timeline	TIMELINE	711ed2e9-cc32-45af-ba39-7066034c618e	{"row": 0, "column": 0, "rowSpan": 6, "columnSpan": 12}	{"configurationType": "TIMELINE"}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac10-4010-8010-a5c4a1101021	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"layoutMode": "CANVAS"}	\N	t	\N
c8367274-b169-4b17-87ae-d53deb3d32d0	9a344eb9-b962-426d-820d-cd93f9973488	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Fields	FIELDS	254569df-6932-4d1b-abcd-cb0f250b72ed	{"row": 0, "column": 0, "rowSpan": 12, "columnSpan": 12}	{"viewId": "83067e55-7cf9-47e2-a19f-3526a0f90068", "configurationType": "FIELDS", "newFieldDefaultVisibility": true}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac11-4011-8011-a5c4a5111111	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"index": 0, "layoutMode": "VERTICAL_LIST"}	\N	t	\N
4f641004-3207-45df-8dc8-42551ad4b280	d66c0bfe-a136-4a4a-9260-24f28df45fd9	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Timeline	TIMELINE	254569df-6932-4d1b-abcd-cb0f250b72ed	{"row": 0, "column": 0, "rowSpan": 6, "columnSpan": 12}	{"configurationType": "TIMELINE"}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac11-4011-8011-a5c4a5111121	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"layoutMode": "CANVAS"}	\N	t	\N
1bf228dc-11fa-42d3-bd0d-48d32321e08d	68fce7b3-7586-4b25-8d99-a8014cf0b719	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Fields	FIELDS	b03dcd32-17eb-4bd2-b529-7e0bbc7d4cdd	{"row": 0, "column": 0, "rowSpan": 12, "columnSpan": 12}	{"viewId": "6091fd91-4802-45a0-81cd-2552154dbb6c", "configurationType": "FIELDS", "newFieldDefaultVisibility": true}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac12-4012-8012-a5c4a6121211	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"index": 0, "layoutMode": "VERTICAL_LIST"}	\N	t	\N
87fd3508-bef4-4c12-9716-c9e036b02346	72799f98-f768-45c3-aa7a-94e5645c19fe	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Timeline	TIMELINE	b03dcd32-17eb-4bd2-b529-7e0bbc7d4cdd	{"row": 0, "column": 0, "rowSpan": 6, "columnSpan": 12}	{"configurationType": "TIMELINE"}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac12-4012-8012-a5c4a6121221	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"layoutMode": "CANVAS"}	\N	t	\N
f3169af7-d24e-4c02-adbb-7438e3f0c026	55c04b42-d58b-449c-a2db-005e3afc90e1	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Fields	FIELDS	e48dd522-875c-4937-9d9b-3a41a8cb0f1e	{"row": 0, "column": 0, "rowSpan": 12, "columnSpan": 12}	{"viewId": "3d875b63-fcf3-42db-99d5-3dd0b579a3ae", "configurationType": "FIELDS", "newFieldDefaultVisibility": true}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac13-4013-8013-a5efd1131311	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"index": 0, "layoutMode": "VERTICAL_LIST"}	\N	t	\N
37caa7bc-aff2-4f41-8443-9370486e9e2f	d3c35890-1913-4ff6-8bdf-f8913d0acc66	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Timeline	TIMELINE	e48dd522-875c-4937-9d9b-3a41a8cb0f1e	{"row": 0, "column": 0, "rowSpan": 6, "columnSpan": 12}	{"configurationType": "TIMELINE"}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac13-4013-8013-a5efd1131321	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"layoutMode": "CANVAS"}	\N	t	\N
d2a3a873-bd20-4754-a941-31b5fa30312f	4aeb21c9-2a99-4db1-9de9-a270912482b1	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Fields	FIELDS	ee0c23a3-0eb3-4d06-9b63-e89466584e21	{"row": 0, "column": 0, "rowSpan": 12, "columnSpan": 12}	{"viewId": "0bad5d82-019e-4f81-b922-e6e332e1e2bc", "configurationType": "FIELDS", "newFieldDefaultVisibility": true}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac14-4014-8014-a5ea10141411	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"index": 0, "layoutMode": "VERTICAL_LIST"}	\N	t	\N
ff2ff62a-d0f0-4b86-a950-40db96bc3b81	bfac345a-2e24-4a19-b715-14239ed1f01a	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Timeline	TIMELINE	ee0c23a3-0eb3-4d06-9b63-e89466584e21	{"row": 0, "column": 0, "rowSpan": 6, "columnSpan": 12}	{"configurationType": "TIMELINE"}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac14-4014-8014-a5ea10141421	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"layoutMode": "CANVAS"}	\N	t	\N
273b8c8b-f957-40a8-b228-bc4c3b742894	fdc4780d-7dc6-454d-a42f-072edddd92d1	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Thread	EMAIL_THREAD	\N	{"row": 0, "column": 0, "rowSpan": 12, "columnSpan": 12}	{"configurationType": "EMAIL_THREAD"}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-d57e-44cb-b220-69a881feb9c3	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"index": 1, "layoutMode": "VERTICAL_LIST"}	\N	t	\N
564e1cf9-005b-4b4f-a689-54a428527c4b	95aaf909-9474-4788-9935-1d01b1050f69	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Fields	FIELDS	0996fb48-437d-4a52-a0bd-098f18a09105	{"row": 0, "column": 0, "rowSpan": 12, "columnSpan": 12}	{"viewId": "24ba15ff-ddbb-45ba-9c12-999990314ac3", "configurationType": "FIELDS", "newFieldDefaultVisibility": true}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac04-4004-8004-a0be5a11a411	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"index": 0, "layoutMode": "VERTICAL_LIST"}	\N	t	\N
568483c9-9769-4dfd-923a-2960c2c249a6	95aaf909-9474-4788-9935-1d01b1050f69	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Note	FIELD_RICH_TEXT	0996fb48-437d-4a52-a0bd-098f18a09105	{"row": 12, "column": 0, "rowSpan": 6, "columnSpan": 12}	{"configurationType": "FIELD_RICH_TEXT"}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac04-4004-8004-a0be5a11a412	4a5dec44-2fb8-4d70-a6e0-6f483b222082	{"and": [{"===": [{"var": "device"}, "MOBILE"]}]}	{"index": 1, "layoutMode": "VERTICAL_LIST"}	\N	t	device == "MOBILE"
5fe915f0-91ff-4be6-ba74-80828731c6b7	de7a8df4-215a-483d-9198-1ebfc0bc8c28	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Note	FIELD_RICH_TEXT	0996fb48-437d-4a52-a0bd-098f18a09105	{"row": 12, "column": 0, "rowSpan": 6, "columnSpan": 12}	{"configurationType": "FIELD_RICH_TEXT"}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac04-4004-8004-a0be5a11a421	4a5dec44-2fb8-4d70-a6e0-6f483b222082	{"and": [{"===": [{"var": "device"}, "DESKTOP"]}]}	{"index": 0, "layoutMode": "VERTICAL_LIST"}	\N	t	device == "DESKTOP"
213441ba-2bb7-4623-8029-bf69b48abb51	1550812d-2fd8-4abf-bc61-9dec4333e7b6	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Timeline	TIMELINE	0996fb48-437d-4a52-a0bd-098f18a09105	{"row": 0, "column": 0, "rowSpan": 6, "columnSpan": 12}	{"configurationType": "TIMELINE"}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac04-4004-8004-a0be5a11a431	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"layoutMode": "CANVAS"}	\N	t	\N
a92d2598-6d15-41e6-8b2c-c35795fa985f	e74d67e7-2efd-426d-9b75-242ad47f4ee2	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Files	FILES	0996fb48-437d-4a52-a0bd-098f18a09105	{"row": 0, "column": 0, "rowSpan": 6, "columnSpan": 12}	{"configurationType": "FILES"}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac04-4004-8004-a0be5a11a441	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"layoutMode": "CANVAS"}	\N	t	\N
e05efd21-4319-41da-999f-dd75bde6a1ea	d858a0f3-5247-4b98-8675-0e770a0106f6	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Fields	FIELDS	19d8f9ef-3d91-4bea-8281-59d7548d04da	{"row": 0, "column": 0, "rowSpan": 12, "columnSpan": 12}	{"viewId": "ed48e600-d403-4626-8209-62da0b7ca4ae", "configurationType": "FIELDS", "newFieldDefaultVisibility": true}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac03-4003-8003-0aa0b1ca1311	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"index": 0, "layoutMode": "VERTICAL_LIST"}	\N	t	\N
10285fe9-2612-4e80-9478-a0d80661c6ff	d858a0f3-5247-4b98-8675-0e770a0106f6	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Point of Contact	FIELD	19d8f9ef-3d91-4bea-8281-59d7548d04da	{"row": 0, "column": 0, "rowSpan": 12, "columnSpan": 12}	{"fieldMetadataId": "a7ee5091-aff7-40d4-9337-976de32fb5d5", "fieldDisplayMode": "CARD", "configurationType": "FIELD"}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac03-4003-8003-0aa0b1ca1312	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"index": 1, "layoutMode": "VERTICAL_LIST"}	\N	t	\N
78194f98-3a70-418a-ab26-4643e652b25c	d858a0f3-5247-4b98-8675-0e770a0106f6	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Company	FIELD	19d8f9ef-3d91-4bea-8281-59d7548d04da	{"row": 0, "column": 0, "rowSpan": 12, "columnSpan": 12}	{"fieldMetadataId": "58b25376-e2c8-4809-b2e5-f9e8566e8b54", "fieldDisplayMode": "CARD", "configurationType": "FIELD"}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac03-4003-8003-0aa0b1ca1313	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"index": 2, "layoutMode": "VERTICAL_LIST"}	\N	t	\N
d6334a80-b9c4-4645-be13-7c81533f14fa	d858a0f3-5247-4b98-8675-0e770a0106f6	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Owner	FIELD	19d8f9ef-3d91-4bea-8281-59d7548d04da	{"row": 0, "column": 0, "rowSpan": 12, "columnSpan": 12}	{"fieldMetadataId": "2046bbe4-93d8-4abe-96f2-e393477293c5", "fieldDisplayMode": "CARD", "configurationType": "FIELD"}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac03-4003-8003-0aa0b1ca1314	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"index": 3, "layoutMode": "VERTICAL_LIST"}	\N	t	\N
d7304bdb-51b2-4454-9883-1e5baaefe9b7	956dfb85-3b4e-4298-ad68-dd949310b188	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Timeline	TIMELINE	19d8f9ef-3d91-4bea-8281-59d7548d04da	{"row": 0, "column": 0, "rowSpan": 6, "columnSpan": 12}	{"configurationType": "TIMELINE"}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac03-4003-8003-0aa0b1ca1321	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"layoutMode": "CANVAS"}	\N	t	\N
37914523-c081-46ec-83c2-a375d572a753	f82103e8-cdc9-4e8c-89e7-8592e0f5d4dc	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Tasks	TASKS	19d8f9ef-3d91-4bea-8281-59d7548d04da	{"row": 0, "column": 0, "rowSpan": 6, "columnSpan": 12}	{"configurationType": "TASKS"}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac03-4003-8003-0aa0b1ca1331	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"layoutMode": "CANVAS"}	\N	t	\N
bef13754-cdb3-4d84-898b-44083a165379	2dd22e74-bdf6-4475-82ec-9403bd75d293	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Notes	NOTES	19d8f9ef-3d91-4bea-8281-59d7548d04da	{"row": 0, "column": 0, "rowSpan": 6, "columnSpan": 12}	{"configurationType": "NOTES"}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac03-4003-8003-0aa0b1ca1341	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"layoutMode": "CANVAS"}	\N	t	\N
73f23915-73e0-4ee2-81bf-79e093ffa483	6a657c92-ed83-4f11-90da-1155bdda8e0a	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Files	FILES	19d8f9ef-3d91-4bea-8281-59d7548d04da	{"row": 0, "column": 0, "rowSpan": 6, "columnSpan": 12}	{"configurationType": "FILES"}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac03-4003-8003-0aa0b1ca1351	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"layoutMode": "CANVAS"}	\N	t	\N
c14110a7-5281-4e5a-8a30-cfa0ac6b1d5f	02efbcad-cdd0-4b13-9ece-24e07fbe645c	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Emails	EMAILS	19d8f9ef-3d91-4bea-8281-59d7548d04da	{"row": 0, "column": 0, "rowSpan": 6, "columnSpan": 12}	{"configurationType": "EMAILS"}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac03-4003-8003-0aa0b1ca1361	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"layoutMode": "CANVAS"}	\N	t	\N
c4ed9694-b0f7-4086-ae8d-0cfd393b988f	4da0a446-2dd6-4ec9-9ba9-740b44dc323e	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Calendar	CALENDAR	19d8f9ef-3d91-4bea-8281-59d7548d04da	{"row": 0, "column": 0, "rowSpan": 6, "columnSpan": 12}	{"configurationType": "CALENDAR"}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac03-4003-8003-0aa0b1ca1371	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"layoutMode": "CANVAS"}	\N	t	\N
90d8652b-cc3b-404a-a645-e188b91d680b	3ed805f2-c8d9-4535-83d1-76bf3ca585ad	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Fields	FIELDS	f59c15d0-9a52-4e93-b44f-ed4fc4bd90be	{"row": 0, "column": 0, "rowSpan": 12, "columnSpan": 12}	{"viewId": "c949770f-35c2-4d59-ad86-1fb04fcd5e92", "configurationType": "FIELDS", "newFieldDefaultVisibility": true}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac02-4002-8002-ae0a1ea11211	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"index": 0, "layoutMode": "VERTICAL_LIST"}	\N	t	\N
46a985dc-a34c-4413-932e-4409946db426	3ed805f2-c8d9-4535-83d1-76bf3ca585ad	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Company	FIELD	f59c15d0-9a52-4e93-b44f-ed4fc4bd90be	{"row": 0, "column": 0, "rowSpan": 12, "columnSpan": 12}	{"fieldMetadataId": "a045fbba-8284-497a-bba2-cd71dff54cef", "fieldDisplayMode": "CARD", "configurationType": "FIELD"}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac02-4002-8002-ae0a1ea11212	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"index": 1, "layoutMode": "VERTICAL_LIST"}	\N	t	\N
9100c95d-7af2-42ae-b659-3f82486e4592	3ed805f2-c8d9-4535-83d1-76bf3ca585ad	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Opportunities	FIELD	f59c15d0-9a52-4e93-b44f-ed4fc4bd90be	{"row": 0, "column": 0, "rowSpan": 12, "columnSpan": 12}	{"fieldMetadataId": "5b4c829e-7157-44bf-aae1-ce604f3b9845", "fieldDisplayMode": "CARD", "configurationType": "FIELD"}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac02-4002-8002-ae0a1ea11213	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"index": 2, "layoutMode": "VERTICAL_LIST"}	\N	t	\N
16663cb5-6aad-4acd-a189-f95de53f88ef	7c3688e5-26a1-4647-bbfc-02f886f46ed2	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Timeline	TIMELINE	f59c15d0-9a52-4e93-b44f-ed4fc4bd90be	{"row": 0, "column": 0, "rowSpan": 6, "columnSpan": 12}	{"configurationType": "TIMELINE"}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac02-4002-8002-ae0a1ea11221	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"layoutMode": "CANVAS"}	\N	t	\N
1770b9a8-28c8-409b-ae66-b34098249d33	329fe71b-da05-4acc-8d1e-3bb5be6ef315	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Tasks	TASKS	f59c15d0-9a52-4e93-b44f-ed4fc4bd90be	{"row": 0, "column": 0, "rowSpan": 6, "columnSpan": 12}	{"configurationType": "TASKS"}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac02-4002-8002-ae0a1ea11231	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"layoutMode": "CANVAS"}	\N	t	\N
7fcbcfe3-1d45-4cd9-9911-4bcb49d19a98	9fc1c998-f9d8-4af0-a2ae-f140fe2395c6	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Notes	NOTES	f59c15d0-9a52-4e93-b44f-ed4fc4bd90be	{"row": 0, "column": 0, "rowSpan": 6, "columnSpan": 12}	{"configurationType": "NOTES"}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac02-4002-8002-ae0a1ea11241	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"layoutMode": "CANVAS"}	\N	t	\N
f3e8cca8-829c-4788-8682-14ad69ca8174	eb9eb1d4-722f-464b-8a73-1450e4a13da3	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Files	FILES	f59c15d0-9a52-4e93-b44f-ed4fc4bd90be	{"row": 0, "column": 0, "rowSpan": 6, "columnSpan": 12}	{"configurationType": "FILES"}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac02-4002-8002-ae0a1ea11251	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"layoutMode": "CANVAS"}	\N	t	\N
b909c9b5-6d94-4645-830c-a629c22c2a06	d8d95d19-94e9-4e10-aede-d4a2cce14ed8	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Emails	EMAILS	f59c15d0-9a52-4e93-b44f-ed4fc4bd90be	{"row": 0, "column": 0, "rowSpan": 6, "columnSpan": 12}	{"configurationType": "EMAILS"}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac02-4002-8002-ae0a1ea11261	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"layoutMode": "CANVAS"}	\N	t	\N
9fc4fbe1-60b3-4f41-a8f5-a10d85a59b37	2ea08ba8-f34b-4e4e-9de9-244e831f0c1d	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Calendar	CALENDAR	f59c15d0-9a52-4e93-b44f-ed4fc4bd90be	{"row": 0, "column": 0, "rowSpan": 6, "columnSpan": 12}	{"configurationType": "CALENDAR"}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac02-4002-8002-ae0a1ea11271	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"layoutMode": "CANVAS"}	\N	t	\N
1ed3bb99-d575-444a-bfe4-72630a37f722	d3ffb56f-8a23-44d6-b4c4-3f8282c528ae	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Fields	FIELDS	a91a647d-4acf-456b-961b-40fbb3788c6d	{"row": 0, "column": 0, "rowSpan": 12, "columnSpan": 12}	{"viewId": "905fa722-5afd-4b81-ba82-ae14fb9b928c", "configurationType": "FIELDS", "newFieldDefaultVisibility": true}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac05-4005-8005-ba5ca11a5511	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"index": 0, "layoutMode": "VERTICAL_LIST"}	\N	t	\N
83516277-563e-48e0-8a0b-5d1c033784f1	d3ffb56f-8a23-44d6-b4c4-3f8282c528ae	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Task	FIELD_RICH_TEXT	a91a647d-4acf-456b-961b-40fbb3788c6d	{"row": 12, "column": 0, "rowSpan": 6, "columnSpan": 12}	{"configurationType": "FIELD_RICH_TEXT"}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac05-4005-8005-ba5ca11a5512	4a5dec44-2fb8-4d70-a6e0-6f483b222082	{"and": [{"===": [{"var": "device"}, "MOBILE"]}]}	{"index": 1, "layoutMode": "VERTICAL_LIST"}	\N	t	device == "MOBILE"
ac3ef45f-4364-4110-bd43-d7efc74d9664	5fd19fc2-bdcc-4036-87a9-5612a67e652d	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Task	FIELD_RICH_TEXT	a91a647d-4acf-456b-961b-40fbb3788c6d	{"row": 12, "column": 0, "rowSpan": 6, "columnSpan": 12}	{"configurationType": "FIELD_RICH_TEXT"}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac05-4005-8005-ba5ca11a5521	4a5dec44-2fb8-4d70-a6e0-6f483b222082	{"and": [{"===": [{"var": "device"}, "DESKTOP"]}]}	{"index": 0, "layoutMode": "VERTICAL_LIST"}	\N	t	device == "DESKTOP"
547b2e6a-9137-4d53-a082-328584ec085f	0b531b30-4cc8-4412-9a93-5edaa3c60038	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Timeline	TIMELINE	a91a647d-4acf-456b-961b-40fbb3788c6d	{"row": 0, "column": 0, "rowSpan": 6, "columnSpan": 12}	{"configurationType": "TIMELINE"}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac05-4005-8005-ba5ca11a5531	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"layoutMode": "CANVAS"}	\N	t	\N
f093b1a4-2195-44e4-8a93-954b60f24f7d	62544cf6-5b8d-4554-86f2-a2f1b40097a4	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Files	FILES	a91a647d-4acf-456b-961b-40fbb3788c6d	{"row": 0, "column": 0, "rowSpan": 6, "columnSpan": 12}	{"configurationType": "FILES"}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac05-4005-8005-ba5ca11a5541	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"layoutMode": "CANVAS"}	\N	t	\N
27f8294a-6512-482f-a6bb-aa27aa6a27e5	c5828c52-f0b2-4a88-b4fb-287f0c74f9de	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Flow	WORKFLOW	0f1f4454-5436-4ddd-b99b-5426058af575	{"row": 0, "column": 0, "rowSpan": 12, "columnSpan": 12}	{"configurationType": "WORKFLOW"}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac06-4006-8006-a0bcf10a6611	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"layoutMode": "CANVAS"}	\N	t	\N
5f028a90-0062-4baa-b9f8-0b8104323fc3	f32c05d9-8ebe-4f13-8a5d-1f310aad244e	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Fields	FIELDS	c407d619-2c05-491f-b2fd-b9481d652bc9	{"row": 0, "column": 0, "rowSpan": 12, "columnSpan": 12}	{"viewId": "21665928-421d-4110-9dec-493ce2e838f9", "configurationType": "FIELDS", "newFieldDefaultVisibility": true}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac15-4015-8015-a0bcf1151511	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"index": 0, "layoutMode": "VERTICAL_LIST"}	\N	t	\N
7448ac84-9ec9-4fd8-a9f2-9098c0a3b916	eb95ee99-bdff-4cc4-b78d-ebd7ee752288	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Timeline	TIMELINE	c407d619-2c05-491f-b2fd-b9481d652bc9	{"row": 0, "column": 0, "rowSpan": 6, "columnSpan": 12}	{"configurationType": "TIMELINE"}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac15-4015-8015-a0bcf1151521	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"layoutMode": "CANVAS"}	\N	t	\N
34961aa7-8f9a-471f-a6a9-13016ea0c227	beb7a199-f622-4f68-a993-6876a14298e4	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Fields	FIELDS	72cb4e16-ed23-4e5a-8ed3-47fd5f979113	{"row": 0, "column": 0, "rowSpan": 12, "columnSpan": 12}	{"viewId": "36158a62-099d-4ab0-a3c8-aa01c7f590f1", "configurationType": "FIELDS", "newFieldDefaultVisibility": true}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac07-4007-8007-a0bcf10a7711	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"index": 0, "layoutMode": "VERTICAL_LIST"}	\N	t	\N
0929d357-3522-4e4b-b593-319662e260f6	beb7a199-f622-4f68-a993-6876a14298e4	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Workflow	FIELD	72cb4e16-ed23-4e5a-8ed3-47fd5f979113	{"row": 0, "column": 0, "rowSpan": 12, "columnSpan": 12}	{"fieldMetadataId": "fd7c4c80-01c7-4736-a495-ee703a78dcbf", "fieldDisplayMode": "CARD", "configurationType": "FIELD"}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac07-4007-8007-a0bcf10a7712	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"index": 1, "layoutMode": "VERTICAL_LIST"}	\N	t	\N
bd04c64e-46c6-4ca7-b4f7-c921c203abde	44be8268-0182-40b0-8ea3-2a43da7002e1	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Flow	WORKFLOW_VERSION	72cb4e16-ed23-4e5a-8ed3-47fd5f979113	{"row": 0, "column": 0, "rowSpan": 12, "columnSpan": 12}	{"configurationType": "WORKFLOW_VERSION"}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac07-4007-8007-a0bcf10a7721	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"layoutMode": "CANVAS"}	\N	t	\N
4e57f107-ceaa-43d1-8c0b-4261602f604f	f602c4a1-870c-4140-935c-d304b725baea	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Fields	FIELDS	bfd36b0d-202c-430c-8f42-12ed18cb1f6a	{"row": 0, "column": 0, "rowSpan": 12, "columnSpan": 12}	{"viewId": "f51f99d4-e900-465a-968b-5d5819069b53", "configurationType": "FIELDS", "newFieldDefaultVisibility": true}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac08-4008-8008-a0bcf10a8811	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"index": 0, "layoutMode": "VERTICAL_LIST"}	\N	t	\N
582695c5-896d-40ee-ab58-ec748d953f31	f602c4a1-870c-4140-935c-d304b725baea	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Workflow	FIELD	bfd36b0d-202c-430c-8f42-12ed18cb1f6a	{"row": 0, "column": 0, "rowSpan": 12, "columnSpan": 12}	{"fieldMetadataId": "bfbcf2ce-5ff0-4dc1-a799-1943f4eda720", "fieldDisplayMode": "CARD", "configurationType": "FIELD"}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac08-4008-8008-a0bcf10a8813	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"index": 2, "layoutMode": "VERTICAL_LIST"}	\N	t	\N
448d9399-34db-408f-b290-ecb53f47f347	5705eb43-4b43-4f31-b5da-58bd907c0337	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Flow	WORKFLOW_RUN	bfd36b0d-202c-430c-8f42-12ed18cb1f6a	{"row": 0, "column": 0, "rowSpan": 12, "columnSpan": 12}	{"configurationType": "WORKFLOW_RUN"}	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	20202020-ac08-4008-8008-a0bcf10a8821	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"layoutMode": "CANVAS"}	\N	t	\N
c820c6e0-feeb-4369-b381-a2370c9d8846	71ca812f-e8b4-431b-bd6a-8e43a42d08e5	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Fields	FIELDS	a64cec42-2523-4102-b0d6-fdbb2f937bb6	{"row": 0, "column": 0, "rowSpan": 12, "columnSpan": 12}	{"viewId": "74054fef-1f89-468b-87a1-c85006b8b973", "configurationType": "FIELDS"}	2026-04-25 12:15:04.773+00	2026-04-25 12:15:04.773+00	\N	abce712d-fc4d-4660-b898-c90f1dcca6f2	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"index": 0, "layoutMode": "VERTICAL_LIST"}	\N	t	\N
4e82c54e-a702-4923-ab6d-6c40a2857ec6	e2304def-b910-4aed-b3d3-4c6a9d71d9a4	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Timeline	TIMELINE	a64cec42-2523-4102-b0d6-fdbb2f937bb6	{"row": 0, "column": 0, "rowSpan": 6, "columnSpan": 12}	{"configurationType": "TIMELINE"}	2026-04-25 12:15:04.773+00	2026-04-25 12:15:04.773+00	\N	978afa0a-4bc2-47ef-9619-18fe15a87bf0	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"layoutMode": "CANVAS"}	\N	t	\N
a30c81cd-90e8-4322-a932-7a287e844c1c	c8593757-705a-4845-89a2-89c7ea33ba1b	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Tasks	TASKS	a64cec42-2523-4102-b0d6-fdbb2f937bb6	{"row": 0, "column": 0, "rowSpan": 6, "columnSpan": 12}	{"configurationType": "TASKS"}	2026-04-25 12:15:04.773+00	2026-04-25 12:15:04.773+00	\N	64c3f1ea-bbe3-4579-86b3-203e4950b745	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"layoutMode": "CANVAS"}	\N	t	\N
ffbf5702-610a-4b4e-8686-dd2603c08187	e34081a3-288f-424f-9387-ae1a8df59439	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Notes	NOTES	a64cec42-2523-4102-b0d6-fdbb2f937bb6	{"row": 0, "column": 0, "rowSpan": 6, "columnSpan": 12}	{"configurationType": "NOTES"}	2026-04-25 12:15:04.773+00	2026-04-25 12:15:04.773+00	\N	a18ea79d-c029-4288-8031-10509edf8509	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"layoutMode": "CANVAS"}	\N	t	\N
6c6f5973-db13-432b-a632-0dfcd36007a8	8b50377e-5546-4d68-bafe-ebfda0b32d81	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Files	FILES	a64cec42-2523-4102-b0d6-fdbb2f937bb6	{"row": 0, "column": 0, "rowSpan": 6, "columnSpan": 12}	{"configurationType": "FILES"}	2026-04-25 12:15:04.773+00	2026-04-25 12:15:04.773+00	\N	21f245a4-db1a-446a-9522-ec79bfba3e98	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"layoutMode": "CANVAS"}	\N	t	\N
bb2bf4e6-5135-4814-b198-fa9ebde8cd3b	96b14e2e-12c8-4022-bd8d-3df009152578	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Fields	FIELDS	185d031c-a8d4-42b4-b9b8-55a8e1c6e608	{"row": 0, "column": 0, "rowSpan": 12, "columnSpan": 12}	{"viewId": "0e20d88b-564e-4437-9c06-392e385e03b5", "configurationType": "FIELDS"}	2026-04-25 12:25:53.47+00	2026-04-25 12:25:53.47+00	\N	209bd22e-b9c4-4726-a623-ceac8d4d108c	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"index": 0, "layoutMode": "VERTICAL_LIST"}	\N	t	\N
a77f928c-a340-4283-b4e3-3dbfd9cc63bb	373c2257-72b0-4894-a1cf-52d4a3bb8ed8	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Timeline	TIMELINE	185d031c-a8d4-42b4-b9b8-55a8e1c6e608	{"row": 0, "column": 0, "rowSpan": 6, "columnSpan": 12}	{"configurationType": "TIMELINE"}	2026-04-25 12:25:53.47+00	2026-04-25 12:25:53.47+00	\N	ed5fe31e-aa78-4e8e-ade9-29aa0f87c6b9	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"layoutMode": "CANVAS"}	\N	t	\N
d72d8617-43b7-4fcd-b154-c8ea27d3d7c2	d32467f9-2594-44a8-82e5-fe50446f3eb7	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Tasks	TASKS	185d031c-a8d4-42b4-b9b8-55a8e1c6e608	{"row": 0, "column": 0, "rowSpan": 6, "columnSpan": 12}	{"configurationType": "TASKS"}	2026-04-25 12:25:53.47+00	2026-04-25 12:25:53.47+00	\N	1cb901b5-28b5-4397-832a-1a7374e88a58	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"layoutMode": "CANVAS"}	\N	t	\N
fa043be6-06f5-45d0-89d5-9a197d62d55c	04dd8202-3fb7-4654-9b8d-f8ab90e774cf	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Notes	NOTES	185d031c-a8d4-42b4-b9b8-55a8e1c6e608	{"row": 0, "column": 0, "rowSpan": 6, "columnSpan": 12}	{"configurationType": "NOTES"}	2026-04-25 12:25:53.47+00	2026-04-25 12:25:53.47+00	\N	27c79755-6843-4392-b91b-106752cf16e3	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"layoutMode": "CANVAS"}	\N	t	\N
4ff96f62-abae-4184-a5f9-aa6f4500992d	5a194a0b-d7d3-4612-b023-a69e9398bc29	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	Files	FILES	185d031c-a8d4-42b4-b9b8-55a8e1c6e608	{"row": 0, "column": 0, "rowSpan": 6, "columnSpan": 12}	{"configurationType": "FILES"}	2026-04-25 12:25:53.47+00	2026-04-25 12:25:53.47+00	\N	68232f69-c3a2-4092-81f8-cd7f5f1aec60	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	{"layoutMode": "CANVAS"}	\N	t	\N
\.


--
-- Data for Name: permissionFlag; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."permissionFlag" (id, "roleId", flag, "workspaceId", "createdAt", "updatedAt", "universalIdentifier", "applicationId") FROM stdin;
\.


--
-- Data for Name: postgresCredentials; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."postgresCredentials" (id, "user", "passwordHash", "createdAt", "updatedAt", "deletedAt", "workspaceId") FROM stdin;
\.


--
-- Data for Name: publicDomain; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."publicDomain" (id, "createdAt", "updatedAt", domain, "isValidated", "workspaceId") FROM stdin;
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core.role (id, label, "canUpdateAllSettings", "canAccessAllTools", "canReadAllObjectRecords", "canUpdateAllObjectRecords", "canSoftDeleteAllObjectRecords", "canDestroyAllObjectRecords", description, icon, "workspaceId", "createdAt", "updatedAt", "isEditable", "canBeAssignedToUsers", "canBeAssignedToAgents", "canBeAssignedToApiKeys", "universalIdentifier", "applicationId") FROM stdin;
cf55e3ea-d810-4494-b8c5-4e146a6997eb	Admin	t	t	t	t	t	t	Admin role	IconUserCog	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	f	t	f	t	20202020-02c2-43f2-b94d-cab1f2b532eb	4a5dec44-2fb8-4d70-a6e0-6f483b222082
a6644555-1397-476c-8811-f8879569ac09	Member	f	t	t	t	t	t	Member role	IconUser	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:18.82+00	2026-04-25 11:34:18.82+00	t	t	f	f	17d379e1-2fb8-493a-8b5b-cf38c98460f3	8c07d085-7bf4-4849-934d-3c70dcf4340d
\.


--
-- Data for Name: roleTarget; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."roleTarget" (id, "workspaceId", "roleId", "userWorkspaceId", "agentId", "apiKeyId", "createdAt", "updatedAt", "universalIdentifier", "applicationId") FROM stdin;
21105e37-df53-48f6-bd1e-9b53c84a8515	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	cf55e3ea-d810-4494-b8c5-4e146a6997eb	24b4e1e7-f6d6-4417-96da-39a34e55a1c9	\N	\N	2026-04-25 11:34:18.764+00	2026-04-25 11:34:18.764+00	ee251d26-cf94-4333-a230-082b36625121	8c07d085-7bf4-4849-934d-3c70dcf4340d
\.


--
-- Data for Name: rowLevelPermissionPredicate; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."rowLevelPermissionPredicate" ("universalIdentifier", "applicationId", id, "fieldMetadataId", "objectMetadataId", operand, value, "subFieldName", "workspaceMemberFieldMetadataId", "workspaceMemberSubFieldName", "rowLevelPermissionPredicateGroupId", "positionInRowLevelPermissionPredicateGroup", "workspaceId", "roleId", "createdAt", "updatedAt", "deletedAt") FROM stdin;
\.


--
-- Data for Name: rowLevelPermissionPredicateGroup; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."rowLevelPermissionPredicateGroup" ("universalIdentifier", "applicationId", id, "parentRowLevelPermissionPredicateGroupId", "logicalOperator", "positionInRowLevelPermissionPredicateGroup", "workspaceId", "roleId", "createdAt", "updatedAt", "deletedAt", "objectMetadataId") FROM stdin;
\.


--
-- Data for Name: searchFieldMetadata; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."searchFieldMetadata" (id, "objectMetadataId", "fieldMetadataId", "createdAt", "updatedAt", "workspaceId") FROM stdin;
\.


--
-- Data for Name: skill; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core.skill ("universalIdentifier", "applicationId", "workspaceId", id, name, label, icon, description, content, "isCustom", "isActive", "createdAt", "updatedAt") FROM stdin;
20202020-297a-4721-a1f3-c79a30b5420e	4a5dec44-2fb8-4d70-a6e0-6f483b222082	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	dacc756e-9838-4047-970b-df3840f691c0	workflow-building	Workflow Building	IconSettingsAutomation	Creating and managing automation workflows with triggers and steps	# Workflow Building Skill\n\nYou help users create and manage automation workflows.\n\n## Capabilities\n\n- Create workflows from scratch\n- Modify existing workflows (add, remove, update steps)\n- Explain workflow structure and suggest improvements\n\n## Key Concepts\n\n- **Triggers**: DATABASE_EVENT, MANUAL, CRON, WEBHOOK\n- **Steps**: CREATE_RECORD, SEND_EMAIL, CODE, LOGIC_FUNCTION, etc.\n- **Data flow**: Use {{stepId.fieldName}} to reference previous step outputs\n- **Relationships**: Use nested objects like {"company": {"id": "{{reference}}"}}\n\n## CRON Trigger Settings Schema\n\nFor CRON triggers, settings.type must be one of these exact values:\n\n1. **DAYS** - Daily schedule\n   - Requires: schedule: { day: number (1+), hour: number (0-23), minute: number (0-59) }\n   - Example: { type: "DAYS", schedule: { day: 1, hour: 9, minute: 0 }, outputSchema: {} }\n\n2. **HOURS** - Hourly schedule (USE THIS FOR "EVERY HOUR")\n   - Requires: schedule: { hour: number (1+), minute: number (0-59) }\n   - Example: { type: "HOURS", schedule: { hour: 1, minute: 0 }, outputSchema: {} }\n   - This runs every X hours at Y minutes past the hour\n\n3. **MINUTES** - Minute-based schedule\n   - Requires: schedule: { minute: number (1+) }\n   - Example: { type: "MINUTES", schedule: { minute: 15 }, outputSchema: {} }\n\n4. **CUSTOM** - Custom cron pattern\n   - Requires: pattern: string (cron expression)\n   - Example: { type: "CUSTOM", pattern: "0 * * * *", outputSchema: {} }\n\n## CODE Steps\n\nCreate the step using `create_workflow_version_step` (stepType: "CODE") or `create_complete_workflow`. This returns a step with a `logicFunctionId` in settings.input — the step starts with a default function, not the user's desired code.\n\n## LOGIC_FUNCTION Steps\n\nLOGIC_FUNCTION steps execute logic functions provided by installed applications. To add one:\n\n1. Call `list_logic_function_tools` to discover available logic function tools with their IDs.\n2. Use `create_workflow_version_step` with stepType "LOGIC_FUNCTION" and pass the logicFunctionId in defaultSettings:\n   { "stepType": "LOGIC_FUNCTION", "workflowVersionId": "<version-id>", "defaultSettings": { "input": { "logicFunctionId": "<logic-function-id>" } } }\n3. Or when using `create_complete_workflow`, include a step with type "LOGIC_FUNCTION" and settings.input.logicFunctionId.\n\n## Critical Notes\n\nAlways rely on tool schema definitions:\n- The workflow creation tool provides comprehensive schemas with examples\n- Follow schema definitions exactly for field names, types, and structures\n- Schema includes validation rules and common patterns\n\n## Approach\n\n- Ask clarifying questions to understand user needs\n- List logic function tools. Present relevant ones to the user as options before defaulting to CODE steps.\n- Suggest appropriate actions for the use case\n- Explain each step and why it's needed\n- For modifications, understand current structure first\n- Ensure workflow logic remains coherent\n\nPrioritize user understanding and workflow effectiveness.	f	t	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00
20202020-0c39-4523-9543-e6c2a807937e	4a5dec44-2fb8-4d70-a6e0-6f483b222082	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f2dee681-ec47-4b34-81e2-9230ed7340d5	data-manipulation	Data Manipulation	IconDatabase	Searching, filtering, creating, and updating records across all objects	# Data Manipulation Skill\n\nYou explore and manage data across companies, people, opportunities, tasks, notes, and custom objects.\n\n## Capabilities\n\n- Search, filter, sort, create, update records\n- Manage relationships between records\n- Bulk operations and data analysis\n\n## Constraints\n\n- READ and WRITE access to all objects\n- CANNOT delete records or access workflow objects\n- CANNOT modify workspace settings\n\n## Multi-step Approach\n\n- Chain queries to solve complex requests (e.g., find companies → get their opportunities → calculate totals)\n- If a query fails or returns no results, try alternative filters or approaches\n- Validate data exists before referencing it (search before update)\n- Use results from one query to inform the next\n- Try 2-3 different approaches before giving up\n\n## Sorting (Critical)\n\nFor "top N" queries, use orderBy with limit:\n- Examples: orderBy: [{"employees": "DescNullsLast"}], orderBy: [{"createdAt": "AscNullsFirst"}]\n- Valid directions: "AscNullsFirst", "AscNullsLast", "DescNullsFirst", "DescNullsLast"\n\n## Before Bulk Operations\n\n- Confirm the scope and impact\n- Explain what will change\n\nPrioritize data integrity and provide clear feedback on operations performed.	f	t	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00
20202020-c81b-4af8-9255-4c34bd0eac9c	4a5dec44-2fb8-4d70-a6e0-6f483b222082	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	b54d938b-0de6-47e3-9f64-61eef0304bf4	workspace-demo-seeding	Workspace Demo Seeding	IconDatabase	Seeding demo metadata and data for workspace setup and testing purposes	# Workspace Demo Seeding Skill\nYou will transform the existing standard workspace into a fully custom demo tailored to the user's business type.\n\nThe goal is to tell a coherent and realistic story with the data: custom fields added to standard objects, new custom objects for domain-specific entities, rich relations, seeded and updated records, views, and enrichment data (emails, calendar events, tasks, notes, files) that make the workspace feel like a real company in operation.\n\n## Object strategy\n\n**Keep the standard objects — People, Companies, and Opportunities — and reuse their existing seed data.** They already have emails and calendar events linked to them as participants. The demo story is built on top of them, not instead of them.\n\n- **People** → map to the domain's "contact" role (e.g. clients, candidates, customers, agents)\n- **Companies** → map to the domain's "organisation" role (e.g. suppliers, agencies, employers)\n- **Opportunities** → map to the domain's "deal/pipeline" role (e.g. job applications, deals, repair estimates)\n\n**Add 2 to 3 additional custom objects** for domain-specific entities that don't map to People/Companies/Opportunities (e.g. Properties, Cars, Products, Projects). Keep the custom object count low — the standard objects carry most of the story.\n\n**Add custom fields** to People, Companies, and Opportunities to enrich them with domain-specific data (e.g. add "specialisation", "licenseNumber" to People; add "industry vertical", "tier" to Companies; add "stage", "closeDate" to Opportunities).\n\nCreate rich relation fields between standard and custom objects to show off the relational capabilities of the platform.\n\nIf you have to create multiple things you *MUST* use the relevant create many tool if it exists:\n- Use *create_many_object_metadata* to create all custom objects at once\n- Use *create_many_field_metadata* to create all non-relation fields at once (including new fields on standard objects)\n- Use *create_many_relation_fields* to create all relation fields between objects at once (do this AFTER creating the objects and non-relation fields)\n\nIf you have to wait use the navigate_app tool.\n\nFor the fields you will create, make sure to create a good variety of field types to showcase the different capabilities of the platform, for example:\n- Create SELECT and SELECT_MULTIPLE field types for building demo board index views and table with groups views\n- Create DATE_TIME fields to be able to create calendar views\n- Create CURRENCY and NUMERIC fields for graphs\n\n*Here are the steps to follow closely:*\n\nSTEP 0: Present a plan to the user and wait for approval.\n- Use list_object_metadata_items to see all available objects in the workspace\n- Use find_people (limit: 5) and find_companies (limit: 5) and find_opportunities (limit: 5) to understand the existing seed data shape\n- Based on the user's business type, propose a plan that lists:\n  - How People, Companies, and Opportunities map to the domain story (e.g. "People = Candidates", "Companies = Employers")\n  - The 2–3 custom objects you will create, each with a one-line description of their role\n  - The custom fields you will add to People, Companies, and Opportunities\n  - A brief description of the key relations between objects\n- Present this plan to the user and *wait for their confirmation or adjustments* before proceeding\n- Once approved, call the custom-objects-cleanup skill to archive all existing custom objects without asking for user confirmation\n- Wait 3 seconds after deletions for the backend side effects to be completed\n\nSTEP 1: Create all the custom objects at once with create_many_object_metadata\nname must start with lowercase letter and contain only alphanumeric letters\n\nSTEP 2: Wait 3 seconds, for the backend side effects to be completed\n\nSTEP 3: Create all NON-RELATION fields for ALL objects by batch with create_many_field_metadata.\nDo a separate batch call for each object.\nThis includes:\n- New custom fields for the standard objects (Person, Company, Opportunity) — use their objectMetadataId from list_object_metadata_items\n- All non-relation fields for the new custom objects\nDO NOT include relation fields in this step. Only create TEXT, NUMBER, BOOLEAN, DATE_TIME, SELECT, MULTI_SELECT, CURRENCY, etc.\nSELECT option values must be UPPER_SNAKE_CASE\n\nSTEP 4: Wait 3 seconds, for the backend side effects to be completed\n\nSTEP 5: Create all RELATION fields between objects at once with create_many_relation_fields\nThe name property should be camel-cased or the backend will throw, targetFieldLabel must be a string, targetFieldIcon must be a string, type must be one of the following values: MANY_TO_ONE, ONE_TO_MANY\ntargetFieldIcon is like IconSomething, it's ok if it doesn't exist in the icon library, it will just be a blank icon, but it needs to be a string that starts with Icon and is in PascalCase\n\nSTEP 6: Wait 3 seconds, for the backend side effects to be completed\n\nSTEP 7: Rename and enrich the first N records of People, Companies, and Opportunities.\n- Use find_people (limit: 50, orderBy: [{ position: "AscNullsFirst" }]), find_companies (limit: 50, orderBy: [{ position: "AscNullsFirst" }]), find_opportunities (limit: 50, orderBy: [{ position: "AscNullsFirst" }]) to get the IDs of the first records in each table\n  - Ordering by position ascending gives the earliest-inserted records, which are contiguous in the table — this keeps the demo data tightly grouped and makes the workspace feel coherent\n- For each standard object, call update_people / update_companies / update_opportunities **individually per record** (one call per record) to set domain-relevant names and field values:\n  - **People**: replace nameFirstName + nameLastName with realistic names that fit the domain role (e.g. for a law firm: "Sophie Martin", "James O'Brien"; for a clinic: "Dr. Clara Reyes", "Marco Bianchi"). Also set jobTitle to a domain-appropriate title.\n  - **Companies**: replace name with realistic company names that fit the domain (e.g. for a law firm: "Ashford & Partners", "Nexus Legal Group"; for a clinic: "Meridian Health Clinic", "CarePoint Medical").\n  - **Opportunities**: replace name with a domain-relevant deal name (e.g. "Q2 retainer — Ashford & Partners", "New patient intake — Meridian Health").\n  - Also set the new custom fields on each record: spread realistic values across SELECT fields, set plausible CURRENCY/NUMERIC amounts, set DATE_TIME fields around TODAY.\n- Do this one record at a time — the API does not support bulk individual updates with different values per record\n- Wait 3 seconds after finishing all updates for one object type before moving to the next\n\nSTEP 7.5: Add view fields to the default views of standard objects to expose the new custom fields.\nFor each of People, Companies, and Opportunities:\n- Navigate to the object's default view using the navigate_app tool\n- Wait 3 seconds\n- Use create_many_view_fields to add all the new custom fields to the default view so they are visible\n  - Use decimal positions between 0 and 1 to insert them right after the label identifier field\n- Navigate to the object's default view again using the navigate_app tool so the user can see the enriched records\n- Wait 3 seconds\n\nSTEP 8: For each new custom object, repeat ALL of the following sub-steps before moving to the next object:\n- Navigate the object's default view using the navigate_app tool\n- Wait 3 seconds, so the user has time to see the object default view\n- Create the view fields for the default view, use the create_many_view_fields tool, and make sure to include all created fields, including the relation fields, so that we have a complete view of the object with all its fields.\n  BE CAREFUL to use a position that will put those view fields right after the first label identifier field\n  which has a position of 0 and the next system created fields which begin at 1, *so use decimal positions between 0 and 1*\n  *YOU MUST CREATE ALL VIEW FIELDS FOR ALL FIELDS, INCLUDING RELATION FIELDS, IN THIS STEP, DO NOT LEAVE ANY FIELD WITHOUT A VIEW FIELD, OTHERWISE IT WILL NOT BE VISIBLE IN THE DEFAULT VIEW AND THE USER WON'T KNOW IT EXISTS*\n\n- **MANDATORY**: Navigate to the object's default view again using the navigate_app tool — YOU MUST DO THIS BEFORE EACH OBJECT'S DATA SEEDING, every single time, without exception\n- Wait 3 seconds\n- Seed relevant and realistic mock data for this object:\n  - use the relevant tool to create many records for this object\n  - between 20 and 50\n  - with a coherent combination of values\n  - link records to existing People and Companies using the relation fields you created\n  - use dates that are around TODAY so it's relevant for seeing past / future and present records\n\n- **MANDATORY**: Navigate to the object's default view again using the navigate_app tool so the user can see the populated data — DO NOT SKIP THIS, even if you already navigated earlier in this loop iteration\n- Wait 3 seconds so the user has time to see the seeded records\n\n- Then create 2 to 3 additional views for this object, one at a time. For each view, complete ALL of the following sub-steps before creating the next view:\n  - Create the view using the create_view tool:\n    - If the object has a SELECT field (e.g. status, stage, priority, type), create a **KANBAN** view grouped by that SELECT field with a relevant name like "By Status", "Pipeline", "By Priority".\n      - Set kanbanAggregateOperation to COUNT so each column shows the number of records.\n      - If there is a CURRENCY or NUMERIC field, also set kanbanAggregateOperationFieldName to that field for a SUM aggregate view.\n    - If the object has a DATE or DATE_TIME field (e.g. dueDate, closedAt, scheduledAt), create a **CALENDAR** view and pass both `calendarFieldName` (that field name) and `calendarLayout` ("DAY", "WEEK", or "MONTH") with a relevant name like "Calendar", "Schedule", "Timeline".\n    - Create a **TABLE** view with a meaningful group (mainGroupByFieldName set to a SELECT field) with a name like "By Type", "By Stage", "Grouped", or similar.\n  - Use create_many_view_fields to add all relevant field columns to this view (using decimal positions between 0 and 1)\n  - Add filters and sorts to this view:\n    - **KANBAN views**: Sort by a CURRENCY or NUMERIC field DESC (biggest value first) if one exists, or by createdAt DESC. Add a filter to exclude archived/cancelled records if such a SELECT option exists.\n    - **CALENDAR views**: Sort by the date field ASC (earliest events first). Add a filter using IS_IN_FUTURE or IS_RELATIVE to show only upcoming records by default.\n    - **TABLE with groups**: Sort by createdAt DESC (most recent first) and add a filter on a meaningful field (e.g. status IS_NOT "CANCELLED", or amount GREATER_THAN_OR_EQUAL to some threshold that keeps ~80% of the records visible).\n  - **MANDATORY**: Navigate to this view immediately using the navigate_app tool — YOU MUST DO THIS FOR EVERY SINGLE VIEW, right after its fields/filters/sorts are set up, without exception\n  - Wait 3 seconds so the user can see the view and course-correct if needed\n\nAlso create additional views for the standard objects (People, Companies, Opportunities) that showcase the new custom fields:\n- For People: a KANBAN view grouped by the new SELECT field you added (e.g. "By Specialisation", "By Status")\n- For Opportunities: a KANBAN view grouped by the new stage/status field (pipeline view)\n- For Companies: a TABLE view grouped by the new SELECT field\nNavigate to each view after creating it. Wait 3 seconds.\n\nLoop STEP 8 for all the custom objects\n\nSTEP 9: Create a multi-tab dashboard that tells the full story of the business.\n\nUse create_complete_dashboard to create the first tab, then add_dashboard_tab + add_dashboard_widget for subsequent tabs.\n\n**Structure: 3 tabs**\n\nTab 1 — "Overview": high-level KPIs and charts across the whole workspace\n- Row 0: 3–4 AGGREGATE_CHART widgets (KPIs) — one per key metric (e.g. total revenue from Opportunities, count of active People, count of open deals). columnSpan 3–4, rowSpan 3.\n- Row 3: 1–2 BAR_CHART or LINE_CHART widgets showing trends over time (group by a DATE_TIME field with MONTH granularity). columnSpan 6, rowSpan 7.\n- Row 3: 1 PIE_CHART showing distribution by a SELECT field (e.g. status, type). columnSpan 6, rowSpan 7.\n- Row 10: 1 STANDALONE_RICH_TEXT widget summarising the dashboard story. columnSpan 12, rowSpan 3.\n\nTab 2 — "[Domain object] pipeline" (e.g. "Deals", "Applications", "Repairs"): focus on Opportunities enriched with domain data\n- Before adding the RECORD_TABLE widget, run this 3-step sequence:\n  1. create_view (type TABLE, name e.g. "Active Deals") → get the new viewId\n  2. create_many_view_fields on the new viewId — add 4–6 key fields (name, the new stage/status SELECT, a CURRENCY/NUMERIC field, a DATE field, linked Person or Company). Use positions 0, 1, 2… and isVisible: true.\n  3. create_many_view_filters + create_view_sort — e.g. filter out CLOSED/LOST records (SELECT IS_NOT "CLOSED"), sort by value DESC\n- Row 0: 1 RECORD_TABLE widget. Set objectMetadataId to Opportunity, configuration.viewId to the dedicated view. columnSpan 12, rowSpan 8.\n- Row 8: 1 BAR_CHART grouped by the stage SELECT field. columnSpan 6, rowSpan 7.\n- Row 8: 1 PIE_CHART or AGGREGATE_CHART on the CURRENCY field. columnSpan 6, rowSpan 7.\n\nTab 3 — "[Domain people role] list" (e.g. "Clients", "Candidates", "Contacts"): focus on People enriched with domain data\n- Before adding the RECORD_TABLE widget, run this 3-step sequence:\n  1. create_view (type TABLE, name e.g. "All Clients") → get the new viewId\n  2. create_many_view_fields — add 4–5 key fields (name, email, the new SELECT/status field, a DATE field, linked Company)\n  3. create_view_sort — sort by createdAt DESC or by name ASC\n- Row 0: 1 RECORD_TABLE widget with the dedicated view. columnSpan 12, rowSpan 8.\n- Row 8: 2–3 AGGREGATE_CHART KPIs (count, totals). columnSpan 4, rowSpan 3.\n- Row 11: 1 BAR_CHART or LINE_CHART. columnSpan 12, rowSpan 7.\n\nAfter creating the dashboard, navigate to the dashboard page.\n	f	t	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00
20202020-ffdb-4623-abfb-036b9abeb121	4a5dec44-2fb8-4d70-a6e0-6f483b222082	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	061f22f1-588c-4642-b2c1-02d8c9321dad	dashboard-building	Dashboard Building	IconLayoutDashboard	Creating and managing dashboards with widgets and layouts	# Dashboard Building Skill\n\nYou help users create and manage dashboards with widgets.\n\n## Tools\n\n- list_dashboards, get_dashboard\n- create_complete_dashboard\n- add_dashboard_tab, add_dashboard_widget, update_dashboard_widget, delete_dashboard_widget\n- list_object_metadata_items (resolve object + field IDs)\n\n## Graph Widget Workflow\n\n1. Ask what data the user wants to visualize.\n2. Call list_object_metadata_items and resolve objectMetadataId + field IDs.\n3. Always call get_dashboard before modifying widgets.\n4. Build the widget configuration using the rules below.\n5. Call add_dashboard_widget or update_dashboard_widget. Use activeTabId from context if available.\n6. Call get_dashboard to verify the final configuration.\n\n## Field Resolution Rules\n\n- All *MetadataId fields must be real UUIDs from metadata.\n- Match by name or label, but write UUIDs into all *MetadataId fields.\n- Subfield names use FIELD NAMES, not labels.\n- Composite group-by requires a subfield (e.g. address → "addressCity").\n- **CRITICAL: Relation fields (RELATION, MORPH_RELATION) MUST always include a subFieldName** (e.g. "name", "email", "stage"). Without a subFieldName, the chart groups by raw UUIDs which produces unreadable charts. Always pick a meaningful scalar field from the target object.\n\n## Subfield Syntax\n\n- Composite: `address` + `addressCity` → subFieldName "addressCity"\n- Relation to scalar field: `company.name` → subFieldName "name" (only when target "name" is a simple TEXT/NUMBER field)\n- Relation to composite field: `owner.name` where "name" is FULL_NAME → subFieldName must be "name.firstName" or "name.lastName" (NOT just "name")\n- Relation + composite: `company.address.addressCity` → subFieldName "address.addressCity"\n- **Never omit subFieldName for relation fields** — grouping by ID is almost never useful\n- **IMPORTANT**: Check the target field's type from list_object_metadata_items. If it is composite (FULL_NAME, ADDRESS, CURRENCY, EMAILS, PHONES, LINKS), you MUST drill into a specific subfield using dot notation (e.g. "name.firstName", "address.addressCity", "emails.primaryEmail").\n\n## User Language Notes\n\n- "X axis" / "categories" → primaryAxisGroupByFieldMetadataId\n- "Y axis" / "metric" → aggregateFieldMetadataId + aggregateOperation\n- "Group by" / "stacking" / "colors" → secondaryAxisGroupByFieldMetadataId\n- "Unstacked" / "remove group by" → clear secondaryAxisGroupByFieldMetadataId only\n- "KPI" / "just a number" → AGGREGATE_CHART\n- "Legend" → displayLegend\n- "Data labels" → displayDataLabel\n- "Hide empty values" → omitNullValues\n- "Min range" / "Max range" → rangeMin / rangeMax\n- "Running total" → isCumulative\n\n## Graph Configuration Rules\n\n- Use the tool schema as the source of truth for required/optional fields.\n- Supported graph configurationType values: AGGREGATE_CHART, BAR_CHART, LINE_CHART, PIE_CHART.\n- BAR_CHART and LINE_CHART use primaryAxisGroupByFieldMetadataId.\n- PIE_CHART uses groupByFieldMetadataId (not primaryAxisGroupByFieldMetadataId).\n- If any orderBy is MANUAL, include the matching manual sort array.\n- If rangeMin and rangeMax are both set, rangeMin must be <= rangeMax.\n- Set date granularity only when grouping by date fields.\n- "stacked bars" means secondaryAxisGroupByFieldMetadataId + groupMode STACKED.\n- "stacked lines" means isStacked true.\n\n## Non-graph Widgets\n\n- IFRAME: configurationType "IFRAME" + url\n- STANDALONE_RICH_TEXT: configurationType "STANDALONE_RICH_TEXT" + body with markdown content\n  - IMPORTANT: Put the actual text content in configuration.body.markdown, NOT in the widget title\n  - Widget title should be a short label (e.g. "Notes", "Summary"), body.markdown holds the real content\n- RECORD_TABLE: configurationType "RECORD_TABLE" — displays a filterable, sortable record list\n  - **MANDATORY 3-step pre-sequence before creating the widget**:\n    1. call create_view (type TABLE, name e.g. "Repairs Dashboard Table") → get the new viewId\n    2. call create_many_view_fields on the new viewId — add 4–6 of the most relevant fields (label identifier + key SELECT/DATE/CURRENCY fields). Use positions 0, 1, 2… and isVisible: true.\n    3. call create_many_view_filters and/or create_view_sort on the new viewId to focus the table (e.g. filter out DONE/CANCELLED records, sort by createdAt DESC or a date field ASC)\n  - Never reuse a record index view — widget views and record index views must be separate\n  - Set objectMetadataId on the widget (top-level, required)\n  - Set configuration.viewId to the UUID of the dedicated view (required)\n  - columnSpan 12 (full width) or 6 (half width), rowSpan 6–10\n\nExample (STANDALONE_RICH_TEXT):\n{\n  "configurationType": "STANDALONE_RICH_TEXT",\n  "body": { "markdown": "## Quarterly Summary\\n\\nKey metrics:\\n- Revenue up 15%\\n- 42 new deals closed\\n\\n**Next steps**: Focus on enterprise pipeline." }\n}\n\nExample (RECORD_TABLE — always run the 3-step pre-sequence first):\nStep 1 — create_view: { "name": "Active Repairs", "objectNameSingular": "repair", "type": "TABLE" } → { "id": "<view-uuid>" }\nStep 2 — create_many_view_fields: { "viewFields": [{ "viewId": "<view-uuid>", "fieldMetadataId": "<status-field-uuid>", "position": 1, "isVisible": true }, { "viewId": "<view-uuid>", "fieldMetadataId": "<amount-field-uuid>", "position": 2, "isVisible": true }] }\nStep 3 — create_many_view_filters: { "filters": [{ "viewId": "<view-uuid>", "fieldMetadataId": "<status-field-uuid>", "operand": "IS_NOT", "value": "DONE" }] }\nStep 3b — create_view_sort: { "viewId": "<view-uuid>", "fieldMetadataId": "<createdAt-field-uuid>", "direction": "DESC" }\nStep 4 — add_dashboard_widget: { "type": "RECORD_TABLE", "objectMetadataId": "<repair-object-uuid>", "configuration": { "configurationType": "RECORD_TABLE", "viewId": "<view-uuid>" }, "gridPosition": { "row": 0, "column": 0, "rowSpan": 8, "columnSpan": 12 } }\n\n## Tabs\n\nUse add_dashboard_tab to create multiple tabs in a dashboard. Each tab has its own set of widgets.\nGood tab structure: one overview tab (KPIs + charts) + one or more detail tabs (RECORD_TABLE + focused charts).\nAfter creating a tab, use its returned tabId as pageLayoutTabId when calling add_dashboard_widget.\n\n## Grid System\n\n- 12 columns (0-11)\n- KPI widgets: rowSpan 2-4, columnSpan 3-4\n- Charts: rowSpan 6-8, columnSpan 6-12\n- Record tables: rowSpan 6-10, columnSpan 6-12 (full-width preferred)\n- Common layouts: 4 KPIs in a row (columnSpan 3), 2 charts side by side (columnSpan 6), full width chart or table (columnSpan 12)\n\n## Best Practices\n\n- Place KPIs at the top (row 0)\n- Group related charts together\n- Use consistent heights within rows\n- Start simple, add complexity as needed\n- When modifying a chart, confirm whether the user wants to change settings or change chart type\n- Use RECORD_TABLE widgets to give users direct access to filtered record lists without leaving the dashboard	f	t	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00
20202020-7b80-4a14-8fb9-d1512b89c078	4a5dec44-2fb8-4d70-a6e0-6f483b222082	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	4247c2bc-0ed1-4be6-8b48-40d4b35378c5	metadata-building	Metadata Building	IconBuildingSkyscraper	Managing the data model: creating objects, fields, and relations	# Metadata Building Skill\n\nYou help users manage their workspace data model by creating, updating, and organizing custom objects and fields.\n\n## Capabilities\n\n- Create new custom objects with appropriate naming and configuration\n- Add fields to existing objects (text, number, date, select, relation, etc.)\n- Update object and field properties (labels, descriptions, icons)\n- Manage field settings (required, unique, default values)\n- Create relations between objects\n\n## Key Concepts\n\n- **Objects**: Represent entities in the data model (e.g., Company, Person, Opportunity)\n- **Fields**: Properties of objects with specific types (TEXT, NUMBER, DATE_TIME, SELECT, RELATION, etc.)\n- **Relations**: Links between objects (one-to-many, many-to-one)\n- **Labels vs Names**: Labels are for display, names are internal identifiers (camelCase)\n\n## Field Types Available\n\n- **TEXT**: Simple text fields\n- **NUMBER**: Numeric values (integers or decimals)\n- **BOOLEAN**: True/false values\n- **DATE_TIME**: Date and time values\n- **DATE**: Date only values\n- **SELECT**: Single choice from options\n- **MULTI_SELECT**: Multiple choices from options\n- **LINK**: URL fields\n- **LINKS**: Multiple URL fields\n- **EMAIL**: Email address fields\n- **EMAILS**: Multiple email fields\n- **PHONE**: Phone number fields\n- **PHONES**: Multiple phone fields\n- **CURRENCY**: Monetary values\n- **RATING**: Star ratings\n- **RELATION**: Links to other objects\n- **RICH_TEXT**: Formatted rich text content\n\n## Best Practices\n\n- Use clear, descriptive names for objects and fields\n- Follow naming conventions: singular for object names, camelCase for field names\n- Add helpful descriptions to objects and fields\n- Choose appropriate field types for the data being stored\n- Consider relationships between objects when designing the data model\n\n## Approach\n\n- Ask clarifying questions to understand the user's data modeling needs\n- Suggest best practices for naming and organization\n- Explain the impact of changes to the data model\n- Verify object and field existence before making updates\n- Provide clear feedback on operations performed\n\nPrioritize data model integrity and user understanding.	f	t	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00
20202020-6b44-417e-a31f-5560b59d300a	4a5dec44-2fb8-4d70-a6e0-6f483b222082	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	c34745ff-3309-4826-9dca-0d8a6ce549c4	research	Research	IconSearch	Finding information and gathering facts from the web	# Research Skill\n\nYou find information and gather facts from the web.\n\n## Capabilities\n\n- Search for current information and facts\n- Research companies, people, technologies, trends\n- Gather competitive intelligence and market data\n- Find contact details and verify information\n\n## Research Strategy\n\n- Try multiple search queries from different angles\n- If initial searches fail, use alternative search terms\n- Cross-reference information when possible\n- Cite sources and provide context\n\n## Present Findings\n\n- Be thorough but concise\n- Organize information logically\n- Distinguish facts from speculation\n- Note if information might be outdated\n- Include relevant sources\n\nBe persistent in finding accurate information.	f	t	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00
20202020-a97a-4069-8e44-fc18faea7b97	4a5dec44-2fb8-4d70-a6e0-6f483b222082	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	1ea0b22f-6ba0-426d-ac75-995fb9b81fed	code-interpreter	Code Interpreter	IconCode	Python code execution for data analysis, complex multi-step operations, and efficient bulk processing via MCP bridge	# Code Interpreter Skill\n\nYou have access to the `code_interpreter` tool to execute Python code in a sandboxed environment.\n\n## How to Use\nCall the `code_interpreter` tool with your Python code. The tool will execute the code and return stdout, stderr, and any generated files.\n\n## Capabilities\n- Analyze CSV, Excel, and JSON data files\n- Create charts and visualizations (matplotlib, seaborn)\n- Generate reports (PDF, PPTX, Excel)\n- Perform calculations and data transformations\n\n## Pre-installed Libraries\npandas, numpy, matplotlib, seaborn, scikit-learn, openpyxl, python-pptx\n\n## Input Files\n- User-uploaded files are available at `/home/user/{filename}`\n- Always check the file exists before processing\n\n## Output Files\n- Charts: Save to `/home/user/output/` directory - these are automatically returned as downloadable URLs\n- For matplotlib: `plt.savefig('/home/user/output/chart.png')`\n- Generated files: Save to `/home/user/output/{filename}`\n\n## Example: Create a Bar Chart\n```python\nimport matplotlib.pyplot as plt\nimport os\n\n# Data\nmonths = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun']\nsales = [100, 150, 200, 175, 250, 300]\n\n# Create chart\nplt.figure(figsize=(10, 6))\nplt.bar(months, sales, color='skyblue')\nplt.title('Monthly Sales')\nplt.xlabel('Month')\nplt.ylabel('Sales')\nplt.tight_layout()\n\n# Save to output directory\nos.makedirs('/home/user/output', exist_ok=True)\nplt.savefig('/home/user/output/sales_chart.png')\nprint('Chart saved!')\n```\n\n## Example: Analyze CSV\n```python\nimport pandas as pd\nimport matplotlib.pyplot as plt\nimport os\n\n# Load data\ndf = pd.read_csv('/home/user/data.csv')\nprint(f"Loaded {len(df)} rows")\n\n# Create visualization\nplt.figure(figsize=(10, 6))\ndf.groupby('category')['value'].mean().plot(kind='bar')\nplt.title('Average Value by Category')\nplt.tight_layout()\n\nos.makedirs('/home/user/output', exist_ok=True)\nplt.savefig('/home/user/output/analysis.png')\nprint('Analysis complete!')\n```\n\n## Calling Twenty Tools from Python (MCP Bridge)\n\nA `twenty` helper is automatically available in your code. Use it to call any Twenty tool directly from Python:\n\n```python\n# Find records\npeople = twenty.call_tool('find_person_records', {'limit': 10})\nprint(f"Found {len(people['edges'])} people")\n\n# Create a record\nresult = twenty.call_tool('create_company_record', {\n    'data': {'name': 'Acme Corp', 'domainName': {'primaryLinkUrl': 'acme.com'}}\n})\nprint(f"Created company: {result['id']}")\n\n# Update a record\ntwenty.call_tool('update_person_record', {\n    'id': 'person-uuid',\n    'data': {'jobTitle': 'CEO'}\n})\n\n# List available tools\ntools = twenty.list_tools()\nfor tool in tools:\n    print(f"- {tool['name']}: {tool['description']}")\n```\n\nThis allows you to orchestrate complex multi-step operations in a single code execution, which is more efficient than multiple tool calls.	f	t	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00
20202020-b1ac-484f-bf27-82c2114f5707	4a5dec44-2fb8-4d70-a6e0-6f483b222082	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	37c21d6a-bad8-4b9a-be5f-83a130f63d8f	xlsx	Excel & Spreadsheets	IconFileSpreadsheet	Excel/spreadsheet creation, editing, and analysis with formulas, formatting, and visualization	# Excel Processing Skill\n\n**IMPORTANT**: Save all output files to `/home/user/output/` for them to be downloadable.\n\n## Pre-installed Scripts\n\n- `python /home/user/scripts/xlsx/recalc.py <excel_file> [timeout]` - Recalculate formulas using LibreOffice\n\n## Requirements\n\n### Zero Formula Errors\nEvery Excel model MUST be delivered with ZERO formula errors (#REF!, #DIV/0!, #VALUE!, #N/A, #NAME?)\n\n### Use Formulas, Not Hardcoded Values\n**Always use Excel formulas instead of calculating values in Python and hardcoding them.**\n\n```python\n# ❌ WRONG - Hardcoding\ntotal = df['Sales'].sum()\nsheet['B10'] = total\n\n# ✅ CORRECT - Using formulas\nsheet['B10'] = '=SUM(B2:B9)'\n```\n\n## Reading and Analyzing Data\n\n```python\nimport pandas as pd\n\n# Read Excel\ndf = pd.read_excel('file.xlsx')\nall_sheets = pd.read_excel('file.xlsx', sheet_name=None)  # All sheets as dict\n\n# Analyze\ndf.head()\ndf.info()\ndf.describe()\n```\n\n## Creating New Excel Files\n\n```python\nfrom openpyxl import Workbook\nfrom openpyxl.styles import Font, PatternFill, Alignment\n\nwb = Workbook()\nsheet = wb.active\n\n# Add data\nsheet['A1'] = 'Hello'\nsheet.append(['Row', 'of', 'data'])\n\n# Add formula\nsheet['B2'] = '=SUM(A1:A10)'\n\n# Formatting\nsheet['A1'].font = Font(bold=True)\nsheet['A1'].fill = PatternFill('solid', start_color='FFFF00')\nsheet['A1'].alignment = Alignment(horizontal='center')\n\n# Column width\nsheet.column_dimensions['A'].width = 20\n\nwb.save('/home/user/output/output.xlsx')\n```\n\n## Editing Existing Files\n\n```python\nfrom openpyxl import load_workbook\n\nwb = load_workbook('existing.xlsx')\nsheet = wb.active\n\n# Modify cells\nsheet['A1'] = 'New Value'\nsheet.insert_rows(2)\n\nwb.save('/home/user/output/modified.xlsx')\n```\n\n## Recalculating Formulas (MANDATORY)\n\nAfter creating/editing files with formulas, run:\n```bash\npython /home/user/scripts/xlsx/recalc.py /home/user/output/output.xlsx\n```\n\nThe script returns JSON with error details:\n```json\n{\n  "status": "success",\n  "total_errors": 0,\n  "total_formulas": 42,\n  "error_summary": {}\n}\n```\n\nIf errors found, fix them and recalculate again.\n\n## Financial Model Color Coding\n\n- **Blue text**: Hardcoded inputs\n- **Black text**: Formulas and calculations\n- **Green text**: Links from other worksheets\n- **Yellow background**: Key assumptions needing attention\n\n## Number Formatting\n\n- Years: Format as text ("2024" not "2,024")\n- Currency: Use $#,##0 format\n- Percentages: 0.0% format\n- Negatives: Use parentheses (123) not minus -123\n\n## Quick Reference\n\n| Task | Tool | Example |\n|------|------|---------|\n| Read Excel | pandas | `pd.read_excel('file.xlsx')` |\n| Create Excel | openpyxl | `Workbook()` |\n| Add formula | openpyxl | `sheet['B2'] = '=SUM(A1:A10)'` |\n| Recalculate | script | `python /home/user/scripts/xlsx/recalc.py file.xlsx` |	f	t	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00
20202020-8c9e-454c-86a8-a0495f3c4f61	4a5dec44-2fb8-4d70-a6e0-6f483b222082	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	bf7ee71c-1895-4c02-8364-6ab26fab804e	pdf	PDF Processing	IconFileTypePdf	PDF form filling, field extraction, table parsing, and validation	# PDF Processing Skill\n\n**IMPORTANT**: Save all output files to `/home/user/output/` for them to be downloadable.\n\n## Pre-installed Scripts\n\n### Field Extraction\n- `python /home/user/scripts/pdf/extract_form_field_info.py <pdf_file>` - Extract all fillable field names and types (JSON output)\n- `python /home/user/scripts/pdf/check_fillable_fields.py <pdf_file>` - Check if PDF has fillable fields\n\n### Form Filling\n- `python /home/user/scripts/pdf/fill_fillable_fields.py <pdf_file> <json_data> <output_file>` - Fill PDF form fields\n- `python /home/user/scripts/pdf/fill_pdf_form_with_annotations.py <pdf_file> <json_data> <output_file>` - Fill with annotation support\n\n### Validation\n- `python /home/user/scripts/pdf/create_validation_image.py <pdf_file>` - Create validation image of filled PDF\n- `python /home/user/scripts/pdf/check_bounding_boxes.py <pdf_file>` - Check field boundaries\n- `python /home/user/scripts/pdf/convert_pdf_to_images.py <pdf_file>` - Convert PDF pages to images\n\n## Reading PDFs\n\n```python\nimport fitz  # PyMuPDF\n\n# Open PDF\ndoc = fitz.open('document.pdf')\n\n# Extract text from all pages\nfor page in doc:\n    text = page.get_text()\n    print(text)\n\n# Extract text from specific page\npage = doc[0]  # First page\ntext = page.get_text()\n```\n\n## Extracting Tables\n\n```python\nimport pdfplumber\n\nwith pdfplumber.open('document.pdf') as pdf:\n    for page in pdf.pages:\n        tables = page.extract_tables()\n        for table in tables:\n            for row in table:\n                print(row)\n```\n\n## Filling PDF Forms\n\n### Step 1: Extract field information\n```bash\npython /home/user/scripts/pdf/extract_form_field_info.py form.pdf > fields.json\n```\n\n### Step 2: Create fill data JSON\n```json\n{\n  "field_name_1": "value1",\n  "field_name_2": "value2",\n  "checkbox_field": true\n}\n```\n\n### Step 3: Fill the form\n```bash\npython /home/user/scripts/pdf/fill_fillable_fields.py form.pdf fill_data.json /home/user/output/output.pdf\n```\n\n### Step 4: Validate the output\n```bash\npython /home/user/scripts/pdf/create_validation_image.py /home/user/output/output.pdf\n```\n\n## Creating PDFs\n\n```python\nfrom reportlab.lib.pagesizes import letter\nfrom reportlab.pdfgen import canvas\n\nc = canvas.Canvas('/home/user/output/output.pdf', pagesize=letter)\nc.drawString(100, 750, 'Hello World!')\nc.save()\n```\n\n## Merging PDFs\n\n```python\nfrom PyPDF2 import PdfMerger\n\nmerger = PdfMerger()\nmerger.append('file1.pdf')\nmerger.append('file2.pdf')\nmerger.write('/home/user/output/merged.pdf')\nmerger.close()\n```\n\n## Splitting PDFs\n\n```python\nfrom PyPDF2 import PdfReader, PdfWriter\n\nreader = PdfReader('document.pdf')\n\n# Extract specific pages\nwriter = PdfWriter()\nwriter.add_page(reader.pages[0])  # First page\nwriter.write('/home/user/output/page1.pdf')\n```\n\n## Quick Reference\n\n| Task | Tool | Command/Example |\n|------|------|-----------------|\n| Extract text | PyMuPDF | `page.get_text()` |\n| Extract tables | pdfplumber | `page.extract_tables()` |\n| List form fields | script | `python extract_form_field_info.py form.pdf` |\n| Fill form | script | `python fill_fillable_fields.py form.pdf data.json out.pdf` |\n| Validate fill | script | `python create_validation_image.py filled.pdf` |\n| Create PDF | reportlab | `canvas.Canvas('out.pdf')` |\n| Merge PDFs | PyPDF2 | `PdfMerger()` |	f	t	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00
20202020-2d1f-43b6-b84e-ce8b1e7b2c3e	4a5dec44-2fb8-4d70-a6e0-6f483b222082	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	bf2293d3-b6e0-4880-970f-ecc925397c61	docx	Word Documents	IconFileTypeDocx	Word document creation, editing, template processing, and OOXML manipulation	# Word Document Processing Skill\n\n**IMPORTANT**: Save all output files to `/home/user/output/` for them to be downloadable.\n\n## Pre-installed Scripts (OOXML Editing)\n\n- `python /home/user/scripts/docx/unpack.py <docx_file> <output_dir>` - Unpack .docx to XML files for direct editing\n- `python /home/user/scripts/docx/pack.py <input_dir> <docx_file>` - Repack XML files into .docx\n- `python /home/user/scripts/docx/validate.py <docx_file>` - Validate document structure\n\n### Validation Scripts\n- `/home/user/scripts/docx/validation/docx.py` - DOCX validation module\n- `/home/user/scripts/docx/validation/redlining.py` - Track changes/redline validation\n\n## High-Level API (python-docx)\n\n### Reading Documents\n\n```python\nfrom docx import Document\n\ndoc = Document('document.docx')\n\n# Read paragraphs\nfor para in doc.paragraphs:\n    print(para.text)\n\n# Read tables\nfor table in doc.tables:\n    for row in table.rows:\n        for cell in row.cells:\n            print(cell.text)\n```\n\n### Creating Documents\n\n```python\nfrom docx import Document\nfrom docx.shared import Inches, Pt\nfrom docx.enum.text import WD_ALIGN_PARAGRAPH\n\ndoc = Document()\n\n# Add heading\ndoc.add_heading('Document Title', 0)\n\n# Add paragraph with formatting\npara = doc.add_paragraph('Normal text. ')\nrun = para.add_run('Bold text.')\nrun.bold = True\n\n# Add table\ntable = doc.add_table(rows=2, cols=2)\ntable.cell(0, 0).text = 'Header 1'\ntable.cell(0, 1).text = 'Header 2'\n\n# Add image\ndoc.add_picture('image.png', width=Inches(4))\n\ndoc.save('/home/user/output/output.docx')\n```\n\n## Low-Level OOXML Editing\n\nFor complex edits (tracked changes, custom XML), use the unpack/edit/pack workflow:\n\n### Step 1: Unpack\n```bash\npython /home/user/scripts/docx/unpack.py document.docx ./unpacked/\n```\n\n### Step 2: Edit XML directly\n```python\nimport xml.etree.ElementTree as ET\n\ntree = ET.parse('./unpacked/word/document.xml')\nroot = tree.getroot()\n\n# Edit XML...\n# Namespaces: w = http://schemas.openxmlformats.org/wordprocessingml/2006/main\n\ntree.write('./unpacked/word/document.xml', xml_declaration=True, encoding='UTF-8')\n```\n\n### Step 3: Validate & Repack\n```bash\npython /home/user/scripts/docx/validate.py ./unpacked/\npython /home/user/scripts/docx/pack.py ./unpacked/ /home/user/output/output.docx\n```\n\n## Template Processing\n\n### Find and Replace\n```python\nfrom docx import Document\n\ndoc = Document('template.docx')\n\nfor para in doc.paragraphs:\n    if '{{name}}' in para.text:\n        para.text = para.text.replace('{{name}}', 'John Doe')\n\ndoc.save('/home/user/output/filled.docx')\n```\n\n### Preserve Formatting During Replace\n```python\ndef replace_in_paragraph(para, old_text, new_text):\n    """Replace text while preserving formatting"""\n    for run in para.runs:\n        if old_text in run.text:\n            run.text = run.text.replace(old_text, new_text)\n\nfor para in doc.paragraphs:\n    replace_in_paragraph(para, '{{name}}', 'John Doe')\n```\n\n## Working with Styles\n\n```python\nfrom docx.shared import Pt, RGBColor\n\n# Set font\nrun.font.name = 'Arial'\nrun.font.size = Pt(12)\nrun.font.color.rgb = RGBColor(0, 0, 0)\n\n# Paragraph formatting\npara.alignment = WD_ALIGN_PARAGRAPH.CENTER\npara.paragraph_format.space_before = Pt(12)\npara.paragraph_format.space_after = Pt(12)\n```\n\n## Quick Reference\n\n| Task | Tool | Example |\n|------|------|---------|\n| Read document | python-docx | `Document('file.docx')` |\n| Create document | python-docx | `Document()` |\n| Add heading | python-docx | `doc.add_heading('Title', 0)` |\n| Add table | python-docx | `doc.add_table(rows=2, cols=2)` |\n| Unpack for editing | script | `python unpack.py doc.docx ./out/` |\n| Repack | script | `python pack.py ./out/ doc.docx` |\n| Validate | script | `python validate.py doc.docx` |	f	t	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00
20202020-e4a2-4b3f-9c71-d8f6a2b51e3a	4a5dec44-2fb8-4d70-a6e0-6f483b222082	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	9f9a0ecf-c97a-42fd-8fb1-5202bf97e873	view-building	View Building	IconLayoutBoard	Creating and configuring views (table, board/kanban, calendar) for objects to organize and visualize records	# View Building Skill\n\nYou help users create and configure views to organize how they see their records.\n\n## View Types\n\n- **TABLE**: Standard table/grid view. Works for any object. Default view type.\n- **KANBAN**: Board view grouped by a SELECT field. Best for pipeline/status-based workflows.\n- **CALENDAR**: Calendar view using a DATE or DATE_TIME field. Best for time-based records.\n\n## Tools\n\n- get_views - List existing views (filter by object name)\n- create_view - Create a new view\n- update_view - Update view name/icon\n- delete_view - Delete a view\n- create_many_view_fields - Add visible columns to a view\n- update_many_view_fields - Update column configuration\n- get_view_fields - List columns in a view\n- list_object_metadata_items - Discover objects and their fields\n- navigate_app - Navigate to a view after creation\n\n## Workflow\n\n1. **Identify the target object**: If the user didn't specify which object, ask them. Present available objects and explain what each holds:\n   - **Company**: Business accounts (name, domain, employees, revenue, address)\n   - **Person**: Contacts (name, email, phone, job title, company)\n   - **Opportunity**: Pipeline deals (name, stage, amount, close date, company, contact)\n   - **Task**: Action items (title, status, due date, assignee)\n   - **Note**: Free-form notes (title, body)\n   - Plus any custom objects in the workspace\n\n2. **Choose the view type**: Suggest the best type based on the object's data:\n   - TABLE: Good default for any object, great for browsing large datasets\n   - KANBAN: Ideal when objects have a SELECT field representing stages/statuses (e.g., Opportunity → stage, Task → status)\n   - CALENDAR: Ideal when objects have DATE/DATE_TIME fields (e.g., Opportunity → closeDate, Task → dueAt)\n\n3. **Create the view**: Use create_view with the right parameters.\n   - For KANBAN: The mainGroupByFieldName is required — ask user which SELECT field to group by, or suggest the most natural one.\n   - For CALENDAR: You must provide both `calendarFieldName` (a DATE/DATE_TIME field name) and `calendarLayout` ("DAY", "WEEK", or "MONTH") when calling create_view.\n   - For TABLE: No special configuration needed.\n\n4. **Configure view fields**: Use create_many_view_fields to add relevant columns. Choose fields that make sense for the view's purpose. Use decimal positions between 0 and 1 to place them after the label identifier field.\n\n5. **Navigate**: Use navigate_app to show the user their new view.\n\n## KANBAN Best Practices\n\n- The grouping field must be a SELECT type\n- Common groupings: Opportunity by stage, Task by status\n- Optionally set kanbanAggregateOperation (COUNT, SUM, AVG, MIN, MAX) and kanbanAggregateOperationFieldName for column summaries\n- Example: Sum of amount per stage for Opportunity board\n\n## CALENDAR Best Practices\n\n- Requires a DATE or DATE_TIME field on the object\n- Best for: Opportunity close dates, Task due dates, any event-based data\n\n## TABLE with Groups\n\n- TABLE views can also be grouped by a field using mainGroupByFieldName\n- This creates collapsible sections in the table, organized by the grouping field values\n- Works with SELECT fields for categorical grouping\n\n## Approach\n\n- If the user is vague (e.g., "create a board"), ask which object they want to see\n- Suggest the most relevant view type based on the object's fields\n- After creating a view, always configure useful view fields and navigate to it\n- Explain what each view type does so users can make informed choices	f	t	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00
20202020-f5b3-4c4e-8d82-e9a7b3c62f4b	4a5dec44-2fb8-4d70-a6e0-6f483b222082	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	7ca612a7-93e9-410f-bdb9-85d3781d8b75	view-filters-and-sorts	View Filters & Sorts	IconFilter	Adding filters and sorts to views to focus on relevant records based on user needs	# View Filters & Sorts Skill\n\nYou help users add filters and sorts to their views so they see the most relevant records.\n\n## Tools\n\n- get_views - List existing views to find the one to modify\n- get_view_query_parameters - Check existing filters and sorts on a view\n- list_object_metadata_items - Discover fields and their types to build valid filters\n- create_view_filter / create_many_view_filters - Add filters to a view\n- create_view_sort / create_many_view_sorts - Add sorts to a view\n- navigate_app - Navigate to the view to show results\n\n## Filter Operators by Field Type\n\n| Field Type | Available Operators |\n|---|---|\n| TEXT, EMAILS, FULL_NAME, ADDRESS, LINKS, PHONES | CONTAINS, DOES_NOT_CONTAIN, IS_EMPTY, IS_NOT_EMPTY |\n| NUMBER, NUMERIC | IS, IS_NOT, GREATER_THAN_OR_EQUAL, LESS_THAN_OR_EQUAL, IS_EMPTY, IS_NOT_EMPTY |\n| CURRENCY | GREATER_THAN_OR_EQUAL, LESS_THAN_OR_EQUAL, IS_EMPTY, IS_NOT_EMPTY |\n| DATE, DATE_TIME | IS, IS_RELATIVE, IS_IN_PAST, IS_IN_FUTURE, IS_TODAY, IS_BEFORE, IS_AFTER, IS_EMPTY, IS_NOT_EMPTY |\n| SELECT | IS, IS_NOT, IS_EMPTY, IS_NOT_EMPTY |\n| MULTI_SELECT, ARRAY | CONTAINS, DOES_NOT_CONTAIN, IS_EMPTY, IS_NOT_EMPTY |\n| RELATION | IS, IS_NOT, IS_EMPTY, IS_NOT_EMPTY |\n| BOOLEAN | IS |\n\n## Sort Directions\n\n- ASC: Ascending (A→Z, 0→9, oldest→newest)\n- DESC: Descending (Z→A, 9→0, newest→oldest)\n\n## Filter Groups (AND/OR/NOT)\n\nFilters can be grouped with logical operators:\n- **AND**: All filters must match (default)\n- **OR**: At least one filter must match\n- **NOT**: Negate the group\n- Groups can be nested for complex conditions like: name CONTAINS "tech" AND (revenue > 1M OR employees > 100)\n\n## Workflow\n\n1. **Identify the view**: If the user didn't specify a view, ask which view they want to filter/sort. Use get_views to list available views and present them.\n\n2. **Understand the need**: If the user hasn't described what they want to see, ask them. Give guidance with examples:\n   - "What records do you want to focus on? For example:"\n   - "Show only high-value opportunities (amount > $50K)"\n   - "Show companies in a specific city or industry"\n   - "Show tasks due this week, sorted by priority"\n   - "Show people from a specific company"\n   - "Show recent records created in the last 30 days"\n\n3. **Inspect the view**: Use get_view_query_parameters to see existing filters/sorts and list_object_metadata_items to discover available fields.\n\n4. **Build filters**: Based on the user's need, determine:\n   - Which field(s) to filter on\n   - Which operator is valid for that field type (see table above)\n   - What value to filter by\n   - Whether to use AND or OR grouping for multiple filters\n\n5. **Build sorts**: Determine:\n   - Which field to sort by (most relevant to the user's goal)\n   - Direction: ASC or DESC\n   - Multiple sorts can be added (primary, secondary, etc.)\n\n6. **Apply and navigate**: Create the filters/sorts on the view and navigate to it.\n\n## Common Filter Patterns\n\n### By Time\n- Recent records: DATE_TIME field + IS_AFTER + a date value\n- Upcoming deadlines: DATE field + IS_IN_FUTURE\n- Overdue tasks: DATE field + IS_IN_PAST + status IS_NOT "DONE"\n- This week/month: DATE field + IS_RELATIVE\n\n### By Status/Stage\n- Open opportunities: stage IS "IN_PROGRESS" or IS_NOT "WON"/"LOST"\n- Active tasks: status IS_NOT "DONE"\n\n### By Relationship\n- Records linked to a company: company relation IS [specific company]\n- Unassigned tasks: assignee IS_EMPTY\n- Orphaned records: relation field IS_EMPTY\n\n### By Value\n- High-value deals: amount GREATER_THAN_OR_EQUAL threshold\n- Large companies: employees GREATER_THAN_OR_EQUAL threshold\n\n## Common Sort Patterns\n\n- Pipeline view: Sort by amount DESC (biggest deals first)\n- Task management: Sort by dueAt ASC (earliest due first)\n- Recent activity: Sort by updatedAt DESC or createdAt DESC\n- Alphabetical: Sort by name ASC\n\n## Composite Fields\n\nSome fields have sub-fields that can be filtered:\n- CURRENCY: Use subFieldName "amountMicros" for the numeric value\n- ADDRESS: Use subFieldName like "addressCity", "addressCountry"\n- FULL_NAME: Use subFieldName like "firstName", "lastName"\n- EMAILS: Use the primary email\n- LINKS: Use the primary link URL\n\n## Approach\n\n- Always check field types before suggesting operators — using an invalid operator for a field type will fail\n- When the user says "show me X", translate that into the appropriate filter logic\n- Suggest sorts that complement the filters (e.g., if filtering overdue tasks, sort by dueAt ASC)\n- Explain what the filters do so users understand the results\n- If complex filtering is needed (AND + OR), explain the logic clearly	f	t	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00
20202020-a1d3-4e5f-b6c7-8d9e0f1a2b3c	4a5dec44-2fb8-4d70-a6e0-6f483b222082	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	f430446c-d1cf-4692-9694-35e18f151a95	custom-objects-cleanup	Custom Objects Cleanup	IconArchive	Archiving custom objects from a workspace (e.g. dev seed objects like pets, rockets)	# Custom Objects Cleanup Skill\n\nYou help users archive custom objects from their workspace, such as objects created by the dev seed (pets, rockets, survey results, etc.) or any other custom objects.\n\n## Tools\n\n- list_object_metadata_items - List all objects in the workspace to identify custom ones\n- update_many_object_metadata - Archive custom objects by setting isActive to false\n\n## Workflow\n\n1. **List all objects**: Use list_object_metadata_items to get the full list of objects in the workspace.\n\n2. **Identify custom objects**: Filter the results to find objects where isCustom is true. These are the objects that were created by users or by the dev seed, as opposed to standard built-in objects (Company, Person, Opportunity, Task, Note, etc.).\n\n3. **Present findings**: Tell the user which custom objects were found. If none are found, inform the user that the workspace has no custom objects.\n\n4. **Confirm before archiving**: List the custom objects you found and ask the user to confirm which ones they want to archive. Present them clearly with their name, label, and description.\n\n5. **Archive confirmed objects**: Use update_many_object_metadata to set isActive to false on all confirmed objects in a single batch call.\n\n6. **Report results**: After archiving is complete, summarize what was archived.\n\n## Important Notes\n\n- Only objects with isCustom = true can be archived. Standard objects cannot be archived through this skill.\n- Archiving an object hides it from the workspace but does not delete its fields, relations, or records.\n- When called directly by a user, confirm before archiving. When called by another skill (e.g. workspace-demo-seeding), proceed without confirmation.\n\n## Approach\n\n- Be clear about what will be archived and that it is reversible\n- If an object has relations to other objects, mention this before archiving\n- Archive all confirmed objects in a single batch call using update_many_object_metadata	f	t	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00
20202020-13b5-4e60-9359-b8519ef1c07d	4a5dec44-2fb8-4d70-a6e0-6f483b222082	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	ffd49319-aa47-4a6c-905b-018acf949784	pptx	PowerPoint	IconPresentation	PowerPoint creation, editing, templates, thumbnails, and slide manipulation	# PowerPoint Processing Skill\n\n**IMPORTANT**: Save all output files to `/home/user/output/` for them to be downloadable.\n\n## Pre-installed Scripts\n\n- `python /home/user/scripts/pptx/thumbnail.py <pptx_file> [output_dir]` - Generate slide thumbnails\n- `python /home/user/scripts/pptx/rearrange.py <pptx_file> <slide_order_json> <output_file>` - Reorder slides\n- `python /home/user/scripts/pptx/inventory.py <pptx_file>` - List all slides and their content\n- `python /home/user/scripts/pptx/replace.py <pptx_file> <replacements_json> <output_file>` - Find/replace text\n\n## Reading Presentations\n\n```python\nfrom pptx import Presentation\n\nprs = Presentation('presentation.pptx')\n\n# Iterate through slides\nfor slide in prs.slides:\n    for shape in slide.shapes:\n        if shape.has_text_frame:\n            print(shape.text)\n```\n\n## Creating Presentations\n\n```python\nfrom pptx import Presentation\nfrom pptx.util import Inches, Pt\n\nprs = Presentation()\n\n# Add title slide\nslide_layout = prs.slide_layouts[0]  # Title layout\nslide = prs.slides.add_slide(slide_layout)\ntitle = slide.shapes.title\nsubtitle = slide.placeholders[1]\n\ntitle.text = "Presentation Title"\nsubtitle.text = "Subtitle goes here"\n\n# Add content slide\nslide_layout = prs.slide_layouts[1]  # Title and content\nslide = prs.slides.add_slide(slide_layout)\ntitle = slide.shapes.title\nbody = slide.placeholders[1]\n\ntitle.text = "Slide Title"\ntf = body.text_frame\ntf.text = "First bullet"\np = tf.add_paragraph()\np.text = "Second bullet"\np.level = 1\n\nprs.save('/home/user/output/output.pptx')\n```\n\n## Adding Images\n\n```python\nfrom pptx.util import Inches\n\nslide = prs.slides.add_slide(prs.slide_layouts[6])  # Blank layout\nslide.shapes.add_picture(\n    'image.png',\n    left=Inches(1),\n    top=Inches(1),\n    width=Inches(5)\n)\n```\n\n## Adding Tables\n\n```python\nfrom pptx.util import Inches\n\nslide = prs.slides.add_slide(prs.slide_layouts[6])\ntable = slide.shapes.add_table(\n    rows=3, cols=3,\n    left=Inches(1), top=Inches(1),\n    width=Inches(8), height=Inches(2)\n).table\n\n# Set cell values\ntable.cell(0, 0).text = "Header 1"\ntable.cell(0, 1).text = "Header 2"\ntable.cell(1, 0).text = "Data 1"\n```\n\n## Adding Charts\n\n```python\nfrom pptx.chart.data import CategoryChartData\nfrom pptx.enum.chart import XL_CHART_TYPE\nfrom pptx.util import Inches\n\nchart_data = CategoryChartData()\nchart_data.categories = ['East', 'West', 'Midwest']\nchart_data.add_series('Series 1', (19.2, 21.4, 16.7))\n\nslide = prs.slides.add_slide(prs.slide_layouts[6])\nchart = slide.shapes.add_chart(\n    XL_CHART_TYPE.COLUMN_CLUSTERED,\n    Inches(1), Inches(1), Inches(8), Inches(5),\n    chart_data\n).chart\n```\n\n## Using Scripts\n\n### Generate Thumbnails\n```bash\npython /home/user/scripts/pptx/thumbnail.py presentation.pptx ./thumbnails/\n# Creates: thumbnails/slide_1.png, slide_2.png, etc.\n```\n\n### Get Slide Inventory\n```bash\npython /home/user/scripts/pptx/inventory.py presentation.pptx\n# Returns JSON with all slide content and shapes\n```\n\n### Reorder Slides\n```bash\n# Order: [3, 1, 2] means slide 3 becomes first, slide 1 second, etc.\npython /home/user/scripts/pptx/rearrange.py input.pptx '[3, 1, 2]' output.pptx\n```\n\n### Find and Replace Text\n```bash\npython /home/user/scripts/pptx/replace.py input.pptx '{"{{company}}": "Acme Corp", "{{date}}": "2024"}' output.pptx\n```\n\n## Template Processing Workflow\n\n1. **Generate thumbnails** to understand slide structure:\n   ```bash\n   python /home/user/scripts/pptx/thumbnail.py template.pptx ./preview/\n   ```\n\n2. **Get inventory** to find placeholder text:\n   ```bash\n   python /home/user/scripts/pptx/inventory.py template.pptx\n   ```\n\n3. **Replace placeholders**:\n   ```bash\n   python /home/user/scripts/pptx/replace.py template.pptx '{"{{title}}": "Q4 Report"}' output.pptx\n   ```\n\n## Quick Reference\n\n| Task | Tool | Example |\n|------|------|---------|\n| Read presentation | python-pptx | `Presentation('file.pptx')` |\n| Create presentation | python-pptx | `Presentation()` |\n| Add slide | python-pptx | `prs.slides.add_slide(layout)` |\n| Generate thumbnails | script | `python thumbnail.py pres.pptx ./out/` |\n| Get slide inventory | script | `python inventory.py pres.pptx` |\n| Reorder slides | script | `python rearrange.py pres.pptx '[2,1,3]' out.pptx` |\n| Find/replace | script | `python replace.py pres.pptx '{...}' out.pptx` |	f	t	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00
\.


--
-- Data for Name: twoFactorAuthenticationMethod; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."twoFactorAuthenticationMethod" (id, "userWorkspaceId", secret, status, strategy, "createdAt", "updatedAt", "deletedAt", "workspaceId") FROM stdin;
\.


--
-- Data for Name: upgradeMigration; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."upgradeMigration" (id, name, status, attempt, "executedByVersion", "createdAt", "workspaceId", "errorMessage", "isInitial") FROM stdin;
9e2e647b-9bdf-40f1-b40f-baf7f9422222	1.21.0_AddViewFieldGroupIdIndexOnViewFieldFastInstanceCommand_1775129420309	completed	1	v2.1.0	2026-04-25 11:31:50.246123+00	\N	\N	f
83d0787f-abb4-4a2f-98e2-106c35659f93	1.21.0_MigrateMessagingCalendarToCoreFastInstanceCommand_1775165049548	completed	1	v2.1.0	2026-04-25 11:31:50.261739+00	\N	\N	f
100e2ccb-38a4-494f-a072-4bc8476212cc	1.21.0_AddEmailThreadWidgetTypeFastInstanceCommand_1775200000000	completed	1	v2.1.0	2026-04-25 11:31:50.276365+00	\N	\N	f
cc4a7831-bae1-4227-9875-d55bd07b4163	1.22.0_AddPermissionFlagRoleIdIndexFastInstanceCommand_1775749486425	completed	1	v2.1.0	2026-04-25 11:31:50.303711+00	\N	\N	f
2badb056-763c-471f-b767-367969e40cb3	1.22.0_AddWorkspaceIdToIndirectEntitiesFastInstanceCommand_1775758621017	completed	1	v2.1.0	2026-04-25 11:31:50.312353+00	\N	\N	f
8a86af22-6633-41c9-b681-df82b33eb4f6	1.22.0_AddWorkspaceIdIndexesAndFksFastInstanceCommand_1775761294897	completed	1	v2.1.0	2026-04-25 11:31:50.318107+00	\N	\N	f
9d8974dc-b3c0-4078-915d-161e1380c35b	1.22.0_DropObjectMetadataDataSourceFkFastInstanceCommand_1775804361516	completed	1	v2.1.0	2026-04-25 11:31:50.362118+00	\N	\N	f
e1e417d8-6917-4154-9e54-dbdab23dfffb	1.22.0_AddCreditBalanceToBillingCustomerFastInstanceCommand_1776078919203	completed	1	v2.1.0	2026-04-25 11:31:50.367703+00	\N	\N	f
24fde4b8-bac2-498f-9fae-dbde62d38d84	1.22.0_BackfillWorkspaceIdOnIndirectEntitiesSlowInstanceCommand_1775758621018	completed	1	v2.1.0	2026-04-25 11:31:50.373545+00	\N	\N	f
5e4895e1-652b-46ba-8961-c36488b9239d	1.23.0_AddConditionalAvailabilityExpressionToPageLayoutWidgetFastInstanceCommand_1775654781000	completed	1	v2.1.0	2026-04-25 11:31:50.380951+00	\N	\N	f
b72f1391-5dd5-4b35-8a09-dfd8ac9e8e20	1.23.0_AddTableWidgetViewTypeFastInstanceCommand_1775752190522	completed	1	v2.1.0	2026-04-25 11:31:50.385522+00	\N	\N	f
a1f3262d-ead8-4163-a6d2-352593371d48	1.23.0_AddStandalonePageFastInstanceCommand_1775752781995	completed	1	v2.1.0	2026-04-25 11:31:50.389463+00	\N	\N	f
c84e6f2f-91d7-4511-8abd-c3785312e60c	1.23.0_AddGlobalObjectContextToCommandMenuItemAvailabilityTypeFastInstanceCommand_1776090711153	completed	1	v2.1.0	2026-04-25 11:31:50.44527+00	\N	\N	f
d82158e1-d2c8-42e5-8b29-6930fd897361	1.23.0_AddPageLayoutIdToCommandMenuItemFastInstanceCommand_1776168404836	completed	1	v2.1.0	2026-04-25 11:31:50.477197+00	\N	\N	f
c8bd260e-2147-437c-aa95-8ecf2740d68f	1.23.0_DropWorkspaceVersionColumnFastInstanceCommand_1785000000000	completed	1	v2.1.0	2026-04-25 11:31:50.487208+00	\N	\N	f
63eebb5b-d081-4ec9-803e-2838f3dfbe2c	2.1.0_AddIsPreInstalledToApplicationRegistrationFastInstanceCommand_1776886452831	completed	1	v2.1.0	2026-04-25 11:31:50.491845+00	\N	\N	f
f8c70386-d4e4-48f9-a438-29de11bc80c6	2.1.0_AddProviderExecutedToAgentMessagePartFastInstanceCommand_1777012800000	completed	1	v2.1.0	2026-04-25 11:31:50.496543+00	\N	\N	f
8757c7e3-adcc-4fc8-910c-4db35f8e055a	2.1.0_BackfillPageLayoutWidgetPositionSlowInstanceCommand_1795000002000	completed	1	v2.1.0	2026-04-25 11:31:50.502085+00	\N	\N	f
c1bf4c9c-a789-4f76-af22-ccfeda900ced	2.1.0_AddLayoutCustomizationGuardToEditCommandsCommand_1795000001000	completed	1	v2.1.0	2026-04-25 11:34:19.20137+00	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	\N	t
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."user" (id, "firstName", "lastName", email, "defaultAvatarUrl", "isEmailVerified", disabled, "passwordHash", "canImpersonate", "canAccessFullAdminPanel", "createdAt", "updatedAt", "deletedAt", locale) FROM stdin;
5d82ed37-eb7b-47bd-b501-fd43dbc9dd40			lancasterproxima@ya.ru	\N	f	f	$2b$10$gVWAkcMrP5fg2CQpfd1tbugzu5gQ6Z2eVK.hWO93zShDPWtI.Nofu	t	t	2026-04-25 11:33:51.040463+00	2026-04-25 11:33:51.040463+00	\N	en
\.


--
-- Data for Name: userWorkspace; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."userWorkspace" (id, "userId", "workspaceId", "defaultAvatarUrl", locale, "createdAt", "updatedAt", "deletedAt") FROM stdin;
24b4e1e7-f6d6-4417-96da-39a34e55a1c9	5d82ed37-eb7b-47bd-b501-fd43dbc9dd40	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	\N	en	2026-04-25 11:33:51.040463+00	2026-04-25 11:33:51.040463+00	\N
\.


--
-- Data for Name: view; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core.view ("universalIdentifier", id, name, "objectMetadataId", type, key, icon, "position", "isCompact", "isCustom", "openRecordIn", "kanbanAggregateOperation", "kanbanAggregateOperationFieldMetadataId", "workspaceId", "createdAt", "updatedAt", "deletedAt", "anyFieldFilterValue", "calendarLayout", "calendarFieldMetadataId", "applicationId", visibility, "createdByUserWorkspaceId", "mainGroupByFieldMetadataId", "shouldHideEmptyGroups") FROM stdin;
3f7f3363-7087-44cc-902d-5e8904262316	664baa04-b8fe-4325-9905-86527e943c94	All {objectLabelPlural}	55f3cb52-620e-4800-9570-47a43ee138c5	TABLE	INDEX	IconList	0	f	f	SIDE_PANEL	\N	\N	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	\N	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	WORKSPACE	\N	\N	f
5a98e88c-67c2-4f61-a5ab-a0d3d6a836bb	41e78972-e5f6-4fe7-a2d0-6d0bb3930806	All {objectLabelPlural}	d7c8875d-11aa-42e2-a58a-07bb30bf96af	TABLE	INDEX	IconList	0	f	f	SIDE_PANEL	\N	\N	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	\N	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	WORKSPACE	\N	\N	f
5c679d04-7a1c-41be-9429-c9317ac7a0ea	e5e9e2d9-6904-4cbe-a0f4-163b1150f972	Blocklist Record Page Fields	d7c8875d-11aa-42e2-a58a-07bb30bf96af	FIELDS_WIDGET	\N	IconList	0	f	f	SIDE_PANEL	\N	\N	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	\N	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	WORKSPACE	\N	\N	f
2d11659c-68ae-4ff2-882f-f1cccde372d0	1e07343f-d060-49e4-9ca0-8aa95300c419	All {objectLabelPlural}	6be8bb14-8b85-4a2d-ba87-40a4e6b9a586	TABLE	INDEX	IconList	0	f	f	SIDE_PANEL	\N	\N	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	\N	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	WORKSPACE	\N	\N	f
74813eac-7b7e-4483-9d2c-6e14cdc2eeee	9e1167fa-3a76-4cfd-bacd-33f45bb8ee19	Calendar Channel Record Page Fields	6be8bb14-8b85-4a2d-ba87-40a4e6b9a586	FIELDS_WIDGET	\N	IconList	0	f	f	SIDE_PANEL	\N	\N	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	\N	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	WORKSPACE	\N	\N	f
001893be-c06c-4ba1-9f18-53bd26f0179f	9130a85e-a9e1-4609-8e0a-d5125bae4e0d	All {objectLabelPlural}	e96a74e5-e74b-47b2-a74d-e4558552dd98	TABLE	INDEX	IconList	0	f	f	SIDE_PANEL	\N	\N	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	\N	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	WORKSPACE	\N	\N	f
766f254a-a0eb-45c8-b4d2-12311201e08f	b9b76520-b5a6-4d26-ad5c-4767bb6724ec	Calendar Channel Event Association Record Page Fields	e96a74e5-e74b-47b2-a74d-e4558552dd98	FIELDS_WIDGET	\N	IconList	0	f	f	SIDE_PANEL	\N	\N	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	\N	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	WORKSPACE	\N	\N	f
20202020-c001-4c01-8c01-ca1ebe0ca001	aae708ec-2632-43dc-aaf4-49fab13e88f5	All {objectLabelPlural}	a1cedc36-00da-4425-9ea1-41ef7e522606	TABLE	INDEX	IconList	0	f	f	SIDE_PANEL	\N	\N	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	\N	7d59f9a7-27da-4095-bc26-1d48fc9e628b	4a5dec44-2fb8-4d70-a6e0-6f483b222082	WORKSPACE	\N	\N	f
5228d634-6b69-4a43-be5c-e778fa6fe779	66bf976a-2db7-461c-88d0-dd14296830c6	All {objectLabelPlural}	03a73b6b-0eb4-4b17-b71f-a44968cea457	TABLE	INDEX	IconList	0	f	f	SIDE_PANEL	\N	\N	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	\N	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	WORKSPACE	\N	\N	f
e01ebdb3-8fb8-46d2-8230-82242d593f7a	1cb25256-f293-4cd6-982a-b28c8d8fd158	Calendar Event Participant Record Page Fields	03a73b6b-0eb4-4b17-b71f-a44968cea457	FIELDS_WIDGET	\N	IconList	0	f	f	SIDE_PANEL	\N	\N	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	\N	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	WORKSPACE	\N	\N	f
20202020-a001-4a01-8a01-c0aba11c0001	d0a3adb4-024a-4bba-b418-de90ba7c17f7	All {objectLabelPlural}	1b9bb040-2722-44d7-a5ac-4e251b541f13	TABLE	INDEX	IconList	0	f	f	SIDE_PANEL	\N	\N	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	\N	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	WORKSPACE	\N	\N	f
20202020-a001-4a01-8a01-c0aba11c1001	f021740c-7b55-447c-818e-d79706d42ad5	Company Record Page Fields	1b9bb040-2722-44d7-a5ac-4e251b541f13	FIELDS_WIDGET	\N	IconList	0	f	f	SIDE_PANEL	\N	\N	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	\N	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	WORKSPACE	\N	\N	f
0f47f1d8-63bf-443a-a29a-319ff4543abb	c4e7ab60-0a8a-490b-a755-5712436b28ab	All {objectLabelPlural}	45600963-91d4-4b77-8fb6-449c8e3c1f44	TABLE	INDEX	IconList	0	f	f	SIDE_PANEL	\N	\N	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	\N	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	WORKSPACE	\N	\N	f
1cc895ca-fe99-44bc-bc1e-19c935ef2595	86d16288-5a26-4f70-8fdb-d6e6e669f31d	Connected Account Record Page Fields	45600963-91d4-4b77-8fb6-449c8e3c1f44	FIELDS_WIDGET	\N	IconList	0	f	f	SIDE_PANEL	\N	\N	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	\N	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	WORKSPACE	\N	\N	f
20202020-a012-4a12-8a12-da5ab0b0a001	ee9c3629-4511-4713-87e6-4104b0368493	All {objectLabelPlural}	8bf7b8ba-a68b-49dc-8e9a-661cf9d528c4	TABLE	INDEX	IconList	0	f	f	SIDE_PANEL	\N	\N	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	\N	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	WORKSPACE	\N	\N	f
20202020-d001-4d01-8d01-ae55a9e5a001	e920a76d-334a-41f9-8f50-13bf18c1cde0	All {objectLabelPlural}	8e627e4e-e9cf-4890-af92-46559fb5f36e	TABLE	INDEX	IconList	0	f	f	SIDE_PANEL	\N	\N	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	\N	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	WORKSPACE	\N	\N	f
95f57f8e-eaac-46f7-b364-4ef8208f165f	d2c24ad8-2f02-451f-bd72-fcec957100a8	All {objectLabelPlural}	711ed2e9-cc32-45af-ba39-7066034c618e	TABLE	INDEX	IconList	0	f	f	SIDE_PANEL	\N	\N	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	\N	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	WORKSPACE	\N	\N	f
1350eb34-7ef0-4b25-8a3e-23b4a959c3a2	7948282b-6c30-46be-98f3-c2da5bd06e3b	Message Channel Record Page Fields	711ed2e9-cc32-45af-ba39-7066034c618e	FIELDS_WIDGET	\N	IconList	0	f	f	SIDE_PANEL	\N	\N	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	\N	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	WORKSPACE	\N	\N	f
a4f465ac-d5cb-4f24-93ac-7a24bafd398e	8b2de7a0-d103-460e-a7df-be147f8fef76	All {objectLabelPlural}	254569df-6932-4d1b-abcd-cb0f250b72ed	TABLE	INDEX	IconList	0	f	f	SIDE_PANEL	\N	\N	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	\N	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	WORKSPACE	\N	\N	f
680b43e2-5d50-49d8-bbdd-2d208e7b7071	83067e55-7cf9-47e2-a19f-3526a0f90068	Message Channel Message Association Record Page Fields	254569df-6932-4d1b-abcd-cb0f250b72ed	FIELDS_WIDGET	\N	IconList	0	f	f	SIDE_PANEL	\N	\N	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	\N	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	WORKSPACE	\N	\N	f
775610fe-f1d1-4959-bdc3-0b437059cfeb	d4c040d7-10e5-4891-8f44-794f7a1b8241	All {objectLabelPlural}	b03dcd32-17eb-4bd2-b529-7e0bbc7d4cdd	TABLE	INDEX	IconList	0	f	f	SIDE_PANEL	\N	\N	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	\N	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	WORKSPACE	\N	\N	f
331ec548-07d2-4f9d-a0a2-ef91a9f96184	6091fd91-4802-45a0-81cd-2552154dbb6c	Message Channel Message Association Message Folder Record Page Fields	b03dcd32-17eb-4bd2-b529-7e0bbc7d4cdd	FIELDS_WIDGET	\N	IconList	0	f	f	SIDE_PANEL	\N	\N	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	\N	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	WORKSPACE	\N	\N	f
6774ebf5-a300-4bcc-8f22-f5e7c58bfccf	77e465f4-93d5-4e4a-8d8f-143bf00b295d	All {objectLabelPlural}	e48dd522-875c-4937-9d9b-3a41a8cb0f1e	TABLE	INDEX	IconList	0	f	f	SIDE_PANEL	\N	\N	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	\N	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	WORKSPACE	\N	\N	f
82dc204f-a48d-4985-9259-a79b3a1b230f	3d875b63-fcf3-42db-99d5-3dd0b579a3ae	Message Folder Record Page Fields	e48dd522-875c-4937-9d9b-3a41a8cb0f1e	FIELDS_WIDGET	\N	IconList	0	f	f	SIDE_PANEL	\N	\N	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	\N	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	WORKSPACE	\N	\N	f
8b7fbe7d-dae0-4285-8bdc-ec078a4de870	d803d06e-7dae-4e6c-9751-6d76968e2189	All {objectLabelPlural}	ee0c23a3-0eb3-4d06-9b63-e89466584e21	TABLE	INDEX	IconList	0	f	f	SIDE_PANEL	\N	\N	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	\N	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	WORKSPACE	\N	\N	f
209ab5c5-4a68-4d32-8255-515919a6c5f5	0bad5d82-019e-4f81-b922-e6e332e1e2bc	Message Participant Record Page Fields	ee0c23a3-0eb3-4d06-9b63-e89466584e21	FIELDS_WIDGET	\N	IconList	0	f	f	SIDE_PANEL	\N	\N	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	\N	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	WORKSPACE	\N	\N	f
20202020-d002-4d02-8d02-ae55a9ba2002	52946023-ebe2-4595-80aa-23fab1bd1aea	All {objectLabelPlural}	cc4a7ab5-3ba0-4ac7-9ae5-896edd7b3d25	TABLE	INDEX	IconList	0	f	f	SIDE_PANEL	\N	\N	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	\N	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	WORKSPACE	\N	\N	f
20202020-a005-4a05-8a05-a0be5a11a000	11531387-cbd9-4579-94a2-4fececcf3ddd	All {objectLabelPlural}	0996fb48-437d-4a52-a0bd-098f18a09105	TABLE	INDEX	IconNotes	0	f	f	SIDE_PANEL	\N	\N	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	\N	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	WORKSPACE	\N	\N	f
20202020-a005-4a05-8a05-a0be5a115001	24ba15ff-ddbb-45ba-9c12-999990314ac3	Note Record Page Fields	0996fb48-437d-4a52-a0bd-098f18a09105	FIELDS_WIDGET	\N	IconList	0	f	f	SIDE_PANEL	\N	\N	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	\N	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	WORKSPACE	\N	\N	f
d124d587-ef78-402b-9341-7673e6cea033	683bad3e-54bf-4d76-a7e4-3757bfa6fd3d	All {objectLabelPlural}	2f8e7625-5a41-40dd-be67-29f99a4dc30e	TABLE	INDEX	IconList	0	f	f	SIDE_PANEL	\N	\N	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	\N	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	WORKSPACE	\N	\N	f
20202020-a003-4a03-8a03-0aa0b1ca1ba0	4f7f5b41-b755-4fba-a55d-e2407b561388	All {objectLabelPlural}	19d8f9ef-3d91-4bea-8281-59d7548d04da	TABLE	INDEX	IconList	0	f	f	SIDE_PANEL	\N	\N	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	\N	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	WORKSPACE	\N	\N	f
20202020-a004-4a04-8a04-0aa0b1ca1ba0	ae71dfb5-cb76-45fa-a250-0a02ee40f016	By Stage	19d8f9ef-3d91-4bea-8281-59d7548d04da	KANBAN	\N	IconLayoutKanban	2	f	f	SIDE_PANEL	SUM	098d9623-f9fe-4218-ba8c-6ec048d1fe1b	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	\N	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	WORKSPACE	\N	adb354b9-5400-4e8f-ae82-4d527e6da842	f
20202020-a003-4a03-8a03-0aa0b1ca3001	ed48e600-d403-4626-8209-62da0b7ca4ae	Opportunity Record Page Fields	19d8f9ef-3d91-4bea-8281-59d7548d04da	FIELDS_WIDGET	\N	IconList	0	f	f	SIDE_PANEL	\N	\N	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	\N	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	WORKSPACE	\N	\N	f
20202020-a002-4a02-8a02-ae0a1ea11a00	7765c311-760f-44e9-a7d1-a689f4c8a293	All {objectLabelPlural}	f59c15d0-9a52-4e93-b44f-ed4fc4bd90be	TABLE	INDEX	IconList	0	f	f	SIDE_PANEL	\N	\N	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	\N	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	WORKSPACE	\N	\N	f
20202020-a002-4a02-8a02-ae0a1ea12001	c949770f-35c2-4d59-ad86-1fb04fcd5e92	Person Record Page Fields	f59c15d0-9a52-4e93-b44f-ed4fc4bd90be	FIELDS_WIDGET	\N	IconList	0	f	f	SIDE_PANEL	\N	\N	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	\N	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	WORKSPACE	\N	\N	f
20202020-a006-4a06-8a06-ba5ca11a1ea0	3cc7dca0-b778-4886-a94c-de0f983055b2	All {objectLabelPlural}	a91a647d-4acf-456b-961b-40fbb3788c6d	TABLE	INDEX	IconList	0	f	f	SIDE_PANEL	\N	\N	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	\N	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	WORKSPACE	\N	\N	f
20202020-a008-4a08-8a08-ba5cba51aba5	13945e81-0b8b-4327-a667-aa1d2f4a2e66	By Status	a91a647d-4acf-456b-961b-40fbb3788c6d	KANBAN	\N	IconLayoutKanban	1	f	f	SIDE_PANEL	\N	\N	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	\N	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	WORKSPACE	\N	cbed51ca-e5b9-419b-8040-2bdf34045c99	f
20202020-a007-4a07-8a07-ba5ca551aaed	db7d7e8d-10ef-4b03-aa68-775b73f78e8c	Assigned to Me	a91a647d-4acf-456b-961b-40fbb3788c6d	TABLE	\N	IconUserCircle	2	f	f	SIDE_PANEL	\N	\N	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	\N	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	WORKSPACE	\N	cbed51ca-e5b9-419b-8040-2bdf34045c99	f
20202020-a006-4a06-8a06-ba5ca11a6001	905fa722-5afd-4b81-ba82-ae14fb9b928c	Task Record Page Fields	a91a647d-4acf-456b-961b-40fbb3788c6d	FIELDS_WIDGET	\N	IconList	0	f	f	SIDE_PANEL	\N	\N	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	\N	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	WORKSPACE	\N	\N	f
1dbf1d24-6cca-4f55-ae2f-e3d1b425a495	8a14da15-956c-43da-84b5-c0ebf04ce41a	All {objectLabelPlural}	5277c856-9ccc-41e4-ae01-f077f1c61574	TABLE	INDEX	IconList	0	f	f	SIDE_PANEL	\N	\N	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	\N	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	WORKSPACE	\N	\N	f
20202020-b101-4b01-8b01-ba5cc01aa001	602c03e2-79bf-4652-926c-90cd23812d8c	All {objectLabelPlural}	22213a4b-0696-4b0b-90e1-975e86ba2902	TABLE	INDEX	IconList	0	f	f	SIDE_PANEL	\N	\N	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	\N	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	WORKSPACE	\N	\N	f
20202020-a009-4a09-8a09-a0bcf10aa11a	3b257b26-5529-415a-b36e-1891dd7c1ccd	All {objectLabelPlural}	0f1f4454-5436-4ddd-b99b-5426058af575	TABLE	INDEX	IconTable	0	f	f	SIDE_PANEL	\N	\N	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	\N	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	WORKSPACE	\N	\N	f
a0a9ef79-3d42-417a-8555-3ee54c18ea51	2ae7521e-e504-4635-b894-e508e2cd25bc	All {objectLabelPlural}	c407d619-2c05-491f-b2fd-b9481d652bc9	TABLE	INDEX	IconList	0	f	f	SIDE_PANEL	\N	\N	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	\N	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	WORKSPACE	\N	\N	f
10aff295-f7ac-475d-8528-661eb9aa9759	21665928-421d-4110-9dec-493ce2e838f9	Workflow Automated Trigger Record Page Fields	c407d619-2c05-491f-b2fd-b9481d652bc9	FIELDS_WIDGET	\N	IconList	0	f	f	SIDE_PANEL	\N	\N	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	\N	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	WORKSPACE	\N	\N	f
20202020-a011-4a11-8a11-a0bcf10abca5	39823c45-8f49-4884-8af5-b56e7832d795	Runs	bfd36b0d-202c-430c-8f42-12ed18cb1f6a	TABLE	INDEX	IconPlayerPlay	0	f	f	SIDE_PANEL	\N	\N	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	\N	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	WORKSPACE	\N	\N	f
20202020-a011-4a11-8a11-a0bcf10abcf1	f51f99d4-e900-465a-968b-5d5819069b53	Workflow Run Record Page Fields	bfd36b0d-202c-430c-8f42-12ed18cb1f6a	FIELDS_WIDGET	\N	IconList	0	f	f	SIDE_PANEL	\N	\N	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	\N	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	WORKSPACE	\N	\N	f
20202020-a010-4a10-8a10-a0bcf10aae15	eca9d69c-4577-40a9-b068-b59a800bdfbd	Versions	72cb4e16-ed23-4e5a-8ed3-47fd5f979113	TABLE	INDEX	IconRestore	0	f	f	SIDE_PANEL	\N	\N	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	\N	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	WORKSPACE	\N	\N	f
20202020-a010-4a10-8a10-a0bcf10aaef1	36158a62-099d-4ab0-a3c8-aa01c7f590f1	Workflow Version Record Page Fields	72cb4e16-ed23-4e5a-8ed3-47fd5f979113	FIELDS_WIDGET	\N	IconList	0	f	f	SIDE_PANEL	\N	\N	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	\N	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	WORKSPACE	\N	\N	f
20202020-e001-4e01-8e01-a0bcaeabe100	42f23f3c-a663-419a-83ff-44e267f7cb30	All {objectLabelPlural}	0286cdc7-a914-4a77-9afa-1fd5831fcb59	TABLE	INDEX	IconList	0	f	f	SIDE_PANEL	\N	\N	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	\N	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	WORKSPACE	\N	\N	f
11e433e9-6f2e-4cad-a9e4-e084b5cd94e1	af757748-e028-4b15-ab5a-e4bf7b7104b8	All {objectLabelPlural}	a64cec42-2523-4102-b0d6-fdbb2f937bb6	TABLE	INDEX	IconList	0	f	t	SIDE_PANEL	\N	\N	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 12:15:04.227+00	2026-04-25 12:15:04.227+00	\N	\N	\N	\N	8c07d085-7bf4-4849-934d-3c70dcf4340d	WORKSPACE	\N	\N	f
b768f25e-25ff-4d0c-95e8-a9f5a9876866	74054fef-1f89-468b-87a1-c85006b8b973	Habit Record Page Fields	a64cec42-2523-4102-b0d6-fdbb2f937bb6	FIELDS_WIDGET	\N	IconList	0	f	t	SIDE_PANEL	\N	\N	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 12:15:04.773+00	2026-04-25 12:15:04.773+00	\N	\N	\N	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	WORKSPACE	\N	\N	f
b19cb565-1864-4379-8dd9-e4d26de5657d	8b56eeed-8bb5-49bd-97ff-ad6c573cea25	All {objectLabelPlural}	185d031c-a8d4-42b4-b9b8-55a8e1c6e608	TABLE	INDEX	IconList	0	f	t	SIDE_PANEL	\N	\N	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 12:25:53.066+00	2026-04-25 12:25:53.066+00	\N	\N	\N	\N	8c07d085-7bf4-4849-934d-3c70dcf4340d	WORKSPACE	\N	\N	f
396aca69-0b18-43aa-883b-0a7077a7de83	0e20d88b-564e-4437-9c06-392e385e03b5	Habit Log Record Page Fields	185d031c-a8d4-42b4-b9b8-55a8e1c6e608	FIELDS_WIDGET	\N	IconList	0	f	t	SIDE_PANEL	\N	\N	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 12:25:53.47+00	2026-04-25 12:25:53.47+00	\N	\N	\N	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	WORKSPACE	\N	\N	f
\.


--
-- Data for Name: viewField; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."viewField" ("universalIdentifier", id, "fieldMetadataId", "isVisible", size, "position", "aggregateOperation", "viewId", "workspaceId", "createdAt", "updatedAt", "deletedAt", "applicationId", "viewFieldGroupId", overrides, "isActive") FROM stdin;
be56712f-d7a6-4fbe-b92b-d750f0708a0a	a50d5504-b717-4bda-a059-493a11ced293	a748e36c-e180-4d65-9b88-2490b949256f	t	210	0	\N	664baa04-b8fe-4325-9905-86527e943c94	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
873cf114-5477-4b62-9023-7ea6ad69fbe5	34cea513-d554-48f1-9bbe-475d11024f7d	730e7e73-9050-4eb5-8e99-4912a1960a5c	t	150	1	\N	664baa04-b8fe-4325-9905-86527e943c94	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
73a4c3a7-c7f9-4ed6-a2b6-117d7efad0f3	f1b832f6-d784-4105-809d-d2a4a779d9b7	3d6af4d7-ed38-446f-b01a-ffdf90b743f4	t	150	2	\N	664baa04-b8fe-4325-9905-86527e943c94	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
b335ad04-059e-4c36-8666-f40431849044	3cbe96c0-5ff3-47f1-a6f3-00e424aab58f	6d09a296-a84f-47cb-b3b5-960ec4f9df77	t	150	3	\N	664baa04-b8fe-4325-9905-86527e943c94	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
15f2d457-dc09-4c52-bf2a-47083d6bf017	c15936a4-5b34-417a-949a-d557675ff906	9a8f7ba6-f719-4153-be2b-4b3b3fa1aa46	t	150	4	\N	664baa04-b8fe-4325-9905-86527e943c94	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
c2913c5e-6cc6-438d-9c2f-3212a9b2a82b	b5daca8f-8337-4eb9-98e7-b909ff2a85a1	a9c755af-5eac-4c2b-a3d7-db338392a7c6	t	150	5	\N	664baa04-b8fe-4325-9905-86527e943c94	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
fc8dba49-bcf2-41b8-a435-0c4a3bbf2af6	5f161fb4-a2cc-43d7-872c-3440b6d1564e	cdb30fc4-de45-4792-8cec-f0f10e375179	t	150	6	\N	664baa04-b8fe-4325-9905-86527e943c94	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
bcc6d6e1-7c0b-4291-9270-66e42024d8dd	f21ce75b-02ba-4df1-b28d-21ca23c4b4c4	89a36664-7be5-4c3d-a50e-1e63daeaf4eb	t	150	7	\N	664baa04-b8fe-4325-9905-86527e943c94	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
11fcf58b-dbab-42dd-be67-689462111070	50ba80da-45a8-4f71-8499-b2a5e80b1b81	e9023f36-6e73-42ee-9701-0272b29535b6	t	150	8	\N	664baa04-b8fe-4325-9905-86527e943c94	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
fa363372-0fdf-4bb3-bdf1-0ead354b9225	d6344303-dbd8-4290-bc14-f130dfdefd06	8f1650e2-155e-4e24-9c02-b0247f159cee	t	150	9	\N	664baa04-b8fe-4325-9905-86527e943c94	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
6c092c26-b1cb-488f-ae2e-5af4bec1162b	a268e47f-6115-49b9-8d91-f69e87ebf493	e59f883e-cb64-4a58-b5b0-61adad2ca808	t	150	10	\N	664baa04-b8fe-4325-9905-86527e943c94	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
155ae00d-0def-4f62-9473-8a8efa209eee	08d7ccd8-2d40-49b5-b4c8-32c9b7e769d7	0a86787e-385e-48ea-a8f2-4b4d7416edd4	t	150	0	\N	41e78972-e5f6-4fe7-a2d0-6d0bb3930806	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
05a2f0b9-f2ef-4729-bc42-9e2ad2a34fb2	8dfef1f4-71b8-45d5-b325-bc000f4e65a9	d711648b-d862-4b80-bb34-3fdecf265be1	t	150	1	\N	41e78972-e5f6-4fe7-a2d0-6d0bb3930806	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
e7cfcf05-2676-4d43-9eee-4da1016b12ff	b937ac8d-70b5-485e-aa1c-7cb78712941f	c741b586-df46-4a1b-a1d9-c9e3abd387dc	t	150	2	\N	41e78972-e5f6-4fe7-a2d0-6d0bb3930806	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
f2f5732f-7435-44be-986b-4c4d834fdfeb	3630fc8c-8c72-43f1-bf44-93ba886dc147	d711648b-d862-4b80-bb34-3fdecf265be1	t	150	1	\N	e5e9e2d9-6904-4cbe-a0f4-163b1150f972	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	24c9a667-66a0-406e-98e5-297748417bb4	\N	t
b2594a03-e00f-4de9-89da-b34bb95c2221	d49227e2-6b22-4e9e-bdfd-a42a42614e36	c741b586-df46-4a1b-a1d9-c9e3abd387dc	t	150	0	\N	e5e9e2d9-6904-4cbe-a0f4-163b1150f972	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	a276ec96-b3ac-43a1-81ff-bb46c171873b	\N	t
80a60507-6c7a-4713-b5de-b94ac293bf23	3b3aa05a-39d2-4d77-8b64-28953a99dcf7	355f85b0-0eb3-4c90-8346-538b99c494d8	t	150	1	\N	e5e9e2d9-6904-4cbe-a0f4-163b1150f972	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	a276ec96-b3ac-43a1-81ff-bb46c171873b	\N	t
dc7ea888-79d6-4b8c-acdd-a72abe8e6326	bd957442-12f9-4027-a8fe-ecba86570215	bf6b952d-9fbd-471b-97c1-235fd7ce1f59	t	150	0	\N	1e07343f-d060-49e4-9ca0-8aa95300c419	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
0fff693f-2149-4fdb-a85c-52f2d89322f2	2069a285-0d40-47b0-b311-55d19b9efdd0	95456be8-21b6-4912-9e54-395f87a0983e	t	150	1	\N	1e07343f-d060-49e4-9ca0-8aa95300c419	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
a308409d-ee09-4588-b3b2-31b71bced64d	c65e5a5f-af08-47d0-9c86-89b7da36e23c	8b331146-8ea4-4564-b124-2431e1e55848	t	150	2	\N	1e07343f-d060-49e4-9ca0-8aa95300c419	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
120065b8-bcba-4088-b3a8-8ae66def4219	468463f0-9f76-48b9-849a-c0efc71e99e5	f356d42e-293f-4c44-b99a-0ec804606349	t	150	3	\N	1e07343f-d060-49e4-9ca0-8aa95300c419	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
ee3bafb8-6374-44f3-b328-c705c16220ac	0f481f30-9447-4119-9c07-94b573594049	737febbd-8d29-4075-8e50-3da6fab4e4b0	t	150	4	\N	1e07343f-d060-49e4-9ca0-8aa95300c419	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
b2ef299a-b996-4f44-8c75-fad854d7df7f	d2f2f67b-c2db-4775-a371-93fbf2a40ee3	7e121cfe-c31b-4d2f-b6fc-f84fc3372804	t	150	5	\N	1e07343f-d060-49e4-9ca0-8aa95300c419	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
bdb40f41-f9ba-4b59-a8cf-878c23701ab3	32690095-7627-4690-ab12-064551c9d1c3	95456be8-21b6-4912-9e54-395f87a0983e	t	150	1	\N	9e1167fa-3a76-4cfd-bacd-33f45bb8ee19	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	b056b00f-e37a-4467-bb9c-7fa3cd5c3aaa	\N	t
2d9f8c64-12be-4bb1-b0d4-977d89853498	64abef14-1f22-43a9-958d-4909d7b0eca5	8b331146-8ea4-4564-b124-2431e1e55848	t	150	2	\N	9e1167fa-3a76-4cfd-bacd-33f45bb8ee19	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	b056b00f-e37a-4467-bb9c-7fa3cd5c3aaa	\N	t
819312c0-3441-42a2-a638-8800e353b72f	5e370ea5-b18e-4284-9871-ec4311643399	f356d42e-293f-4c44-b99a-0ec804606349	t	150	3	\N	9e1167fa-3a76-4cfd-bacd-33f45bb8ee19	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	b056b00f-e37a-4467-bb9c-7fa3cd5c3aaa	\N	t
b95949f7-e4f7-4708-bfd5-6ec66d772465	dcc8c28c-8742-499b-a3fc-b557f7ea76f0	737febbd-8d29-4075-8e50-3da6fab4e4b0	t	150	4	\N	9e1167fa-3a76-4cfd-bacd-33f45bb8ee19	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	b056b00f-e37a-4467-bb9c-7fa3cd5c3aaa	\N	t
8c0e4a82-9846-46b2-988b-8b651395fc52	92a62950-bbf1-493d-952a-bd2bba4c39d7	7e121cfe-c31b-4d2f-b6fc-f84fc3372804	t	150	0	\N	9e1167fa-3a76-4cfd-bacd-33f45bb8ee19	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	41d0b4e8-d67f-4573-bc1b-2a8772d2116d	\N	t
35af4126-06bd-43a1-88cb-b1e2a170ccd2	90f3c456-c26c-4542-8eed-93aac34e659c	812498c0-1850-475f-a8f8-fff708a6e443	t	150	1	\N	9e1167fa-3a76-4cfd-bacd-33f45bb8ee19	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	41d0b4e8-d67f-4573-bc1b-2a8772d2116d	\N	t
e3adffd2-d820-4c89-912c-34908d90057e	8be97092-bf2d-415c-b5d2-63d586f24067	70ca63da-16cd-478f-9c18-7650083fe012	t	150	0	\N	9130a85e-a9e1-4609-8e0a-d5125bae4e0d	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
35656a84-ecb8-4075-a610-8b538d6f8120	3b47adfb-c12e-48c7-b572-e9d88ce4d967	c4ad21b9-7f00-420c-9ca6-caa67bf8e36e	t	150	1	\N	9130a85e-a9e1-4609-8e0a-d5125bae4e0d	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
f779d7e8-f1d8-44a7-b0ef-4409c9b6b466	8a0fdf37-cf90-46fc-ac7f-f100233ea753	aa6b1911-3edf-4798-bab6-a74002f8c502	t	150	2	\N	9130a85e-a9e1-4609-8e0a-d5125bae4e0d	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
8ca74f2f-210b-4afc-81f0-506047400e82	80f239c0-7a54-4232-808e-a2ab9c826a18	dd94bd25-bc8d-44d2-af29-f01541e9ac3d	t	150	3	\N	9130a85e-a9e1-4609-8e0a-d5125bae4e0d	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
cd6c6714-fc1d-4511-a664-ec5e8dfd8692	996fab87-1d93-466a-826a-bcf9cdc60181	70ca63da-16cd-478f-9c18-7650083fe012	t	150	0	\N	b9b76520-b5a6-4d26-ad5c-4767bb6724ec	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	e67f14fb-db52-413a-8e05-02e76b4559d7	\N	t
4790ca84-255e-4cb7-9b20-c17f4d94df8e	bccd752e-c862-4d01-8159-47b27c170cd0	c4ad21b9-7f00-420c-9ca6-caa67bf8e36e	t	150	1	\N	b9b76520-b5a6-4d26-ad5c-4767bb6724ec	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	e67f14fb-db52-413a-8e05-02e76b4559d7	\N	t
dbe16c1b-ece2-4d2f-b634-094742ac3e16	72e3d06d-68fa-4b3c-b5f8-5652d7dca4c9	aa6b1911-3edf-4798-bab6-a74002f8c502	t	150	2	\N	b9b76520-b5a6-4d26-ad5c-4767bb6724ec	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	e67f14fb-db52-413a-8e05-02e76b4559d7	\N	t
2702ae80-9108-4757-8a25-317a4357484e	3a5775b5-1c65-495c-89c2-718be1eb02c2	dd94bd25-bc8d-44d2-af29-f01541e9ac3d	t	150	0	\N	b9b76520-b5a6-4d26-ad5c-4767bb6724ec	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	0feb05f6-35c4-4073-9e00-6491be93e184	\N	t
201e0c45-fddc-4217-bfd4-40c13d7f7916	1245d43f-785f-417a-863a-0dc7189f580f	d1f077d1-485e-4dc1-87b6-3b229a845da0	t	150	1	\N	b9b76520-b5a6-4d26-ad5c-4767bb6724ec	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	0feb05f6-35c4-4073-9e00-6491be93e184	\N	t
20202020-cf01-4c01-8c01-ca1ebe0caf01	f3d91f93-26ee-4220-949f-44aaa8d7c4b9	efd1c758-2fa2-4bb6-939b-65b902e5ebde	t	180	0	\N	aae708ec-2632-43dc-aaf4-49fab13e88f5	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-cf01-4c01-8c01-ca1ebe0caf02	18217aaa-66ec-4386-b69d-03e2439fa1ee	7d59f9a7-27da-4095-bc26-1d48fc9e628b	t	150	1	\N	aae708ec-2632-43dc-aaf4-49fab13e88f5	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-cf01-4c01-8c01-ca1ebe0caf03	0c1790b8-12a6-48e4-99f9-854af0e59e72	dc8acf7b-891e-4aa4-86f2-28f9bc44757d	t	150	2	\N	aae708ec-2632-43dc-aaf4-49fab13e88f5	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-cf01-4c01-8c01-ca1ebe0caf04	2f9a478b-5174-4b31-aac2-77d466891b09	857cc27d-9e40-4f03-8bf0-2f89e78697b9	t	100	3	\N	aae708ec-2632-43dc-aaf4-49fab13e88f5	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-cf01-4c01-8c01-ca1ebe0caf05	0f301358-051f-451f-833c-0b5d5afbed8d	7279bf4b-d9aa-4bbb-a2ba-ecb802b2f691	t	150	4	\N	aae708ec-2632-43dc-aaf4-49fab13e88f5	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-cf01-4c01-8c01-ca1ebe0caf06	37e780cf-f3ce-43e5-95c1-fad0484120fa	1af9f325-6ed0-4a96-8f4d-ba7c0da80719	t	150	5	\N	aae708ec-2632-43dc-aaf4-49fab13e88f5	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-cf01-4c01-8c01-ca1ebe0caf07	84811278-1d39-4db0-8b45-82fc870d324f	ab212853-2b50-41f4-8bf5-f0e9557af5c3	t	100	6	\N	aae708ec-2632-43dc-aaf4-49fab13e88f5	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-cf01-4c01-8c01-ca1ebe0caf08	78617a8d-2d16-48ad-bccd-c5b085c5075c	fbd1352f-fbd4-4399-869b-09f878f600aa	t	150	7	\N	aae708ec-2632-43dc-aaf4-49fab13e88f5	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
4140bd68-55e8-475c-8724-7f9f97634a9f	b601cf8a-c991-416a-84f4-cf11fd67e651	ed83b3a6-ea1c-4849-817f-91cd00c2da6d	t	150	0	\N	66bf976a-2db7-461c-88d0-dd14296830c6	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
d9c2f346-b83b-48ae-98d0-e344f97248cd	1ee653d0-b51e-4db3-b18a-8360b1484853	f3bab687-fba2-40a3-9a54-203f4ce5bfbb	t	150	1	\N	66bf976a-2db7-461c-88d0-dd14296830c6	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
3cadc470-9231-4027-9bbe-60e934edb483	8bb03d7e-aab0-4a05-ae0e-224be4a4f159	3a17221b-4f35-42b3-b3a1-8034f92ca014	t	150	2	\N	66bf976a-2db7-461c-88d0-dd14296830c6	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
684972f9-c5fe-4fff-bdec-2fc5511c938c	5a36ddf6-f509-4e75-a8bb-57711d282a72	67beac21-7ae5-4371-94f4-f6affdd73262	t	150	3	\N	66bf976a-2db7-461c-88d0-dd14296830c6	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
dd0ab0bd-7f33-48fa-9461-fb5d085a2f9f	c9ca550e-fec3-4074-84be-e1eeb077d389	3b58afcd-3a34-46be-9578-f1d8feb7fd5c	t	150	4	\N	66bf976a-2db7-461c-88d0-dd14296830c6	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
86546244-9e3d-40e4-87cd-cbc82a353d2e	f48a74e5-2162-4bda-941c-e24c313472e5	8264d38c-6f85-4f69-8609-6718282128e2	t	150	5	\N	66bf976a-2db7-461c-88d0-dd14296830c6	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
542141b0-ac85-4c43-867b-8d7f559b07ae	170536e6-8c19-4b4f-a3d5-cc74fe5c66e0	22e58cd2-2f15-400a-bf7c-3f2c7b81300f	t	150	6	\N	66bf976a-2db7-461c-88d0-dd14296830c6	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
63d9d40d-e40c-410c-a14c-2f36c64c3e69	cb4f1c87-6d3f-4403-8fcc-4bb8fd432ff4	4226b386-62a7-4ac4-8850-16614099619c	t	150	7	\N	66bf976a-2db7-461c-88d0-dd14296830c6	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
eb09af9c-b3f4-403c-8cb2-172243f83958	b7d4d0c5-aad6-4fa3-a358-03b33c6a3bea	ed83b3a6-ea1c-4849-817f-91cd00c2da6d	t	150	0	\N	1cb25256-f293-4cd6-982a-b28c8d8fd158	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	d15ef95d-73e4-4de3-a33f-3ac8d3147b49	\N	t
865a1278-c356-4b99-a5e9-1ca3d33c7665	fe646cae-94cf-4878-b6f7-729369c97d4c	f3bab687-fba2-40a3-9a54-203f4ce5bfbb	t	150	1	\N	1cb25256-f293-4cd6-982a-b28c8d8fd158	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	d15ef95d-73e4-4de3-a33f-3ac8d3147b49	\N	t
23b97527-6ad3-4f07-bf68-559b97321673	e0d5b0a7-4fb6-45c8-9354-240e807cce34	3a17221b-4f35-42b3-b3a1-8034f92ca014	t	150	2	\N	1cb25256-f293-4cd6-982a-b28c8d8fd158	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	d15ef95d-73e4-4de3-a33f-3ac8d3147b49	\N	t
3c126f3c-bd01-4029-b58a-724513fa5fff	5afd4ffa-758f-4ce8-9f08-64a78f54739b	67beac21-7ae5-4371-94f4-f6affdd73262	t	150	3	\N	1cb25256-f293-4cd6-982a-b28c8d8fd158	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	d15ef95d-73e4-4de3-a33f-3ac8d3147b49	\N	t
cd02fc91-8fa4-4fa3-b0e3-1a1fc891e6ee	efd82660-3992-4e8c-9280-ca30cb02a635	3b58afcd-3a34-46be-9578-f1d8feb7fd5c	t	150	4	\N	1cb25256-f293-4cd6-982a-b28c8d8fd158	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	d15ef95d-73e4-4de3-a33f-3ac8d3147b49	\N	t
46be729d-091c-4012-aeca-16a743008513	4c167891-05f2-47e0-b561-a15ae440b465	8264d38c-6f85-4f69-8609-6718282128e2	t	150	5	\N	1cb25256-f293-4cd6-982a-b28c8d8fd158	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	d15ef95d-73e4-4de3-a33f-3ac8d3147b49	\N	t
c38c1111-f6e0-4698-9b36-db59f8d97de3	a6351fad-45e5-4353-92a5-cdb7544c78ba	22e58cd2-2f15-400a-bf7c-3f2c7b81300f	t	150	6	\N	1cb25256-f293-4cd6-982a-b28c8d8fd158	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	d15ef95d-73e4-4de3-a33f-3ac8d3147b49	\N	t
1447c7fa-fe2b-4ff7-8036-8de682537e23	b519748b-2da4-450f-b844-28cb060cb54c	4226b386-62a7-4ac4-8850-16614099619c	t	150	0	\N	1cb25256-f293-4cd6-982a-b28c8d8fd158	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	4f64ee46-eaed-4b55-a424-2b2a8ccd9969	\N	t
6d7dff75-0230-45bd-8db9-dc25ef007e6e	2530b94e-b4e2-4152-bf63-0c059cacc4ec	80ef038a-66f1-4457-87f0-84e581001279	t	150	1	\N	1cb25256-f293-4cd6-982a-b28c8d8fd158	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	4f64ee46-eaed-4b55-a424-2b2a8ccd9969	\N	t
20202020-af01-4a01-8a01-c0aba11cf001	6b7ffb5a-a542-4342-adb9-fbfebbd813f8	69512596-ab97-4a06-a1c9-006d5983356b	t	180	0	\N	d0a3adb4-024a-4bba-b418-de90ba7c17f7	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af01-4a01-8a01-c0aba11cf002	c766e460-0fed-43d4-9fb0-c861c62d4d91	1293a7d1-bf10-4dc2-a75f-c0166cef618e	t	100	1	COUNT	d0a3adb4-024a-4bba-b418-de90ba7c17f7	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af01-4a01-8a01-c0aba11cf003	89893c45-5488-46ad-ac34-2e666242bd01	dbeed298-970c-4c45-94b7-43e30b4e08b7	t	150	2	\N	d0a3adb4-024a-4bba-b418-de90ba7c17f7	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af01-4a01-8a01-c0aba11cf004	d865562c-1eae-42d3-8a19-18ad3350165c	bebb69c6-7327-4c21-ba85-70039c4154a0	t	150	3	\N	d0a3adb4-024a-4bba-b418-de90ba7c17f7	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af01-4a01-8a01-c0aba11cf005	b4576a38-d3e6-4fdf-96fd-0360d39a8290	9737fc59-4955-431f-aaa0-81f449767c67	t	150	4	\N	d0a3adb4-024a-4bba-b418-de90ba7c17f7	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af01-4a01-8a01-c0aba11cf006	8941d046-7980-4efa-9139-5287e8518482	31951850-f9d4-400a-936b-e64c900abb08	t	150	5	MAX	d0a3adb4-024a-4bba-b418-de90ba7c17f7	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af01-4a01-8a01-c0aba11cf007	9d521a6c-4753-4e32-a1f2-f6eeeb27b27a	5ebf4172-7532-42dc-825d-193e2f421de9	t	170	6	PERCENTAGE_EMPTY	d0a3adb4-024a-4bba-b418-de90ba7c17f7	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af01-4a01-8a01-c0aba11cf008	3dde71ed-e2fe-4644-b436-2cace5604dfb	10cf8f8d-3811-4368-8a62-f850fac550bb	t	170	7	COUNT_NOT_EMPTY	d0a3adb4-024a-4bba-b418-de90ba7c17f7	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af01-4a01-8a01-c0aba11c1201	af2d0255-3a23-48ea-b5f0-3a12590a3d62	1293a7d1-bf10-4dc2-a75f-c0166cef618e	t	150	0	\N	f021740c-7b55-447c-818e-d79706d42ad5	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	201321ec-ac34-49e0-ae7e-dc9e1228dacc	\N	t
20202020-af01-4a01-8a01-c0aba11c1202	d4d243d3-aa52-4229-abc6-2945348263f3	bebb69c6-7327-4c21-ba85-70039c4154a0	t	150	1	\N	f021740c-7b55-447c-818e-d79706d42ad5	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	201321ec-ac34-49e0-ae7e-dc9e1228dacc	\N	t
20202020-af01-4a01-8a01-c0aba11c1214	ca1f059c-3946-48c5-8384-fda192fb633b	f69f6a99-a81b-4454-a642-65d601c20cd2	f	150	2	\N	f021740c-7b55-447c-818e-d79706d42ad5	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	201321ec-ac34-49e0-ae7e-dc9e1228dacc	\N	t
20202020-af01-4a01-8a01-c0aba11c1215	bea47762-6d34-437f-995f-90c183f352b1	535a2425-131b-49a5-ae34-83cef2588067	f	150	3	\N	f021740c-7b55-447c-818e-d79706d42ad5	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	201321ec-ac34-49e0-ae7e-dc9e1228dacc	\N	t
20202020-af01-4a01-8a01-c0aba11c1216	8f98744f-e679-4bdb-b7f4-0c38f6456633	3fdd495c-117b-45d8-a3e0-68d6dc6c179e	f	150	4	\N	f021740c-7b55-447c-818e-d79706d42ad5	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	201321ec-ac34-49e0-ae7e-dc9e1228dacc	\N	t
20202020-af01-4a01-8a01-c0aba11c1217	67f0720b-8d28-41b5-b08a-11f7a2ffb763	a9481120-7fd7-4e51-8ab7-e9dd7e93c295	f	150	5	\N	f021740c-7b55-447c-818e-d79706d42ad5	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	201321ec-ac34-49e0-ae7e-dc9e1228dacc	\N	t
20202020-af01-4a01-8a01-c0aba11c1219	33a0c749-3c88-4a00-9e08-419065e92b0f	67da3999-31b5-4cb3-8b10-08510a4692fa	f	150	7	\N	f021740c-7b55-447c-818e-d79706d42ad5	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	201321ec-ac34-49e0-ae7e-dc9e1228dacc	\N	t
20202020-af01-4a01-8a01-c0aba11c121a	938100d4-fabb-4301-91c4-8a83ea8fed5e	0c8314fb-3f2b-4161-acae-1968a36c8b9e	f	150	8	\N	f021740c-7b55-447c-818e-d79706d42ad5	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	201321ec-ac34-49e0-ae7e-dc9e1228dacc	\N	t
20202020-af01-4a01-8a01-c0aba11c1203	dfcbd6f1-8574-476e-a5bf-330b5c691d94	f460516e-7aa7-48b8-b2fd-dabb6eeadeac	t	150	0	\N	f021740c-7b55-447c-818e-d79706d42ad5	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	ef9fb37a-3432-41cd-8a00-ebf02a78accf	\N	t
20202020-af01-4a01-8a01-c0aba11c1205	c5d1da44-dc8f-4448-a1ea-54f6e077b7c5	31951850-f9d4-400a-936b-e64c900abb08	t	150	1	\N	f021740c-7b55-447c-818e-d79706d42ad5	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	ef9fb37a-3432-41cd-8a00-ebf02a78accf	\N	t
20202020-af01-4a01-8a01-c0aba11c1204	e972904e-1d2a-475c-83be-bf8d5756fc49	af93449c-cb6e-4025-9140-08e4606fa185	t	150	2	\N	f021740c-7b55-447c-818e-d79706d42ad5	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	ef9fb37a-3432-41cd-8a00-ebf02a78accf	\N	t
20202020-af01-4a01-8a01-c0aba11c1208	c97aff91-cd6e-4950-a354-34ecebddcca5	10cf8f8d-3811-4368-8a62-f850fac550bb	t	150	0	\N	f021740c-7b55-447c-818e-d79706d42ad5	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	3c73c9c2-5336-498d-ada5-198c181c94d5	\N	t
20202020-af01-4a01-8a01-c0aba11c1206	5bdd3061-9311-42bc-b6da-12f21ddb753a	5ebf4172-7532-42dc-825d-193e2f421de9	t	150	1	\N	f021740c-7b55-447c-818e-d79706d42ad5	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	3c73c9c2-5336-498d-ada5-198c181c94d5	\N	t
20202020-af01-4a01-8a01-c0aba11c1207	1a2bddc8-c46d-48af-818d-02c5c33f43d4	73ed6365-303e-4fe4-ab86-b9a04ef19244	t	150	2	\N	f021740c-7b55-447c-818e-d79706d42ad5	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	3c73c9c2-5336-498d-ada5-198c181c94d5	\N	t
20202020-af01-4a01-8a01-c0aba11c1209	e08fd835-24d3-4c25-be8a-d0877f1e56e0	9737fc59-4955-431f-aaa0-81f449767c67	t	150	0	\N	f021740c-7b55-447c-818e-d79706d42ad5	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	79f5ee60-99e7-4884-ac6d-2477538bdf44	\N	t
20202020-af01-4a01-8a01-c0aba11c1210	9994b3cf-0007-4cd9-bd50-152e87348634	dbeed298-970c-4c45-94b7-43e30b4e08b7	t	150	1	\N	f021740c-7b55-447c-818e-d79706d42ad5	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	79f5ee60-99e7-4884-ac6d-2477538bdf44	\N	t
20202020-af01-4a01-8a01-c0aba11c1212	631cb19a-373c-4aa2-a1c1-23a4e34c0d5a	e7d1b58f-d423-4360-8b0a-0984dfdb5524	f	150	2	\N	f021740c-7b55-447c-818e-d79706d42ad5	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	79f5ee60-99e7-4884-ac6d-2477538bdf44	\N	t
20202020-af01-4a01-8a01-c0aba11c1213	fd41e282-29bd-4671-ab98-40d5366e69cd	b301914a-64ca-4198-81ee-9c0eacb12643	f	150	3	\N	f021740c-7b55-447c-818e-d79706d42ad5	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	79f5ee60-99e7-4884-ac6d-2477538bdf44	\N	t
84515ac3-6154-4860-8b29-10316ba3b6fb	8363161f-cbe6-45eb-8d19-7e5687eaec88	97913003-a3d6-43bc-9428-547c89b7d24e	t	150	0	\N	c4e7ab60-0a8a-490b-a755-5712436b28ab	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
dde13525-685c-4476-adba-6d4fd3c92672	986a8105-dc39-42c0-86ab-a8ca61476102	a1371165-35c8-49d9-9432-1a7fca3c1c86	t	150	1	\N	c4e7ab60-0a8a-490b-a755-5712436b28ab	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
7b5b84e1-8441-4c8c-a113-4fc184b24ba8	44704155-e039-4ff9-83d6-3ad797956042	350023d2-c715-43e1-a260-9c2535cadfbd	t	150	2	\N	c4e7ab60-0a8a-490b-a755-5712436b28ab	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
66c8d3d4-3505-46a4-85ec-8bad314aa257	9123fe82-5def-43c9-9dd3-2dc92c1b0610	c65584b1-6236-4948-94b4-ee4751dbeb34	t	150	3	\N	c4e7ab60-0a8a-490b-a755-5712436b28ab	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
8ff5aa14-69d3-4294-b266-d141d7e12dae	812bd660-f96c-4cac-8afe-dcfa3e6effbd	bbdd7805-f096-408b-822a-58786a461677	t	150	4	\N	c4e7ab60-0a8a-490b-a755-5712436b28ab	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
83171d2a-0d11-42b1-991d-8d4346b02cff	b310bafc-3c93-40a7-9ffe-de04715940ad	a1371165-35c8-49d9-9432-1a7fca3c1c86	t	150	1	\N	86d16288-5a26-4f70-8fdb-d6e6e669f31d	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	67099305-9ed5-4a05-9986-9db9430d785e	\N	t
399a5e57-abab-42b1-b3f6-029a33d62e30	563cdef5-7631-4969-bf47-21ca7f9fc004	350023d2-c715-43e1-a260-9c2535cadfbd	t	150	2	\N	86d16288-5a26-4f70-8fdb-d6e6e669f31d	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	67099305-9ed5-4a05-9986-9db9430d785e	\N	t
ad52cc4e-fd75-4b11-8915-c8a7c96ce500	cd13fd7f-8f65-4f3d-b041-de0133bc4be2	c65584b1-6236-4948-94b4-ee4751dbeb34	t	150	3	\N	86d16288-5a26-4f70-8fdb-d6e6e669f31d	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	67099305-9ed5-4a05-9986-9db9430d785e	\N	t
eda84724-d30e-406d-9858-016dcd46ac49	c6cde1c1-5e1d-4108-a0b6-e44db83cdcfe	bbdd7805-f096-408b-822a-58786a461677	t	150	0	\N	86d16288-5a26-4f70-8fdb-d6e6e669f31d	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	39cbca6d-7b3f-443e-970d-af1fb60f0caf	\N	t
1335696e-31cf-4a5e-aabf-89b45dd80b33	c66f94c7-3f19-4573-a690-c22e05fa4a0c	61954425-3bd3-45cc-81a4-d8ebbb717cf4	t	150	1	\N	86d16288-5a26-4f70-8fdb-d6e6e669f31d	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	39cbca6d-7b3f-443e-970d-af1fb60f0caf	\N	t
20202020-af12-4a12-8a12-da5ab0b0af01	f88f1d54-1098-4370-aa33-411e35fafc13	a5fe568f-6ae1-484b-9684-a5c9b5192cff	t	200	0	\N	ee9c3629-4511-4713-87e6-4104b0368493	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af12-4a12-8a12-da5ab0b0af02	899cc5e9-6a7c-47cb-bec7-bdfa5dcc6a3a	e94a1033-c67e-4d31-980e-dfbade2cfd24	t	150	1	\N	ee9c3629-4511-4713-87e6-4104b0368493	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af12-4a12-8a12-da5ab0b0af03	2981b075-1ac0-4a1b-ae1f-a7839c1c1cb0	387e9e5c-b62c-4889-ab40-fe968ef3d5fb	t	150	2	\N	ee9c3629-4511-4713-87e6-4104b0368493	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af12-4a12-8a12-da5ab0b0af04	f85ac5e5-4039-44c4-af98-e3be763a8f25	32e55123-1f37-4654-8946-89d2fe13587e	t	150	3	\N	ee9c3629-4511-4713-87e6-4104b0368493	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-df01-4d01-8d01-ae55a9e5af01	c362d64f-0bd4-4e70-9cf7-ae597ab835ea	3a73b856-56c3-41f2-9cd0-b666cfdc8215	t	180	0	\N	e920a76d-334a-41f9-8f50-13bf18c1cde0	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-df01-4d01-8d01-ae55a9e5af02	0b5a03ca-a6ba-4f28-95b3-eac3dfeaf5a0	844a9e91-1be3-47be-a191-c6a0cfd85056	t	150	1	\N	e920a76d-334a-41f9-8f50-13bf18c1cde0	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-df01-4d01-8d01-ae55a9e5af03	37e7ca8e-c1b3-4d5a-9990-7af31848881e	75fe196e-65ad-45b8-b1e8-f03c83726d7d	t	150	2	\N	e920a76d-334a-41f9-8f50-13bf18c1cde0	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-df01-4d01-8d01-ae55a9e5af04	4b4947a8-e264-4d58-b33f-2e015fe751cf	d06f3850-b597-4cb4-884d-456816d904f1	t	150	3	\N	e920a76d-334a-41f9-8f50-13bf18c1cde0	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-df01-4d01-8d01-ae55a9e5af05	67944e2b-0e7f-4786-94bf-93afa809f810	0169f089-01ef-494b-af06-938b785a2148	t	180	4	\N	e920a76d-334a-41f9-8f50-13bf18c1cde0	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-df01-4d01-8d01-ae55a9e5af06	58fe245e-2add-4dcc-ac59-f176016e5319	81bbdadd-9b08-466b-98ca-ed9b412fc534	t	200	5	\N	e920a76d-334a-41f9-8f50-13bf18c1cde0	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-df01-4d01-8d01-ae55a9e5af07	7aafb959-e037-4f81-936b-f937732b3618	abe4a9df-8395-4cfd-a827-7bae591a2811	t	150	6	\N	e920a76d-334a-41f9-8f50-13bf18c1cde0	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
f71a30b0-ee4a-4d36-847a-d0c99134fbb8	eaf98b92-6e46-4527-944c-cc233539e22a	401a9543-da3e-45d1-b960-e87733b0a0c4	t	150	0	\N	d2c24ad8-2f02-451f-bd72-fcec957100a8	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
0128fd40-7958-4cc5-9c73-7ddb7820d3ec	a2ec1f35-b40d-4e5e-bffa-f9b5385498e0	05449e7f-c123-4371-85e6-705da0118859	t	150	1	\N	d2c24ad8-2f02-451f-bd72-fcec957100a8	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
fa480cec-938c-4216-95fe-ba4335e20a41	ea5fb307-082e-4444-912b-c9570c72d8e5	00733e8e-de05-4a3a-bf52-7deea920ceae	t	150	2	\N	d2c24ad8-2f02-451f-bd72-fcec957100a8	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
2c43e4f6-7024-47a0-a91a-7d491b1fac84	a02155ba-6f79-4724-9a1a-9a92747eea13	b3a83c13-0458-4f3b-83d3-e297579752ad	t	150	3	\N	d2c24ad8-2f02-451f-bd72-fcec957100a8	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
69884c47-0c2e-4988-bbc1-23242993634e	fffceb66-3e5d-4185-8f7c-2a0e82845d06	eee0d48c-a10c-4977-8b13-ad63c184359e	t	150	4	\N	d2c24ad8-2f02-451f-bd72-fcec957100a8	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
6189c285-d390-4fd9-ae7a-ca011d8ad98f	e1e6501f-80be-4528-b491-2fa27ad3fe09	9d295698-2354-4548-adce-341e8049ed40	t	150	5	\N	d2c24ad8-2f02-451f-bd72-fcec957100a8	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
45044b65-b17b-468d-a23d-075733c6b631	ccf5dc06-5388-4123-929d-c2bf01e0e0ae	199316df-1211-4a25-8773-fefc327d33e2	t	150	6	\N	d2c24ad8-2f02-451f-bd72-fcec957100a8	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
19079cf6-2a9c-40b9-b6c2-58d63c6e37ad	9a41e644-f3fd-4a37-b949-233ebc02a893	05449e7f-c123-4371-85e6-705da0118859	t	150	1	\N	7948282b-6c30-46be-98f3-c2da5bd06e3b	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	eb8b56e8-5e11-43ac-af4a-43f8a37b02ed	\N	t
280b9097-0bcf-4389-9ee7-fa89990d1369	75183a05-77cf-4b90-ba01-f774d0107f1e	00733e8e-de05-4a3a-bf52-7deea920ceae	t	150	2	\N	7948282b-6c30-46be-98f3-c2da5bd06e3b	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	eb8b56e8-5e11-43ac-af4a-43f8a37b02ed	\N	t
8dd39475-f109-4117-bce4-9e183382b475	b68af7c6-6094-4441-abd7-da20c3b26abd	b3a83c13-0458-4f3b-83d3-e297579752ad	t	150	3	\N	7948282b-6c30-46be-98f3-c2da5bd06e3b	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	eb8b56e8-5e11-43ac-af4a-43f8a37b02ed	\N	t
5136d071-3b11-48cd-b7be-4910bd6264f9	0410aa1a-0f72-490f-aece-cc9be575d8d0	eee0d48c-a10c-4977-8b13-ad63c184359e	t	150	4	\N	7948282b-6c30-46be-98f3-c2da5bd06e3b	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	eb8b56e8-5e11-43ac-af4a-43f8a37b02ed	\N	t
76db0713-06d3-4133-9144-9d0300a2824e	67cf1d90-ebd8-4b58-96da-f512e3f73bd9	9d295698-2354-4548-adce-341e8049ed40	t	150	5	\N	7948282b-6c30-46be-98f3-c2da5bd06e3b	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	eb8b56e8-5e11-43ac-af4a-43f8a37b02ed	\N	t
8636c740-3282-4a6b-99f6-f3f48e59b0af	9a11b467-4309-4665-b831-5f704cdd7ddd	199316df-1211-4a25-8773-fefc327d33e2	t	150	0	\N	7948282b-6c30-46be-98f3-c2da5bd06e3b	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	783bb193-4455-4fe6-a8af-4fa334830e8d	\N	t
cdf294ce-4c52-4987-a301-8219fa81ab2e	806cafe1-12d5-444d-943e-888231fdef51	669101cd-5fa7-40f0-9893-f1cfa3582a06	t	150	1	\N	7948282b-6c30-46be-98f3-c2da5bd06e3b	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	783bb193-4455-4fe6-a8af-4fa334830e8d	\N	t
b86e652b-04ce-4089-9f71-e190eaf5b798	7fbc2485-7e90-4228-af93-ed0594ac7b35	a3ac02f1-25ec-4448-86f8-413a066a775a	t	150	0	\N	8b2de7a0-d103-460e-a7df-be147f8fef76	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
f9f2de0d-3db5-402b-a733-53be6a4667c8	3ec3e08d-d85a-48cf-8af5-3d830c00a227	4a6d34b9-effe-43ca-bde6-488f553fa3ad	t	150	1	\N	8b2de7a0-d103-460e-a7df-be147f8fef76	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
7fb9801d-ca3d-4b2d-8d55-c922fcf7fefd	e8c1f301-f8b0-4243-ba5e-31f0705411b0	0b16c6d5-bf47-4dae-970c-0bd8f7972990	t	150	2	\N	8b2de7a0-d103-460e-a7df-be147f8fef76	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
ca38195e-985c-4880-85e0-26fa143c1ec7	9bdc2c2b-119f-4953-bc3b-8c8d54849837	8e0c330b-f706-4f6f-9580-924c79ca0ed6	t	150	3	\N	8b2de7a0-d103-460e-a7df-be147f8fef76	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
af239abd-2c55-4108-a9d8-b5a67f6ca2e2	6c350760-6da8-4a6b-8a05-daabd5a3b84f	42889cc8-49ff-4826-b1f1-342c78f68e59	t	150	4	\N	8b2de7a0-d103-460e-a7df-be147f8fef76	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
376c7685-9ebe-4c95-b820-424b1c2f264f	f1603c3d-5313-4db3-a12c-9188dda0038f	a3ac02f1-25ec-4448-86f8-413a066a775a	t	150	0	\N	83067e55-7cf9-47e2-a19f-3526a0f90068	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	fbd33fac-150d-499d-991c-b17c6d1bd615	\N	t
166aa5a0-d825-40dc-be6d-e94b87edd56d	8e29aca9-d824-430a-a1d3-c4a71a73ee7d	4a6d34b9-effe-43ca-bde6-488f553fa3ad	t	150	1	\N	83067e55-7cf9-47e2-a19f-3526a0f90068	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	fbd33fac-150d-499d-991c-b17c6d1bd615	\N	t
1910bd21-2472-4a83-b8cd-7de51bdd2675	e6ed49f0-a1de-44c0-9502-454f7b1408b7	0b16c6d5-bf47-4dae-970c-0bd8f7972990	t	150	2	\N	83067e55-7cf9-47e2-a19f-3526a0f90068	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	fbd33fac-150d-499d-991c-b17c6d1bd615	\N	t
9edfbd44-4624-4cf8-b81c-8e169b4e8281	2c70ef09-1d01-44a0-b2d3-8046339ea67a	8e0c330b-f706-4f6f-9580-924c79ca0ed6	t	150	3	\N	83067e55-7cf9-47e2-a19f-3526a0f90068	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	fbd33fac-150d-499d-991c-b17c6d1bd615	\N	t
8651c5c4-db87-427c-8a57-6a9f75c74976	8c5a1e05-d91d-4a6d-8c2b-415fa74df717	42889cc8-49ff-4826-b1f1-342c78f68e59	t	150	0	\N	83067e55-7cf9-47e2-a19f-3526a0f90068	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	fb84dd45-cdbc-4453-9d39-3407d92973bb	\N	t
af4adf31-f698-4aad-9f29-71908924fc9a	41014110-424c-409a-a049-838984be4a23	a6ee096c-43c1-4e64-8cd1-fadb3ccd3993	t	150	1	\N	83067e55-7cf9-47e2-a19f-3526a0f90068	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	fb84dd45-cdbc-4453-9d39-3407d92973bb	\N	t
1251e67a-e795-4bc2-a468-6cfc838b6a0a	135ca99f-e3c6-4374-a404-9027c6e035d0	d455814b-643d-4187-90f2-f90366d57851	t	150	0	\N	d4c040d7-10e5-4891-8f44-794f7a1b8241	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
aff2203d-6439-43b8-9cb4-55e8d78bba43	ee1307ad-f027-41c5-91ed-3042c186be78	409b77a0-fb30-44b8-bf49-c5d8b4f4018b	t	150	1	\N	d4c040d7-10e5-4891-8f44-794f7a1b8241	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
9da7637e-25c7-4101-8169-b5f6ff159690	a9b9892a-38ec-4cfb-b178-2a2200fdce51	d74f88b6-80fb-4a19-ba69-1560f2b7d222	t	150	2	\N	d4c040d7-10e5-4891-8f44-794f7a1b8241	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
d34ed53e-5156-4a18-a8df-572269496aac	3dcf2730-0ab9-461a-83b5-a6a7866ba88b	d455814b-643d-4187-90f2-f90366d57851	t	150	0	\N	6091fd91-4802-45a0-81cd-2552154dbb6c	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	fcafc433-c667-4dea-aa3a-a0008b8a4d8d	\N	t
04f14582-caf9-49ee-81ea-e5d4f977bfe1	51c3a879-9ede-4a80-8f9b-441411d20ca5	409b77a0-fb30-44b8-bf49-c5d8b4f4018b	t	150	1	\N	6091fd91-4802-45a0-81cd-2552154dbb6c	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	fcafc433-c667-4dea-aa3a-a0008b8a4d8d	\N	t
39297559-a747-481e-a4c5-b80b8faf1aac	d51e3aed-38d9-4f0e-bf12-40e20455f7b3	d74f88b6-80fb-4a19-ba69-1560f2b7d222	t	150	0	\N	6091fd91-4802-45a0-81cd-2552154dbb6c	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	9f721383-4257-4273-8f52-7e67d6671531	\N	t
4692eb91-7fc6-4436-9175-87caa5f6b668	e2a6ca67-1315-4630-ab08-255ae81c3d7b	6fb73802-bde8-44a3-9be0-9d76bb6dcb1d	t	150	1	\N	6091fd91-4802-45a0-81cd-2552154dbb6c	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	9f721383-4257-4273-8f52-7e67d6671531	\N	t
72b2d56f-5245-4cb6-933c-3d5031de0778	47412f5d-1a1a-44ab-b84b-68670acd8a7e	13eb85ff-f807-4c51-9e54-ea9b7d8a9f8d	t	150	0	\N	77e465f4-93d5-4e4a-8d8f-143bf00b295d	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
121abdf0-c89f-4313-b156-e8a3c0cb77ec	af28eb8b-7342-454a-8fc0-7f1e4bfe2d03	b7ca047e-f265-4c59-8c82-415ef7296a13	t	150	1	\N	77e465f4-93d5-4e4a-8d8f-143bf00b295d	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
e884a006-e166-434d-82aa-247052165e4d	3a70bc74-5590-40a8-92ae-5410bd851581	eb9862d2-c629-4413-96d5-e48e134c1cd5	t	150	2	\N	77e465f4-93d5-4e4a-8d8f-143bf00b295d	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
d7e705f4-c2be-4f4e-bcc3-1cdc9e07990b	c4641dc0-dff7-444e-97ec-73339b89becd	76b8e1fc-07ca-4e9b-a78b-3840002b3883	t	150	3	\N	77e465f4-93d5-4e4a-8d8f-143bf00b295d	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
afd4f595-c1a7-4afd-b0fd-b2f0b59203c6	0bc5770b-128c-4ad3-99ac-f73e7fa9b5c8	f9e77c8b-6635-41de-8850-f2b3a9c155dc	t	150	4	\N	77e465f4-93d5-4e4a-8d8f-143bf00b295d	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
2fb6ff09-bed5-4b31-af0f-7fa3df5612da	d7a31b84-23ed-4ba9-aa57-6927d48e5bc8	b7ca047e-f265-4c59-8c82-415ef7296a13	t	150	1	\N	3d875b63-fcf3-42db-99d5-3dd0b579a3ae	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	be783081-a7d4-4ced-a48c-0878115a5725	\N	t
ec8a2e3e-0736-41f5-8c8b-d36778d52a94	a55efa98-35c7-41c4-8720-0126aeb2ec23	eb9862d2-c629-4413-96d5-e48e134c1cd5	t	150	2	\N	3d875b63-fcf3-42db-99d5-3dd0b579a3ae	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	be783081-a7d4-4ced-a48c-0878115a5725	\N	t
a68f286c-5d13-4794-9354-e282913930f5	c63d32e6-d049-4e5b-98a4-da9735737083	76b8e1fc-07ca-4e9b-a78b-3840002b3883	t	150	3	\N	3d875b63-fcf3-42db-99d5-3dd0b579a3ae	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	be783081-a7d4-4ced-a48c-0878115a5725	\N	t
8b63749b-922d-4164-b0f4-65d716b3d75d	71a0cd76-f949-49d6-8aab-74a7bd5701a6	f9e77c8b-6635-41de-8850-f2b3a9c155dc	t	150	0	\N	3d875b63-fcf3-42db-99d5-3dd0b579a3ae	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	dbc635cd-ecb4-42fc-878b-75124f377f77	\N	t
2a93e132-3c92-4b94-acf0-076e4af75df2	98c03d8d-8913-41d1-aa63-b1a4f9b3768c	b20b8886-ac87-4270-8405-4c4ca125162e	t	150	1	\N	3d875b63-fcf3-42db-99d5-3dd0b579a3ae	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	dbc635cd-ecb4-42fc-878b-75124f377f77	\N	t
abcbb5d9-b8c2-46bb-b3cc-ea035be8f3be	19399e07-43a6-4f70-8f53-bc14024830ce	d73214e6-dc4d-414e-874e-f171d63c9963	t	150	0	\N	d803d06e-7dae-4e6c-9751-6d76968e2189	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
ca491a31-8659-4202-9476-f0f72efc80b5	ac32ba6e-fefb-4613-a6be-57e69a53cf95	00bb1055-4d42-4ef1-9860-3a9749d3770f	t	150	1	\N	d803d06e-7dae-4e6c-9751-6d76968e2189	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
55b74f7e-7c58-4fce-a44b-a8d9671ec541	2ece9ace-6fd3-42eb-8eb7-24d6a13db4ce	abfafa16-2077-4274-a8b5-5283d6629725	t	150	2	\N	d803d06e-7dae-4e6c-9751-6d76968e2189	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
8d0c8202-b57f-4450-a090-a7eb26aa2299	e48f38ce-2a7e-4b4a-83ad-c470686d66d7	ab8bd762-8ea8-4d05-9f52-48210ca16ff5	t	150	3	\N	d803d06e-7dae-4e6c-9751-6d76968e2189	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
26d0f3f1-43d3-425c-930c-81147451d0f8	aac41122-b630-4d63-87b1-2fbf07d706d0	436823ef-336d-4176-8b8d-084a30001e47	t	150	4	\N	d803d06e-7dae-4e6c-9751-6d76968e2189	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
df62dcbc-c22d-4d34-9fa5-6f70bae02161	028c9539-3cdd-47a8-ae0b-527a4777bc87	75ce68ce-8092-4832-a106-3a6975462adf	t	150	5	\N	d803d06e-7dae-4e6c-9751-6d76968e2189	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
636ff7b6-86b8-49fc-9442-39f4c24ff424	8d187ad9-6c76-4beb-8f67-f39802b740f8	0a0c0c60-ca6a-49a1-b8de-fcb6d8ef1749	t	150	6	\N	d803d06e-7dae-4e6c-9751-6d76968e2189	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
dd8ccf4f-64d7-468c-bc0c-dc4e0efef08d	676bce19-f98a-4f0f-9261-3066c85315df	00bb1055-4d42-4ef1-9860-3a9749d3770f	t	150	1	\N	0bad5d82-019e-4f81-b922-e6e332e1e2bc	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	26cc0c47-2e96-4370-a598-582e42a0e6b9	\N	t
5d1f9a65-85cc-41b2-a8bf-8e2c97aab4b3	a1392dc9-acf6-4a9f-bfbd-8e6b23ab83d3	abfafa16-2077-4274-a8b5-5283d6629725	t	150	2	\N	0bad5d82-019e-4f81-b922-e6e332e1e2bc	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	26cc0c47-2e96-4370-a598-582e42a0e6b9	\N	t
c50748fe-9f54-4e09-b572-111f076ec7db	650704f6-5d4e-42c8-8a61-0b161c266762	ab8bd762-8ea8-4d05-9f52-48210ca16ff5	t	150	3	\N	0bad5d82-019e-4f81-b922-e6e332e1e2bc	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	26cc0c47-2e96-4370-a598-582e42a0e6b9	\N	t
bf2e30dd-df03-4fb2-820a-166a93a2ce2c	3057fc28-c1e9-4722-92c9-8a7af899952a	436823ef-336d-4176-8b8d-084a30001e47	t	150	4	\N	0bad5d82-019e-4f81-b922-e6e332e1e2bc	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	26cc0c47-2e96-4370-a598-582e42a0e6b9	\N	t
00336686-0d63-43e2-b247-599f1227bd85	9e251675-66e2-4f3a-b446-af6134ef5237	75ce68ce-8092-4832-a106-3a6975462adf	t	150	5	\N	0bad5d82-019e-4f81-b922-e6e332e1e2bc	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	26cc0c47-2e96-4370-a598-582e42a0e6b9	\N	t
8d66ecb8-825d-4c6c-91c0-23a82c87ab46	16df4f5e-92f3-428d-aebd-c5e3e65078e9	0a0c0c60-ca6a-49a1-b8de-fcb6d8ef1749	t	150	0	\N	0bad5d82-019e-4f81-b922-e6e332e1e2bc	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	c19be165-55f7-4146-88d3-d1d083aa7f68	\N	t
17c3acfc-71f1-4b3c-820e-aea23871e850	9bf4d67b-c694-4ea2-ab8e-cacb94c78fd8	74b886a3-718b-4913-b855-6ea88e51d3be	t	150	1	\N	0bad5d82-019e-4f81-b922-e6e332e1e2bc	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	c19be165-55f7-4146-88d3-d1d083aa7f68	\N	t
e5f0d32b-2b6a-47bc-b3bd-f32c96594ec1	21af6c4b-112c-4bd8-9e2f-298e4d99d864	038a3b83-315b-4982-aa33-060d991e2957	t	300	0	\N	52946023-ebe2-4595-80aa-23fab1bd1aea	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-df02-4d02-8d02-ae55a9ba2f01	0cf027ee-3710-4ee1-a8be-2de1f4beb6f7	219828ef-70b4-4b54-9a67-34105cb15114	t	150	1	\N	52946023-ebe2-4595-80aa-23fab1bd1aea	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
af2c6ac9-7083-4609-8172-d518441f5e9e	7edec7b6-29b7-46cc-b6a0-b8aaf423212a	ce4278c7-6f3c-4227-b013-9d77eddb8092	t	150	2	\N	52946023-ebe2-4595-80aa-23fab1bd1aea	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-df02-4d02-8d02-ae55a9ba2f02	555f9298-bdc7-485a-8810-c7c19726602c	4646d9b6-d139-45d0-8322-ce83256e9613	t	150	3	\N	52946023-ebe2-4595-80aa-23fab1bd1aea	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af05-4a05-8a05-a0be5a11af00	d46bf659-c8e2-477b-a7f2-6afae1f81fb3	060ef747-7b7a-40b0-a358-4c244e73cbde	t	210	0	\N	11531387-cbd9-4579-94a2-4fececcf3ddd	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af05-4a05-8a05-a0be5a11af01	21eac677-5349-40f8-bf93-bb93e2434fa3	612f3569-317a-43a1-975d-540ec3e6a09c	t	150	1	\N	11531387-cbd9-4579-94a2-4fececcf3ddd	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af05-4a05-8a05-a0be5a11af02	6a515cce-4bfe-4095-a951-bfbc28fe1e67	270762a7-dfb5-4e98-a901-2543768043e6	t	150	2	\N	11531387-cbd9-4579-94a2-4fececcf3ddd	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af05-4a05-8a05-a0be5a11af03	b81a5e52-dd08-49e6-bb32-9dda1a21f100	999c7efb-9f34-467c-b085-af1f7f58eb3d	t	150	3	\N	11531387-cbd9-4579-94a2-4fececcf3ddd	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af05-4a05-8a05-a0be5a11af04	9b35bd9d-0479-4645-b1fa-7be5cb1069ff	f44bc3b5-8eb8-4425-a21b-59536322c915	t	150	4	\N	11531387-cbd9-4579-94a2-4fececcf3ddd	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af05-4a05-8a05-a0be5a115205	414f0c85-92e1-45a8-a070-50cc3c5506a5	270762a7-dfb5-4e98-a901-2543768043e6	t	150	0	\N	24ba15ff-ddbb-45ba-9c12-999990314ac3	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	1b9b4640-6c6f-4726-bd28-65bfb2cc9646	\N	t
20202020-af05-4a05-8a05-a0be5a115204	73516ca4-742e-4d51-8cae-2b35228468d2	612f3569-317a-43a1-975d-540ec3e6a09c	t	150	1	\N	24ba15ff-ddbb-45ba-9c12-999990314ac3	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	1b9b4640-6c6f-4726-bd28-65bfb2cc9646	\N	t
20202020-af05-4a05-8a05-a0be5a115208	0f5ec90e-7b65-4850-b98f-541d17c12190	c33f3c91-9ec9-437f-b923-d7bee9ff46a0	f	150	2	\N	24ba15ff-ddbb-45ba-9c12-999990314ac3	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	1b9b4640-6c6f-4726-bd28-65bfb2cc9646	\N	t
20202020-af05-4a05-8a05-a0be5a115209	130859c9-4ec6-46e0-8619-21d8173d19a8	5b682777-b57c-459a-a909-3900873ef490	f	150	3	\N	24ba15ff-ddbb-45ba-9c12-999990314ac3	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	1b9b4640-6c6f-4726-bd28-65bfb2cc9646	\N	t
20202020-af05-4a05-8a05-a0be5a115202	a7bd2e40-e660-4356-891a-afe6e1f123fd	f44bc3b5-8eb8-4425-a21b-59536322c915	t	150	0	\N	24ba15ff-ddbb-45ba-9c12-999990314ac3	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	4c907a11-fa3c-42c4-82a4-e2235b8cc243	\N	t
20202020-af05-4a05-8a05-a0be5a115203	b5c16b6b-4362-454a-b1b7-f229e9442d17	999c7efb-9f34-467c-b085-af1f7f58eb3d	t	150	1	\N	24ba15ff-ddbb-45ba-9c12-999990314ac3	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	4c907a11-fa3c-42c4-82a4-e2235b8cc243	\N	t
20202020-af05-4a05-8a05-a0be5a115206	d5684b77-f493-4925-a2d4-6b33fac78d49	968499bd-9c3e-4019-b64e-188f4ae31a36	f	150	2	\N	24ba15ff-ddbb-45ba-9c12-999990314ac3	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	4c907a11-fa3c-42c4-82a4-e2235b8cc243	\N	t
20202020-af05-4a05-8a05-a0be5a115207	23ffd4a4-9971-4849-804d-f6dd71b2d35d	b0d2b24e-d4d4-4554-a019-605c8d8d7199	f	150	3	\N	24ba15ff-ddbb-45ba-9c12-999990314ac3	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	4c907a11-fa3c-42c4-82a4-e2235b8cc243	\N	t
f2d912fe-7c6f-4a9c-b808-b7b5a18d2818	b481a9be-3173-4ff3-a83a-9c9ecdb0de7e	496756f5-1089-4bd0-88cc-d953371b7d3a	t	210	0	\N	683bad3e-54bf-4d76-a7e4-3757bfa6fd3d	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
9d4ac173-d32b-4a44-9dbd-8a47ab844f98	99a2b64b-f265-4ee0-bcc9-cbf80e139b63	daff680d-a7fd-4c14-9be5-ba45e510dd32	t	150	1	\N	683bad3e-54bf-4d76-a7e4-3757bfa6fd3d	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
b6f67de5-c5cf-4235-b740-a6a007c8eae3	b0bb6c27-14f1-4366-adce-490d82753281	92596925-815b-41d5-8434-8969a57449ee	t	150	2	\N	683bad3e-54bf-4d76-a7e4-3757bfa6fd3d	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
a9c7f370-4b22-4f29-8e3f-678e91a59576	556f99db-30a8-4ec2-bd35-ce73b7912d75	a116dd6c-217f-4112-ac61-8b75e2f679e0	t	150	3	\N	683bad3e-54bf-4d76-a7e4-3757bfa6fd3d	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
3efeb162-cd03-458b-9c7b-47032d045204	63314380-51c7-4c04-8e05-743904ff443f	28308b78-9d3e-40de-be19-5060f6bd15cf	t	150	4	\N	683bad3e-54bf-4d76-a7e4-3757bfa6fd3d	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af03-4a03-8a03-0aa0b1ca1baf	44215674-b76a-4aa1-a09d-629cd8d193b3	550596f2-be50-4653-808b-2f9e6d9e0034	t	150	0	\N	4f7f5b41-b755-4fba-a55d-e2407b561388	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af03-4a03-8a03-0aa0b1ca1bb0	0056fa88-8394-4c1e-94a6-adedfa89bf0e	098d9623-f9fe-4218-ba8c-6ec048d1fe1b	t	150	1	AVG	4f7f5b41-b755-4fba-a55d-e2407b561388	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af03-4a03-8a03-0aa0b1ca1bb1	2c256254-5aef-4e88-b40a-0efd0f70dcb6	68cf732b-0680-44a7-b323-32b8aeac4738	t	150	2	\N	4f7f5b41-b755-4fba-a55d-e2407b561388	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af03-4a03-8a03-0aa0b1ca1bb2	0284083e-c3c0-41ac-90fb-73d3331e9984	ac063534-c91e-40de-8f37-43d34df17166	t	150	3	MIN	4f7f5b41-b755-4fba-a55d-e2407b561388	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af03-4a03-8a03-0aa0b1ca1bb3	9e8414cf-4a1d-4bdf-89ac-1f44dddc9a5d	58b25376-e2c8-4809-b2e5-f9e8566e8b54	t	150	4	\N	4f7f5b41-b755-4fba-a55d-e2407b561388	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af03-4a03-8a03-0aa0b1ca1bb4	ae1e2f71-d096-4d62-a2e9-b7e6c29112e5	a7ee5091-aff7-40d4-9337-976de32fb5d5	t	150	5	\N	4f7f5b41-b755-4fba-a55d-e2407b561388	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af04-4a04-8a04-0aa0b2ca2baf	83a104f4-2c98-47e0-89a0-f88fcfd6287f	550596f2-be50-4653-808b-2f9e6d9e0034	t	150	0	\N	ae71dfb5-cb76-45fa-a250-0a02ee40f016	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af04-4a04-8a04-0aa0b2ca2bb0	72bd026c-663d-4482-bc0f-9bd93459ef06	098d9623-f9fe-4218-ba8c-6ec048d1fe1b	t	150	1	\N	ae71dfb5-cb76-45fa-a250-0a02ee40f016	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af04-4a04-8a04-0aa0b2ca2bb1	7cf54181-b882-48c5-bf55-6fd73dfe2aee	68cf732b-0680-44a7-b323-32b8aeac4738	t	150	2	\N	ae71dfb5-cb76-45fa-a250-0a02ee40f016	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af04-4a04-8a04-0aa0b2ca2bb2	e08517ff-48d0-4aba-99b0-c3023f33cce7	ac063534-c91e-40de-8f37-43d34df17166	t	150	3	\N	ae71dfb5-cb76-45fa-a250-0a02ee40f016	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af04-4a04-8a04-0aa0b2ca2bb3	7d58f58e-6d9e-4bb3-854d-d52a99a9716a	58b25376-e2c8-4809-b2e5-f9e8566e8b54	t	150	4	\N	ae71dfb5-cb76-45fa-a250-0a02ee40f016	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af04-4a04-8a04-0aa0b2ca2bb4	a0472671-5ed9-4f3f-887c-4ea5906cf6d9	a7ee5091-aff7-40d4-9337-976de32fb5d5	t	150	5	\N	ae71dfb5-cb76-45fa-a250-0a02ee40f016	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af03-4a03-8a03-0aa0b1ca3201	2ec23939-d8a5-4ed4-b482-0668bbb93cd7	098d9623-f9fe-4218-ba8c-6ec048d1fe1b	t	150	0	\N	ed48e600-d403-4626-8209-62da0b7ca4ae	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	045d27f2-1173-45fe-b1b1-80173b3973ba	\N	t
20202020-af03-4a03-8a03-0aa0b1ca3203	63e74103-772f-4e3d-80b2-e99370fc2b84	adb354b9-5400-4e8f-ae82-4d527e6da842	t	150	1	\N	ed48e600-d403-4626-8209-62da0b7ca4ae	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	045d27f2-1173-45fe-b1b1-80173b3973ba	\N	t
20202020-af03-4a03-8a03-0aa0b1ca3202	d8f746a0-d1bf-4daf-8d1a-acb88e93f5dc	ac063534-c91e-40de-8f37-43d34df17166	t	150	2	\N	ed48e600-d403-4626-8209-62da0b7ca4ae	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	045d27f2-1173-45fe-b1b1-80173b3973ba	\N	t
20202020-af03-4a03-8a03-0aa0b1ca320d	f0626398-f362-489d-a005-bc4bbd46d94f	300790e6-877c-445a-aa62-c63836a31943	f	150	4	\N	ed48e600-d403-4626-8209-62da0b7ca4ae	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	045d27f2-1173-45fe-b1b1-80173b3973ba	\N	t
20202020-af03-4a03-8a03-0aa0b1ca320e	2f4462db-62c2-4b40-a1f8-4bc9e8692364	38df3bd7-363b-445c-b0a4-b6d780308eba	f	150	5	\N	ed48e600-d403-4626-8209-62da0b7ca4ae	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	045d27f2-1173-45fe-b1b1-80173b3973ba	\N	t
20202020-af03-4a03-8a03-0aa0b1ca320f	d684b36f-032e-45a2-9849-329aaaf5bd75	55a02f1e-47e3-409a-9acf-35d2f43943b3	f	150	6	\N	ed48e600-d403-4626-8209-62da0b7ca4ae	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	045d27f2-1173-45fe-b1b1-80173b3973ba	\N	t
20202020-af03-4a03-8a03-0aa0b1ca3210	56a5a98e-5130-472a-8926-6ffca5342050	089f6e27-77b1-4c1f-a423-ac4117bcad54	f	150	7	\N	ed48e600-d403-4626-8209-62da0b7ca4ae	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	045d27f2-1173-45fe-b1b1-80173b3973ba	\N	t
20202020-af03-4a03-8a03-0aa0b1ca3204	b58ef149-6fea-44e6-9deb-18451ba5d4de	58b25376-e2c8-4809-b2e5-f9e8566e8b54	t	150	0	\N	ed48e600-d403-4626-8209-62da0b7ca4ae	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	fe43f619-b193-4e75-9f84-43aaf645c9fb	\N	t
20202020-af03-4a03-8a03-0aa0b1ca3205	db7abc13-19a9-4e47-b9f0-77f72756ef51	a7ee5091-aff7-40d4-9337-976de32fb5d5	t	150	1	\N	ed48e600-d403-4626-8209-62da0b7ca4ae	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	fe43f619-b193-4e75-9f84-43aaf645c9fb	\N	t
20202020-af03-4a03-8a03-0aa0b1ca3206	cadc9253-8d22-44db-957a-78741a04c09e	2046bbe4-93d8-4abe-96f2-e393477293c5	t	150	2	\N	ed48e600-d403-4626-8209-62da0b7ca4ae	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	fe43f619-b193-4e75-9f84-43aaf645c9fb	\N	t
20202020-af03-4a03-8a03-0aa0b1ca3207	03639dcd-388d-445d-8f60-63d401fa82d8	fc5acd1f-1ec2-4d24-b1af-ef62be0cf6a0	t	150	0	\N	ed48e600-d403-4626-8209-62da0b7ca4ae	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	1437a9d2-8e12-481a-8afe-10d526ca5654	\N	t
20202020-af03-4a03-8a03-0aa0b1ca3208	03bfa1a9-36fd-4449-8641-40d78d09de74	68cf732b-0680-44a7-b323-32b8aeac4738	t	150	1	\N	ed48e600-d403-4626-8209-62da0b7ca4ae	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	1437a9d2-8e12-481a-8afe-10d526ca5654	\N	t
20202020-af03-4a03-8a03-0aa0b1ca320a	21231920-69ac-4be7-9907-20abd071aebb	12fd1a34-7f9a-45ac-97cb-038546c0aeb9	f	150	2	\N	ed48e600-d403-4626-8209-62da0b7ca4ae	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	1437a9d2-8e12-481a-8afe-10d526ca5654	\N	t
20202020-af03-4a03-8a03-0aa0b1ca320b	cac69b5f-d9c8-499d-a029-7616a1dc923f	1d3e8094-81b3-4697-a0ab-eda0f8781686	f	150	3	\N	ed48e600-d403-4626-8209-62da0b7ca4ae	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	1437a9d2-8e12-481a-8afe-10d526ca5654	\N	t
20202020-af02-4a02-8a02-ae0a1ea11af0	c5982ed0-d6be-406e-9f0e-59c428c6cad2	643bc00b-8772-46ed-bd47-00acc00fb8a5	t	210	0	\N	7765c311-760f-44e9-a7d1-a689f4c8a293	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af02-4a02-8a02-ae0a1ea11af1	a7d59225-f724-44fd-868b-d9bb8db18ef4	0d02b1fa-feb0-48dc-a361-95533309ea0f	t	150	1	COUNT_UNIQUE_VALUES	7765c311-760f-44e9-a7d1-a689f4c8a293	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af02-4a02-8a02-ae0a1ea11af2	e2f99740-12e9-4627-bf9c-d8bc6d4657fc	ea2b28f9-8389-416c-82b1-61cb0a6fc1cf	t	150	2	\N	7765c311-760f-44e9-a7d1-a689f4c8a293	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af02-4a02-8a02-ae0a1ea11af3	291062dc-ca3e-45c6-a165-63b5f0ee388d	a045fbba-8284-497a-bba2-cd71dff54cef	t	150	3	\N	7765c311-760f-44e9-a7d1-a689f4c8a293	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af02-4a02-8a02-ae0a1ea11af4	a09ba9f8-43c2-4d50-801c-8ae928904a94	a431ac64-8f23-4a8b-abfa-1c0185afddbb	t	150	4	PERCENTAGE_EMPTY	7765c311-760f-44e9-a7d1-a689f4c8a293	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af02-4a02-8a02-ae0a1ea11af5	d8422331-7e50-4cad-bae0-31f06dc07672	f19480c3-fb79-4813-8532-8d78dd80c5af	t	150	5	MIN	7765c311-760f-44e9-a7d1-a689f4c8a293	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af02-4a02-8a02-ae0a1ea11af6	b38b4362-a70a-440f-9bc4-89791015d93d	b9c947b4-e238-44ff-89d9-11a2de5ae267	t	150	6	\N	7765c311-760f-44e9-a7d1-a689f4c8a293	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af02-4a02-8a02-ae0a1ea11af7	aa338665-2783-408c-aa98-8e7c37a965fb	4f8fedc8-8be0-4c53-8363-a8b2c6116962	t	150	7	\N	7765c311-760f-44e9-a7d1-a689f4c8a293	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af02-4a02-8a02-ae0a1ea11af8	39da3945-218f-4618-8827-ddb5c702ddd0	32f2fd13-d449-4abf-8f35-f72eb7b44560	t	150	8	\N	7765c311-760f-44e9-a7d1-a689f4c8a293	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af02-4a02-8a02-ae0a1ea11af9	4ec9259f-cf10-415f-b903-a15faed40744	08b80a08-0360-4346-aa0e-a406666210ba	t	150	9	\N	7765c311-760f-44e9-a7d1-a689f4c8a293	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af02-4a02-8a02-ae0a1ea12201	35977b02-05f0-416b-8f44-6890dcef95c0	0d02b1fa-feb0-48dc-a361-95533309ea0f	t	150	0	\N	c949770f-35c2-4d59-ad86-1fb04fcd5e92	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	6bcecd7c-402e-4917-b388-61c3a48bc504	\N	t
20202020-af02-4a02-8a02-ae0a1ea12202	a7b1c542-5b1b-4a54-8702-b1c5cb4fd624	a431ac64-8f23-4a8b-abfa-1c0185afddbb	t	150	1	\N	c949770f-35c2-4d59-ad86-1fb04fcd5e92	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	6bcecd7c-402e-4917-b388-61c3a48bc504	\N	t
20202020-af02-4a02-8a02-ae0a1ea12207	6c5b5689-aa99-489b-b284-83b03b536200	b9c947b4-e238-44ff-89d9-11a2de5ae267	t	150	2	\N	c949770f-35c2-4d59-ad86-1fb04fcd5e92	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	6bcecd7c-402e-4917-b388-61c3a48bc504	\N	t
20202020-af02-4a02-8a02-ae0a1ea12215	36b40750-c037-4357-bbdc-e9f2c0d61d96	5b4c829e-7157-44bf-aae1-ce604f3b9845	f	150	3	\N	c949770f-35c2-4d59-ad86-1fb04fcd5e92	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	6bcecd7c-402e-4917-b388-61c3a48bc504	\N	t
20202020-af02-4a02-8a02-ae0a1ea12216	7251a7bd-82a6-4f46-9b3d-14a37d9881d8	913d6c4e-fbf1-40fa-9338-acd551034541	f	150	4	\N	c949770f-35c2-4d59-ad86-1fb04fcd5e92	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	6bcecd7c-402e-4917-b388-61c3a48bc504	\N	t
20202020-af02-4a02-8a02-ae0a1ea12217	fb0e49f0-602c-4574-ac5f-c0fc3c40c355	9a80f61b-5358-4693-af25-530936e76e7d	f	150	5	\N	c949770f-35c2-4d59-ad86-1fb04fcd5e92	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	6bcecd7c-402e-4917-b388-61c3a48bc504	\N	t
20202020-af02-4a02-8a02-ae0a1ea12219	0fcb8022-ef5e-4312-829f-d3ec25ec4d24	5641f081-6c3e-40d6-891c-67436434c18e	f	150	7	\N	c949770f-35c2-4d59-ad86-1fb04fcd5e92	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	6bcecd7c-402e-4917-b388-61c3a48bc504	\N	t
20202020-af02-4a02-8a02-ae0a1ea1221a	c25da9f8-3e38-41cd-b72d-9d3d5d0d4799	1eb02c97-3929-4260-a36a-d1d781b439e2	f	150	8	\N	c949770f-35c2-4d59-ad86-1fb04fcd5e92	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	6bcecd7c-402e-4917-b388-61c3a48bc504	\N	t
20202020-af02-4a02-8a02-ae0a1ea1221b	0ab31a42-57af-4ca3-8871-af6177eea761	77a457a8-5c65-460f-8602-5293199dee2c	f	150	9	\N	c949770f-35c2-4d59-ad86-1fb04fcd5e92	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	6bcecd7c-402e-4917-b388-61c3a48bc504	\N	t
20202020-af02-4a02-8a02-ae0a1ea1221c	876bb6fc-8e72-46f8-9803-8cba964ead3a	2173b259-899f-4342-b91d-d8d398a855a6	f	150	10	\N	c949770f-35c2-4d59-ad86-1fb04fcd5e92	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	6bcecd7c-402e-4917-b388-61c3a48bc504	\N	t
20202020-af02-4a02-8a02-ae0a1ea12214	84c0ef7e-5d28-400a-9818-ee399f742873	7905e868-5470-44dc-8e22-f3db7cae022d	f	150	11	\N	c949770f-35c2-4d59-ad86-1fb04fcd5e92	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	6bcecd7c-402e-4917-b388-61c3a48bc504	\N	t
20202020-af02-4a02-8a02-ae0a1ea12208	a66e5e19-e398-493b-b1b5-09aa97c80d8e	10e09fbb-ce99-4271-a1bf-3ee3eeb593f7	f	150	12	\N	c949770f-35c2-4d59-ad86-1fb04fcd5e92	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	6bcecd7c-402e-4917-b388-61c3a48bc504	\N	t
20202020-af02-4a02-8a02-ae0a1ea12203	6f3e9fd9-1571-4d8c-a7bf-cf87316d6d64	a045fbba-8284-497a-bba2-cd71dff54cef	t	150	0	\N	c949770f-35c2-4d59-ad86-1fb04fcd5e92	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	927c4d9b-3624-4070-b546-e8d7be010790	\N	t
20202020-af02-4a02-8a02-ae0a1ea12204	c57bca29-d5a0-4392-8584-227f21bd4d47	4f8fedc8-8be0-4c53-8363-a8b2c6116962	t	150	1	\N	c949770f-35c2-4d59-ad86-1fb04fcd5e92	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	927c4d9b-3624-4070-b546-e8d7be010790	\N	t
20202020-af02-4a02-8a02-ae0a1ea12205	bdf1b4c8-62ba-4cda-b499-f1f225c06f13	32f2fd13-d449-4abf-8f35-f72eb7b44560	t	150	0	\N	c949770f-35c2-4d59-ad86-1fb04fcd5e92	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	18d21992-4fb0-45a8-8041-3cd82673a064	\N	t
20202020-af02-4a02-8a02-ae0a1ea12206	55ab56c1-9417-46aa-8215-e19e1eb5e9bf	08b80a08-0360-4346-aa0e-a406666210ba	t	150	1	\N	c949770f-35c2-4d59-ad86-1fb04fcd5e92	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	18d21992-4fb0-45a8-8041-3cd82673a064	\N	t
20202020-af02-4a02-8a02-ae0a1ea12209	6d5f446e-7247-4e6c-b6eb-dd5c252bf344	f19480c3-fb79-4813-8532-8d78dd80c5af	t	150	0	\N	c949770f-35c2-4d59-ad86-1fb04fcd5e92	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	2feb9b66-b2de-42b1-a25e-9e72af919488	\N	t
20202020-af02-4a02-8a02-ae0a1ea12210	79db749d-872d-4234-88eb-41c113b0df3a	ea2b28f9-8389-416c-82b1-61cb0a6fc1cf	t	150	1	\N	c949770f-35c2-4d59-ad86-1fb04fcd5e92	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	2feb9b66-b2de-42b1-a25e-9e72af919488	\N	t
20202020-af02-4a02-8a02-ae0a1ea12212	b88e73d2-9fad-4655-ab41-30f571e9f87c	5cb03ab1-1739-4408-bd99-a263dc5cc9ca	f	150	2	\N	c949770f-35c2-4d59-ad86-1fb04fcd5e92	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	2feb9b66-b2de-42b1-a25e-9e72af919488	\N	t
20202020-af02-4a02-8a02-ae0a1ea12213	649eca45-05b1-4b88-a5c1-e57ed30e6446	aaf0a4d0-8ec1-40ae-aa77-47f2d4289947	f	150	3	\N	c949770f-35c2-4d59-ad86-1fb04fcd5e92	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	2feb9b66-b2de-42b1-a25e-9e72af919488	\N	t
20202020-af06-4a06-8a06-ba5ca11a1eaf	9967fa8e-4d9d-414d-a5c9-3e0f3934aa82	6663c9ab-59e1-4ec0-acd8-4af184e36234	t	210	0	\N	3cc7dca0-b778-4886-a94c-de0f983055b2	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af06-4a06-8a06-ba5ca11a1eb0	029727d3-dc22-4963-a486-04ba7b435768	cbed51ca-e5b9-419b-8040-2bdf34045c99	t	150	2	\N	3cc7dca0-b778-4886-a94c-de0f983055b2	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af06-4a06-8a06-ba5ca11a1eb1	9442909e-e4dc-478b-904b-ce164ebcd108	a99ae526-dca5-4f0f-ad93-7a843e235ea9	t	150	3	\N	3cc7dca0-b778-4886-a94c-de0f983055b2	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af06-4a06-8a06-ba5ca11a1eb2	a4ba6e84-ae18-4b52-9f7f-2385a39fc314	c8b1f455-7aa2-49aa-82ba-2bc90d4e254e	t	150	4	\N	3cc7dca0-b778-4886-a94c-de0f983055b2	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af06-4a06-8a06-ba5ca11a1eb3	b4654051-d0cf-4e2b-9e59-920c6c9056ae	1201d175-702c-4239-a2b6-5994cecbd9e3	t	150	5	\N	3cc7dca0-b778-4886-a94c-de0f983055b2	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af06-4a06-8a06-ba5ca11a1eb4	a704ad30-82bf-4553-9edd-785590d259b8	1a641c8f-05e2-47d2-89dc-92cb49b71b9e	t	150	6	\N	3cc7dca0-b778-4886-a94c-de0f983055b2	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af06-4a06-8a06-ba5ca11a1eb5	59ab752f-c1ba-460b-bdbb-0c5ae016bb4d	05e0bf33-79e1-4518-bc04-0d8d272cbd9c	t	150	7	\N	3cc7dca0-b778-4886-a94c-de0f983055b2	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af06-4a06-8a06-ba5ca11a1eb6	7f871214-a50a-4d47-9390-ac825bb600d0	5bfa3350-9b01-4f20-a849-eaef691891e3	t	150	8	\N	3cc7dca0-b778-4886-a94c-de0f983055b2	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af08-4a08-8a08-ba5cba5babf0	037f9aa3-d330-42ca-aed6-36a7f2bb4f6a	6663c9ab-59e1-4ec0-acd8-4af184e36234	t	210	0	\N	13945e81-0b8b-4327-a667-aa1d2f4a2e66	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af08-4a08-8a08-ba5cba5babf1	7a16a520-8bb2-4dee-b963-6fdc91daa8ce	cbed51ca-e5b9-419b-8040-2bdf34045c99	t	150	2	\N	13945e81-0b8b-4327-a667-aa1d2f4a2e66	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af08-4a08-8a08-ba5cba5babf2	88c84d0a-0859-4f34-b12a-09a492e4db8e	1201d175-702c-4239-a2b6-5994cecbd9e3	t	150	3	\N	13945e81-0b8b-4327-a667-aa1d2f4a2e66	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af08-4a08-8a08-ba5cba5babf3	fd1ac105-038c-4341-b4c6-00254a381dc3	1a641c8f-05e2-47d2-89dc-92cb49b71b9e	t	150	4	\N	13945e81-0b8b-4327-a667-aa1d2f4a2e66	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af08-4a08-8a08-ba5cba5babf4	4d15d8ab-a911-47b3-9dc2-380b9054e60b	5bfa3350-9b01-4f20-a849-eaef691891e3	t	150	6	\N	13945e81-0b8b-4327-a667-aa1d2f4a2e66	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af07-4a07-8a07-ba5ca551aaed	3469bbd1-af68-46ab-9ea8-4646697eac48	6663c9ab-59e1-4ec0-acd8-4af184e36234	t	210	0	\N	db7d7e8d-10ef-4b03-aa68-775b73f78e8c	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af07-4a07-8a07-ba5ca551aaee	4922bc5f-967c-44b0-a3ad-cdc9d00e4919	a99ae526-dca5-4f0f-ad93-7a843e235ea9	t	150	3	\N	db7d7e8d-10ef-4b03-aa68-775b73f78e8c	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af07-4a07-8a07-ba5ca551aaef	ecb1d935-a8a2-4e32-98a8-53439d9f8fa9	c8b1f455-7aa2-49aa-82ba-2bc90d4e254e	t	150	4	\N	db7d7e8d-10ef-4b03-aa68-775b73f78e8c	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af07-4a07-8a07-ba5ca551aaf0	a576cd10-4fe4-41b2-b288-8a0c8af35bc2	1201d175-702c-4239-a2b6-5994cecbd9e3	t	150	5	\N	db7d7e8d-10ef-4b03-aa68-775b73f78e8c	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af07-4a07-8a07-ba5ca551aaf1	dcdeca76-5f58-40fb-a438-6b1aea693afa	1a641c8f-05e2-47d2-89dc-92cb49b71b9e	t	150	6	\N	db7d7e8d-10ef-4b03-aa68-775b73f78e8c	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af07-4a07-8a07-ba5ca551aaf2	bd0e77b1-56e9-43ee-bfb8-5b751c3fd279	05e0bf33-79e1-4518-bc04-0d8d272cbd9c	t	150	7	\N	db7d7e8d-10ef-4b03-aa68-775b73f78e8c	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af07-4a07-8a07-ba5ca551aaf3	18565772-2405-4a84-ae8a-c672319adaaf	5bfa3350-9b01-4f20-a849-eaef691891e3	t	150	8	\N	db7d7e8d-10ef-4b03-aa68-775b73f78e8c	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af06-4a06-8a06-ba5ca11a6202	8a00ce1c-9180-4a7d-a9c1-be5b1af3e776	1201d175-702c-4239-a2b6-5994cecbd9e3	t	150	0	\N	905fa722-5afd-4b81-ba82-ae14fb9b928c	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	7d31ef7b-0153-4fdd-9410-236632a93612	\N	t
20202020-af06-4a06-8a06-ba5ca11a6203	36df788e-0fd5-4d8a-95c7-6b1362fe7dee	cbed51ca-e5b9-419b-8040-2bdf34045c99	t	150	1	\N	905fa722-5afd-4b81-ba82-ae14fb9b928c	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	7d31ef7b-0153-4fdd-9410-236632a93612	\N	t
20202020-af06-4a06-8a06-ba5ca11a6204	b9002b1a-6e4a-4225-9b92-bf246eb5f4f5	1a641c8f-05e2-47d2-89dc-92cb49b71b9e	t	150	2	\N	905fa722-5afd-4b81-ba82-ae14fb9b928c	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	7d31ef7b-0153-4fdd-9410-236632a93612	\N	t
20202020-af06-4a06-8a06-ba5ca11a6208	82f0130b-441c-42c3-97d7-d8d1c9879af4	05e0bf33-79e1-4518-bc04-0d8d272cbd9c	t	150	3	\N	905fa722-5afd-4b81-ba82-ae14fb9b928c	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	7d31ef7b-0153-4fdd-9410-236632a93612	\N	t
20202020-af06-4a06-8a06-ba5ca11a6207	8469972d-f3ad-47f3-987f-230588fc8502	a99ae526-dca5-4f0f-ad93-7a843e235ea9	t	150	4	\N	905fa722-5afd-4b81-ba82-ae14fb9b928c	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	7d31ef7b-0153-4fdd-9410-236632a93612	\N	t
20202020-af06-4a06-8a06-ba5ca11a620b	be63c556-b7ee-4937-b960-67c3fab896eb	f726d24e-3c6e-4bdf-a77a-1c7d6bbb31a3	f	150	5	\N	905fa722-5afd-4b81-ba82-ae14fb9b928c	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	7d31ef7b-0153-4fdd-9410-236632a93612	\N	t
20202020-af06-4a06-8a06-ba5ca11a620c	1bac3ce1-8972-490c-ab80-502cb347a327	0001ac53-87a7-4ff7-8e0b-94789d19eda0	f	150	6	\N	905fa722-5afd-4b81-ba82-ae14fb9b928c	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	7d31ef7b-0153-4fdd-9410-236632a93612	\N	t
20202020-af06-4a06-8a06-ba5ca11a6205	cf76c9c6-0edf-4c46-b4c3-5ec01741a6f7	5bfa3350-9b01-4f20-a849-eaef691891e3	t	150	0	\N	905fa722-5afd-4b81-ba82-ae14fb9b928c	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	928706a2-e79f-41a4-bc1f-cacf5de454ce	\N	t
20202020-af06-4a06-8a06-ba5ca11a6206	f94c0bfc-8cc3-4298-9275-81bc218158ca	c8b1f455-7aa2-49aa-82ba-2bc90d4e254e	t	150	1	\N	905fa722-5afd-4b81-ba82-ae14fb9b928c	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	928706a2-e79f-41a4-bc1f-cacf5de454ce	\N	t
20202020-af06-4a06-8a06-ba5ca11a6209	1699c8e3-6b2e-4c6a-b384-fb2203387079	a7b5c198-9331-475a-98ee-4f31cb56b992	f	150	2	\N	905fa722-5afd-4b81-ba82-ae14fb9b928c	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	928706a2-e79f-41a4-bc1f-cacf5de454ce	\N	t
20202020-af06-4a06-8a06-ba5ca11a620a	7f5521b1-35d0-4fef-8bea-695c71cfa27f	b3696dbe-7017-4075-ba7e-004aef2f80c1	f	150	3	\N	905fa722-5afd-4b81-ba82-ae14fb9b928c	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	928706a2-e79f-41a4-bc1f-cacf5de454ce	\N	t
a49287c9-8aa6-4fca-9ec5-08d643f7239f	8939a877-c036-4d99-9314-0954d07dfda5	f11a7959-f6d3-4bf3-b85c-d2a24e3c3d8a	t	210	0	\N	8a14da15-956c-43da-84b5-c0ebf04ce41a	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
1f79839e-42f6-4a69-839a-369e21a7497d	5ea69f5d-3a9d-487f-bdd5-b1464e56506d	0ad97923-b3dc-4dab-af95-5e487949a35f	t	150	1	\N	8a14da15-956c-43da-84b5-c0ebf04ce41a	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
cadc7a33-1527-4ef8-ac00-7ed0b54d1bae	50943e3f-ab67-473b-b355-47965f877f5e	7039ad06-78a1-4f9b-92a6-f6d2db8f5653	t	150	2	\N	8a14da15-956c-43da-84b5-c0ebf04ce41a	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
e9fa1305-4ba2-41c5-9198-fdc622b69f90	7e09dda5-e9d2-4df1-9c80-87559ea953f8	334625c7-9fe4-4a7e-b8ac-dcfacb1c4d25	t	150	3	\N	8a14da15-956c-43da-84b5-c0ebf04ce41a	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
526f3354-34d6-4e7e-a870-5f99c28353c2	9d99ea6e-c2ff-4b52-b6fa-c51a8fe279b3	0c24b242-9fda-4189-8779-afb446ca0d2b	t	150	4	\N	8a14da15-956c-43da-84b5-c0ebf04ce41a	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-bf01-4b01-8b01-ba5cc01aa011	495eff6f-a796-4e2a-9beb-40f48b7e8fd1	64022fb2-0733-4676-b365-eb1383b031d2	t	210	0	\N	602c03e2-79bf-4652-926c-90cd23812d8c	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-bf01-4b01-8b01-ba5cc01aa012	746e73e9-c8cd-4b1f-a31a-0a6c80b75f03	c5590fe1-039b-4655-a029-ed1191a1228f	t	150	1	\N	602c03e2-79bf-4652-926c-90cd23812d8c	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
37b38a8b-abd7-4f72-92d2-ad82bbef0296	8e5c51ed-b5b4-44e3-a2cc-159134752e63	5e6cd9bd-9f3a-46c5-adf2-afc15f8560f9	t	150	2	\N	602c03e2-79bf-4652-926c-90cd23812d8c	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
2015825f-0786-4b0d-88a7-dfce1b4b1c1a	3e5ac887-9cb1-4553-9af3-91137c090cec	bb5e8c18-22f2-47c3-8556-3dd2997d9ad9	t	150	3	\N	602c03e2-79bf-4652-926c-90cd23812d8c	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
f7b5ced9-eba6-4454-8849-7a92d27c11ca	6a8a98c7-0e79-462d-a19a-68cc8caad7e7	e10b8c81-a73c-40c3-9a30-fd7aefe2405f	t	150	4	\N	602c03e2-79bf-4652-926c-90cd23812d8c	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
3899138d-e6fa-414c-9432-214c9b797ebb	02fcab1c-c964-45c2-809f-cec561a6e68a	0e2fe8e7-4043-4e50-872c-cbd97e12f823	t	150	5	\N	602c03e2-79bf-4652-926c-90cd23812d8c	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
ab74ed52-0195-4b65-987a-8367c07ee222	a518a00d-94a2-453e-b940-d579ca57c8f9	85977dc6-1954-4150-8a54-df245c56fdab	t	150	6	\N	602c03e2-79bf-4652-926c-90cd23812d8c	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
d2c3ddc3-afad-40b9-a2cb-d2765f2f5691	5c234e25-9542-4d77-a3a2-552e989e82bd	4f65c2b1-6a3c-4f68-beb2-6355e08c7c14	t	150	7	\N	602c03e2-79bf-4652-926c-90cd23812d8c	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
4a7e3213-afd5-4691-8bba-0a10e8697afb	86a2a998-de00-4897-b60c-963fed7a5bba	fe524c8a-7374-4930-b0f2-43e4e64160fe	t	150	8	\N	602c03e2-79bf-4652-926c-90cd23812d8c	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
97910946-04f0-4634-804e-880bc0019225	89da4138-1ba5-4ff3-a111-7f9d15bbe9e5	1fe9ea4b-fc48-43d8-88e7-1bb880d1ed35	t	150	9	\N	602c03e2-79bf-4652-926c-90cd23812d8c	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
538847e8-ab09-407c-a433-505f6d7be7a1	1fbd562b-042e-420e-8755-22b708bffd69	468c0533-dc1e-4ca9-8a33-f0e98c58999e	t	150	10	\N	602c03e2-79bf-4652-926c-90cd23812d8c	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-bf01-4b01-8b01-ba5cc01aa013	77ebe7d1-d2af-4f16-8e71-2b646ceee53c	bb16eb12-13a0-4abd-a0f6-30201292484a	t	150	11	\N	602c03e2-79bf-4652-926c-90cd23812d8c	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af09-4a09-8a09-a0bcf10aa11a	67f537b0-e429-4aa4-a5f9-80cbd4660966	f07e2729-d9af-40dd-b837-3e31e8028a98	t	150	0	\N	3b257b26-5529-415a-b36e-1891dd7c1ccd	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af09-4a09-8a09-a0bcf10aa11b	5727855d-c179-4678-aa18-b0b99032cd18	a8bd8932-3af3-4070-a9cb-64e58e6729f6	t	150	1	\N	3b257b26-5529-415a-b36e-1891dd7c1ccd	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af09-4a09-8a09-a0bcf10aa11c	c0b25ce9-568b-403a-b584-1ac1169b137e	a6a0162d-7eaa-47d6-bb1b-4e10807afb61	t	150	2	\N	3b257b26-5529-415a-b36e-1891dd7c1ccd	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af09-4a09-8a09-a0bcf10aa11d	4b91351d-52aa-4e6c-85b2-783ef16de51d	feb38287-ad4c-4fd1-b631-cff0ae830f07	t	150	3	\N	3b257b26-5529-415a-b36e-1891dd7c1ccd	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af09-4a09-8a09-a0bcf10aa11e	466a7e33-7ccc-4269-ba94-29f4df5539aa	392a39d5-ef32-4e94-adba-c53c53431037	t	150	4	\N	3b257b26-5529-415a-b36e-1891dd7c1ccd	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af09-4a09-8a09-a0bcf10aa11f	e65a2c03-c84c-4ec3-b6bc-ea7ae9f77025	9a031255-606d-49c1-afea-7aad7ddd841f	t	150	5	\N	3b257b26-5529-415a-b36e-1891dd7c1ccd	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
689b4749-aa40-489a-bf0b-475a197ca2e6	763641aa-175c-43aa-a8e5-8ecd6c9b26f8	794053a0-1aae-464c-971d-ea5b49d93c87	t	150	0	\N	2ae7521e-e504-4635-b894-e508e2cd25bc	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
e5a46195-06fe-4f47-8844-128e35151d37	7d4fc6e1-2890-494e-9a5a-6460f4954442	57f637a3-3e2e-4581-b4f1-6b938c95eebd	t	150	1	\N	2ae7521e-e504-4635-b894-e508e2cd25bc	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
bb35e66a-2a1e-416b-8105-5749d91ab65f	1b7966ab-becb-4124-881f-9e1e8aad5b96	259969d1-1fbf-4d8f-8d29-2a4b7f54f010	t	150	2	\N	2ae7521e-e504-4635-b894-e508e2cd25bc	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
3b3a0cf7-f171-4ad8-9aad-aed84eca0250	6f63de49-00d2-46a9-b686-0ca56a66f301	794053a0-1aae-464c-971d-ea5b49d93c87	t	150	0	\N	21665928-421d-4110-9dec-493ce2e838f9	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	ceaaa62a-f46f-4511-a8f0-594be53584d3	\N	t
ddc5a9f6-f577-4e4b-a258-3d656c32babc	c73d6a5c-5850-448c-abf4-f6e428d12c6f	57f637a3-3e2e-4581-b4f1-6b938c95eebd	t	150	1	\N	21665928-421d-4110-9dec-493ce2e838f9	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	ceaaa62a-f46f-4511-a8f0-594be53584d3	\N	t
98ef45e8-c6bf-42e6-96f6-e94cd17911bc	d425679f-b04e-42ae-a000-787457803dc0	259969d1-1fbf-4d8f-8d29-2a4b7f54f010	t	150	0	\N	21665928-421d-4110-9dec-493ce2e838f9	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	9cff2620-26fc-4f01-9887-11b89ecdebdf	\N	t
d3933427-de7f-4fa1-b80c-47302273d848	1eae8af2-f4ca-4822-9c3d-ef6b4c47fa5d	cedac3b2-acfd-4438-b360-d46c2f5e416c	t	150	1	\N	21665928-421d-4110-9dec-493ce2e838f9	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	9cff2620-26fc-4f01-9887-11b89ecdebdf	\N	t
20202020-af11-4a11-8a11-a0bcf10abcaf	33a4bb7b-7311-419c-ac99-a5dbecd7add4	b5ed8ed4-8c72-499c-b17e-35f2eeb3a9f5	t	150	0	\N	39823c45-8f49-4884-8af5-b56e7832d795	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af11-4a11-8a11-a0bcf10abcb0	929f5c94-a451-4c57-a964-c676099538a1	bfbcf2ce-5ff0-4dc1-a799-1943f4eda720	t	150	1	\N	39823c45-8f49-4884-8af5-b56e7832d795	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af11-4a11-8a11-a0bcf10abcb1	b316bcc0-50b1-42e6-8887-89063d53861a	d57949a5-3b30-465c-9f20-1d879d020050	t	150	2	\N	39823c45-8f49-4884-8af5-b56e7832d795	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af11-4a11-8a11-a0bcf10abcf6	a72dc9c4-f026-493a-a996-fa73c033142a	d57949a5-3b30-465c-9f20-1d879d020050	t	150	1	\N	f51f99d4-e900-465a-968b-5d5819069b53	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	2e217b3c-1317-49f2-a93d-ecc506987f28	\N	t
20202020-af11-4a11-8a11-a0bcf10abcf7	596bc3a8-cd54-424a-92b7-d3f49c1ea0de	bfbcf2ce-5ff0-4dc1-a799-1943f4eda720	t	150	2	\N	f51f99d4-e900-465a-968b-5d5819069b53	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	2e217b3c-1317-49f2-a93d-ecc506987f28	\N	t
20202020-af11-4a11-8a11-a0bcf10abcf8	35b97c78-462b-4970-a487-6158db5d6270	60e0339f-0c06-4d94-a3f4-3d8e2387eb09	t	150	3	\N	f51f99d4-e900-465a-968b-5d5819069b53	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	2e217b3c-1317-49f2-a93d-ecc506987f28	\N	t
20202020-af11-4a11-8a11-a0bcf10abcf9	38dedd2c-e8bf-4ee7-b44d-e7bebb2b0aa8	cdbf5216-6711-4bc7-bd98-de556d768a6d	t	150	4	\N	f51f99d4-e900-465a-968b-5d5819069b53	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	2e217b3c-1317-49f2-a93d-ecc506987f28	\N	t
20202020-af11-4a11-8a11-a0bcf10abcfa	f2f9029b-83b0-4919-b6a8-4fe9e7822f41	f699a7b3-aa54-4dbb-a995-209dff601f08	t	150	5	\N	f51f99d4-e900-465a-968b-5d5819069b53	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	2e217b3c-1317-49f2-a93d-ecc506987f28	\N	t
20202020-af11-4a11-8a11-a0bcf10abcfb	a939d302-d9eb-4869-951e-a745a7549bef	0d1df512-322b-4393-a550-020136106c56	t	150	0	\N	f51f99d4-e900-465a-968b-5d5819069b53	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	7424afef-7c18-4bb5-b7a6-7124c229caae	\N	t
20202020-af11-4a11-8a11-a0bcf10abcfc	2403f18b-d8f3-425f-8e95-1d151687cfcb	87347a47-0d27-4eeb-9401-b53f14a5bc31	t	150	1	\N	f51f99d4-e900-465a-968b-5d5819069b53	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	7424afef-7c18-4bb5-b7a6-7124c229caae	\N	t
20202020-af11-4a11-8a11-a0bcf10abcfd	b40b85b9-85e9-498b-afcf-d2b43a77faeb	a994647f-0433-4421-b730-d8f6b71da741	f	150	9	\N	f51f99d4-e900-465a-968b-5d5819069b53	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	2e217b3c-1317-49f2-a93d-ecc506987f28	\N	t
20202020-af11-4a11-8a11-a0bcf10abd01	52cd2bff-4ba2-4577-876b-17ee4ae469f6	66b605a5-e513-4a84-aaee-e067e8042940	t	150	6	\N	f51f99d4-e900-465a-968b-5d5819069b53	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	2e217b3c-1317-49f2-a93d-ecc506987f28	\N	t
20202020-af11-4a11-8a11-a0bcf10abd02	bd6692fb-6423-44f8-ae50-05af81d26ad1	14982767-b8f0-483f-8d06-345f909ad6cb	f	150	2	\N	f51f99d4-e900-465a-968b-5d5819069b53	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	7424afef-7c18-4bb5-b7a6-7124c229caae	\N	t
20202020-af11-4a11-8a11-a0bcf10abd03	130f363a-02e8-4d7e-9140-06be05bc1570	bfb9b231-2885-4aa7-b3af-293af2fd0b8b	f	150	3	\N	f51f99d4-e900-465a-968b-5d5819069b53	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	7424afef-7c18-4bb5-b7a6-7124c229caae	\N	t
20202020-af11-4a11-8a11-a0bcf10abd05	51f238ff-5fd8-40e6-8f4f-b1b205210d1a	0505a05f-c155-449a-87bf-79a53c2e4f06	f	150	8	\N	f51f99d4-e900-465a-968b-5d5819069b53	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	2e217b3c-1317-49f2-a93d-ecc506987f28	\N	t
20202020-af10-4a10-8a10-a0bcf10aaeaf	bd8f2782-1d95-4862-ae7c-cc79723ec6b3	807e5d28-3977-4723-95cf-ab69bd3f76e0	t	150	0	\N	eca9d69c-4577-40a9-b068-b59a800bdfbd	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af10-4a10-8a10-a0bcf10aaeb0	bae86277-649a-45ed-b7d9-aef21e1b028c	fd7c4c80-01c7-4736-a495-ee703a78dcbf	t	150	1	\N	eca9d69c-4577-40a9-b068-b59a800bdfbd	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af10-4a10-8a10-a0bcf10aaeb1	4e9229a4-a435-4fc4-9135-bc6e50b49fa1	4b98fcdc-aa4f-4fa6-b666-282891c18d43	t	150	2	\N	eca9d69c-4577-40a9-b068-b59a800bdfbd	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af10-4a10-8a10-a0bcf10aaeb2	8a28402f-e531-4a0c-963c-2e7151a69784	6e233089-4495-4b9a-8c3e-4a374d0e5d57	t	150	3	\N	eca9d69c-4577-40a9-b068-b59a800bdfbd	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af10-4a10-8a10-a0bcf10aaeb3	74065d9a-3c8c-41eb-9fec-0e512acbcaa0	e528b0eb-3b76-4745-bc4a-127501de555c	t	150	4	\N	eca9d69c-4577-40a9-b068-b59a800bdfbd	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-af10-4a10-8a10-a0bcf10aaef6	cf32a7e7-3ef1-489a-9c8e-240ca9ab244e	4b98fcdc-aa4f-4fa6-b666-282891c18d43	t	150	1	\N	36158a62-099d-4ab0-a3c8-aa01c7f590f1	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	76fcb404-e441-416e-b73b-252369a355da	\N	t
20202020-af10-4a10-8a10-a0bcf10aaef7	e29d3974-ab76-420f-8a75-d43b1f2f9b40	fd7c4c80-01c7-4736-a495-ee703a78dcbf	t	150	2	\N	36158a62-099d-4ab0-a3c8-aa01c7f590f1	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	76fcb404-e441-416e-b73b-252369a355da	\N	t
20202020-af10-4a10-8a10-a0bcf10aaef8	c3d94dfb-096c-4b42-8fe0-14673d5d1d51	3aff55f0-4487-4ac7-8812-a157d53cfa66	t	150	3	\N	36158a62-099d-4ab0-a3c8-aa01c7f590f1	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	76fcb404-e441-416e-b73b-252369a355da	\N	t
20202020-af10-4a10-8a10-a0bcf10aaef9	4cd7d06f-1805-4eda-a582-1bc0aea4b1fb	80e08f12-8afa-4032-bbfd-e542d130a1fe	t	150	0	\N	36158a62-099d-4ab0-a3c8-aa01c7f590f1	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	e3d91fc3-f5af-4e78-bb7d-21130359555d	\N	t
20202020-af10-4a10-8a10-a0bcf10aaefa	0f59c6f0-bf48-456d-b9d4-c439730c45e2	7599d2e1-e1bf-4f0c-88aa-1ad0bd7af903	f	150	7	\N	36158a62-099d-4ab0-a3c8-aa01c7f590f1	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	76fcb404-e441-416e-b73b-252369a355da	\N	t
20202020-af10-4a10-8a10-a0bcf10aaefb	f44367c7-9b61-467e-831e-55e4b2cd1f1a	3a962b3b-e171-42b6-9348-060308d31793	f	150	1	\N	36158a62-099d-4ab0-a3c8-aa01c7f590f1	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	e3d91fc3-f5af-4e78-bb7d-21130359555d	\N	t
20202020-af10-4a10-8a10-a0bcf10aaefc	4564c995-0166-4e04-aadd-73a1101b6226	6e233089-4495-4b9a-8c3e-4a374d0e5d57	f	150	2	\N	36158a62-099d-4ab0-a3c8-aa01c7f590f1	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	e3d91fc3-f5af-4e78-bb7d-21130359555d	\N	t
20202020-af10-4a10-8a10-a0bcf10aaefd	86538011-8b25-41aa-a5f7-0afd9cbb4129	5f54e1b0-d776-4f27-91a7-1bd552f6e986	f	150	3	\N	36158a62-099d-4ab0-a3c8-aa01c7f590f1	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	e3d91fc3-f5af-4e78-bb7d-21130359555d	\N	t
20202020-af10-4a10-8a10-a0bcf10aaefe	242cf194-d02c-4f02-a810-bd7edbf4297f	e528b0eb-3b76-4745-bc4a-127501de555c	f	150	4	\N	36158a62-099d-4ab0-a3c8-aa01c7f590f1	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	76fcb404-e441-416e-b73b-252369a355da	\N	t
20202020-af10-4a10-8a10-a0bcf10aaf01	ed1ed0b0-f4b3-400f-be0d-3a789e6941c0	c22f29f6-f0d2-4b28-8581-721be7a35a2b	f	150	6	\N	36158a62-099d-4ab0-a3c8-aa01c7f590f1	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	76fcb404-e441-416e-b73b-252369a355da	\N	t
20202020-ef01-4e01-8e01-a0bcaeabe1f0	40dc364f-3cd6-4128-8cf9-2bab09a0f66a	a10e8873-0026-486c-a0e5-72a1f31b2f34	t	210	0	\N	42f23f3c-a663-419a-83ff-44e267f7cb30	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
20202020-ef01-4e01-8e01-a0bcaeabe1f8	d4ba6513-0cf4-4257-8c28-bd56257c468f	2a984736-b2e5-495e-9a68-3004d2f86262	t	150	1	\N	42f23f3c-a663-419a-83ff-44e267f7cb30	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
8a0503f3-ba61-453e-86dc-6c79f7bc235b	502fa96c-e475-4477-b034-614ff0964668	07a8067b-aff3-4d27-9dde-e2bda38e9d12	t	150	2	\N	42f23f3c-a663-419a-83ff-44e267f7cb30	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
af16226e-6375-4676-8bd9-9d1a57076fc4	917f5449-a8e1-49b3-904c-00a0c4a7418e	65041402-8e7a-4d47-89df-82cb2f62b785	t	150	3	\N	42f23f3c-a663-419a-83ff-44e267f7cb30	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
37e11429-7802-4e1a-8d90-fcc672786347	c8d2683f-9c16-465a-b927-17d05430af4a	b86917ba-ac12-4ef5-b919-1dcbc394c8ec	t	180	0	\N	af757748-e028-4b15-ab5a-e4bf7b7104b8	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 12:15:04.227+00	2026-04-25 12:15:04.227+00	\N	8c07d085-7bf4-4849-934d-3c70dcf4340d	\N	\N	t
2b337211-5911-4781-babd-eb5133924a4f	bd9e22b1-ad5f-4e9f-b7b9-f0d60cdd8e24	e04aa62b-87c8-4120-be6b-7ffe9a1e61b9	t	180	1	\N	af757748-e028-4b15-ab5a-e4bf7b7104b8	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 12:15:04.227+00	2026-04-25 12:15:04.227+00	\N	8c07d085-7bf4-4849-934d-3c70dcf4340d	\N	\N	t
f2e44024-5f48-4962-9980-391b635e9876	bff16abf-2f36-42f9-a922-3b413df92a7e	a0c251b8-41ee-4d21-94ab-bd3f35bbf304	t	180	2	\N	af757748-e028-4b15-ab5a-e4bf7b7104b8	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 12:15:04.227+00	2026-04-25 12:15:04.227+00	\N	8c07d085-7bf4-4849-934d-3c70dcf4340d	\N	\N	t
69901d07-e490-4683-bbd6-79764b7aca3d	8504d583-5412-48fd-adac-ef3a66519d33	ff2e5736-06f4-4acc-9ef8-b0efdd6a39fa	t	180	3	\N	af757748-e028-4b15-ab5a-e4bf7b7104b8	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 12:15:04.227+00	2026-04-25 12:15:04.227+00	\N	8c07d085-7bf4-4849-934d-3c70dcf4340d	\N	\N	t
840c9de3-c5c2-4cbe-b574-d3879826bafb	def96b60-7fda-448c-b198-d41fdee5267e	392016ef-5c6b-4c65-a6b3-f1de739e63dc	t	180	4	\N	af757748-e028-4b15-ab5a-e4bf7b7104b8	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 12:15:04.227+00	2026-04-25 12:15:04.227+00	\N	8c07d085-7bf4-4849-934d-3c70dcf4340d	\N	\N	t
a5377bbc-c632-41b2-b6d3-0b205c29bee9	a03126b1-9162-4f44-a462-f064c9b1c25e	e04aa62b-87c8-4120-be6b-7ffe9a1e61b9	t	180	0	\N	74054fef-1f89-468b-87a1-c85006b8b973	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 12:15:04.773+00	2026-04-25 12:15:04.773+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
7d999e40-ad14-4469-9d78-aaa043287943	55d616ce-dd04-4a20-b417-ba8980bbd8f7	a0c251b8-41ee-4d21-94ab-bd3f35bbf304	t	180	1	\N	74054fef-1f89-468b-87a1-c85006b8b973	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 12:15:04.773+00	2026-04-25 12:15:04.773+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
28b3be63-ea21-4020-9177-34a1bccdde03	ac20f47e-7d1d-40f0-9e92-30ebc37f6b1f	ff2e5736-06f4-4acc-9ef8-b0efdd6a39fa	t	180	2	\N	74054fef-1f89-468b-87a1-c85006b8b973	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 12:15:04.773+00	2026-04-25 12:15:04.773+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
ba3aa3da-472e-4e0c-81a8-b5fb3944b906	a7a1a799-be3c-4099-93b9-10ad9b192446	392016ef-5c6b-4c65-a6b3-f1de739e63dc	t	180	3	\N	74054fef-1f89-468b-87a1-c85006b8b973	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 12:15:04.773+00	2026-04-25 12:15:04.773+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
ac40b43b-eef9-40c1-9b1d-ef83e565a5d4	a54a3598-6fe4-44f2-aca5-541ca97f11ed	543e9eca-2271-41a0-af8d-51cc126248f8	t	180	0	\N	8b56eeed-8bb5-49bd-97ff-ad6c573cea25	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 12:25:53.066+00	2026-04-25 12:25:53.066+00	\N	8c07d085-7bf4-4849-934d-3c70dcf4340d	\N	\N	t
9eac3571-e124-4ba2-bf7b-45831a794cf6	fabcdf3e-54b2-409f-8ee8-cbb9ca60f50f	53e9a52f-a4d8-42e9-a167-0a5c4ed26294	t	180	1	\N	8b56eeed-8bb5-49bd-97ff-ad6c573cea25	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 12:25:53.066+00	2026-04-25 12:25:53.066+00	\N	8c07d085-7bf4-4849-934d-3c70dcf4340d	\N	\N	t
d8ec57b5-a626-423f-b979-0255e010c09d	b54dc196-a099-4d8b-8b5a-a76e2bf5c71b	9aca448c-a9a3-4b94-80ed-cfc3b44db139	t	180	2	\N	8b56eeed-8bb5-49bd-97ff-ad6c573cea25	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 12:25:53.066+00	2026-04-25 12:25:53.066+00	\N	8c07d085-7bf4-4849-934d-3c70dcf4340d	\N	\N	t
badbd416-19b6-446c-9338-998d3435d91e	8f9be9be-7a19-4f41-b5c4-91f6311865de	dc1257f4-a2dc-4284-aa61-2304b2cd78ca	t	180	3	\N	8b56eeed-8bb5-49bd-97ff-ad6c573cea25	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 12:25:53.066+00	2026-04-25 12:25:53.066+00	\N	8c07d085-7bf4-4849-934d-3c70dcf4340d	\N	\N	t
10c274ed-eeed-4907-ae67-f91e5a80855d	798be8b1-466b-4d8d-95e9-86a89bc5bf34	fe7674fd-2ac8-43f3-be06-3a05c75d1951	t	180	4	\N	8b56eeed-8bb5-49bd-97ff-ad6c573cea25	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 12:25:53.066+00	2026-04-25 12:25:53.066+00	\N	8c07d085-7bf4-4849-934d-3c70dcf4340d	\N	\N	t
e7630355-7ea0-4537-8d49-53868563af54	eb3b7ab1-693f-4177-94d8-351945f9564f	53e9a52f-a4d8-42e9-a167-0a5c4ed26294	t	180	0	\N	0e20d88b-564e-4437-9c06-392e385e03b5	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 12:25:53.47+00	2026-04-25 12:25:53.47+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
4bdf67b2-5cf4-44f1-b1fd-d8769eb236e7	7e4691cf-cba4-49b6-b4e3-68840a0d9392	9aca448c-a9a3-4b94-80ed-cfc3b44db139	t	180	1	\N	0e20d88b-564e-4437-9c06-392e385e03b5	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 12:25:53.47+00	2026-04-25 12:25:53.47+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
d7e9385b-9921-4c06-9334-b4c58709f277	3cd31ff9-5afc-4b1d-9d66-d7f7635d778d	dc1257f4-a2dc-4284-aa61-2304b2cd78ca	t	180	2	\N	0e20d88b-564e-4437-9c06-392e385e03b5	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 12:25:53.47+00	2026-04-25 12:25:53.47+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
62e4a803-8e2c-4c94-aee3-d23d2f540f03	84499182-c5ce-4ba6-ac8d-a26a2ee93014	fe7674fd-2ac8-43f3-be06-3a05c75d1951	t	180	3	\N	0e20d88b-564e-4437-9c06-392e385e03b5	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 12:25:53.47+00	2026-04-25 12:25:53.47+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082	\N	\N	t
\.


--
-- Data for Name: viewFieldGroup; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."viewFieldGroup" ("workspaceId", "universalIdentifier", "applicationId", id, name, "position", "isVisible", "viewId", "createdAt", "updatedAt", "deletedAt", overrides, "isActive") FROM stdin;
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	94009e34-52fb-4534-89ce-6c6d0a774056	4a5dec44-2fb8-4d70-a6e0-6f483b222082	24c9a667-66a0-406e-98e5-297748417bb4	General	0	t	e5e9e2d9-6904-4cbe-a0f4-163b1150f972	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	t
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	35dace44-6e63-4cdb-b761-a92bcf126a7e	4a5dec44-2fb8-4d70-a6e0-6f483b222082	a276ec96-b3ac-43a1-81ff-bb46c171873b	System	1	t	e5e9e2d9-6904-4cbe-a0f4-163b1150f972	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	t
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	e015afb4-bb6b-44ab-8077-01196c70bd1b	4a5dec44-2fb8-4d70-a6e0-6f483b222082	b056b00f-e37a-4467-bb9c-7fa3cd5c3aaa	General	0	t	9e1167fa-3a76-4cfd-bacd-33f45bb8ee19	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	t
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	a7e61a73-68b3-46a2-8624-54a4f0a81710	4a5dec44-2fb8-4d70-a6e0-6f483b222082	41d0b4e8-d67f-4573-bc1b-2a8772d2116d	System	1	t	9e1167fa-3a76-4cfd-bacd-33f45bb8ee19	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	t
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	9c27f771-9f85-492f-b1f1-9bc7a175f6f3	4a5dec44-2fb8-4d70-a6e0-6f483b222082	e67f14fb-db52-413a-8e05-02e76b4559d7	General	0	t	b9b76520-b5a6-4d26-ad5c-4767bb6724ec	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	t
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	c7b18e05-dd60-4ee4-911a-290790e8c425	4a5dec44-2fb8-4d70-a6e0-6f483b222082	0feb05f6-35c4-4073-9e00-6491be93e184	System	1	t	b9b76520-b5a6-4d26-ad5c-4767bb6724ec	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	t
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	3d842777-436e-467d-90ae-9e1fa0aa7e9c	4a5dec44-2fb8-4d70-a6e0-6f483b222082	d15ef95d-73e4-4de3-a33f-3ac8d3147b49	General	0	t	1cb25256-f293-4cd6-982a-b28c8d8fd158	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	t
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	098836d8-15c1-44c1-a58e-2ff7fd6a05f9	4a5dec44-2fb8-4d70-a6e0-6f483b222082	4f64ee46-eaed-4b55-a424-2b2a8ccd9969	System	1	t	1cb25256-f293-4cd6-982a-b28c8d8fd158	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	t
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	20202020-a001-4a01-8a01-c0aba11c1101	4a5dec44-2fb8-4d70-a6e0-6f483b222082	201321ec-ac34-49e0-ae7e-dc9e1228dacc	General	0	t	f021740c-7b55-447c-818e-d79706d42ad5	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	t
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	20202020-a001-4a01-8a01-c0aba11c1102	4a5dec44-2fb8-4d70-a6e0-6f483b222082	ef9fb37a-3432-41cd-8a00-ebf02a78accf	Business	1	t	f021740c-7b55-447c-818e-d79706d42ad5	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	t
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	20202020-a001-4a01-8a01-c0aba11c1103	4a5dec44-2fb8-4d70-a6e0-6f483b222082	3c73c9c2-5336-498d-ada5-198c181c94d5	Contact	2	t	f021740c-7b55-447c-818e-d79706d42ad5	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	t
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	20202020-a001-4a01-8a01-c0aba11c1104	4a5dec44-2fb8-4d70-a6e0-6f483b222082	79f5ee60-99e7-4884-ac6d-2477538bdf44	System	3	t	f021740c-7b55-447c-818e-d79706d42ad5	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	t
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	428a9949-71f4-4ebf-9160-1da43f1113ff	4a5dec44-2fb8-4d70-a6e0-6f483b222082	67099305-9ed5-4a05-9986-9db9430d785e	General	0	t	86d16288-5a26-4f70-8fdb-d6e6e669f31d	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	t
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	ce9f7f72-583e-4415-a82f-e1f4b2cc8e2f	4a5dec44-2fb8-4d70-a6e0-6f483b222082	39cbca6d-7b3f-443e-970d-af1fb60f0caf	System	1	t	86d16288-5a26-4f70-8fdb-d6e6e669f31d	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	t
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	96113215-6bf2-476c-ae69-c70274257913	4a5dec44-2fb8-4d70-a6e0-6f483b222082	eb8b56e8-5e11-43ac-af4a-43f8a37b02ed	General	0	t	7948282b-6c30-46be-98f3-c2da5bd06e3b	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	t
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2f08a624-e1a7-4f79-b5f7-1a8e92f4c07e	4a5dec44-2fb8-4d70-a6e0-6f483b222082	783bb193-4455-4fe6-a8af-4fa334830e8d	System	1	t	7948282b-6c30-46be-98f3-c2da5bd06e3b	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	t
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	86d7066c-ba38-4f6a-996f-77345bedd549	4a5dec44-2fb8-4d70-a6e0-6f483b222082	fbd33fac-150d-499d-991c-b17c6d1bd615	General	0	t	83067e55-7cf9-47e2-a19f-3526a0f90068	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	t
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	6044c58c-a63c-4f3f-a283-b8803553628f	4a5dec44-2fb8-4d70-a6e0-6f483b222082	fb84dd45-cdbc-4453-9d39-3407d92973bb	System	1	t	83067e55-7cf9-47e2-a19f-3526a0f90068	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	t
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	4928521b-ae24-4013-a69a-1392017d57af	4a5dec44-2fb8-4d70-a6e0-6f483b222082	fcafc433-c667-4dea-aa3a-a0008b8a4d8d	General	0	t	6091fd91-4802-45a0-81cd-2552154dbb6c	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	t
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	b76cebb3-39b2-477a-9212-8bf1190227a4	4a5dec44-2fb8-4d70-a6e0-6f483b222082	9f721383-4257-4273-8f52-7e67d6671531	System	1	t	6091fd91-4802-45a0-81cd-2552154dbb6c	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	t
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	c55a9366-bb2c-4ae7-8345-115c790f56b1	4a5dec44-2fb8-4d70-a6e0-6f483b222082	be783081-a7d4-4ced-a48c-0878115a5725	General	0	t	3d875b63-fcf3-42db-99d5-3dd0b579a3ae	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	t
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	51b6af5e-9f76-4fb2-811b-6193761d7702	4a5dec44-2fb8-4d70-a6e0-6f483b222082	dbc635cd-ecb4-42fc-878b-75124f377f77	System	1	t	3d875b63-fcf3-42db-99d5-3dd0b579a3ae	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	t
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	41c18430-34c3-430f-b86b-fc3963281277	4a5dec44-2fb8-4d70-a6e0-6f483b222082	26cc0c47-2e96-4370-a598-582e42a0e6b9	General	0	t	0bad5d82-019e-4f81-b922-e6e332e1e2bc	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	t
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	add21830-a7c6-4cde-9eed-430afbcbf557	4a5dec44-2fb8-4d70-a6e0-6f483b222082	c19be165-55f7-4146-88d3-d1d083aa7f68	System	1	t	0bad5d82-019e-4f81-b922-e6e332e1e2bc	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	t
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	20202020-a005-4a05-8a05-a0be5a115101	4a5dec44-2fb8-4d70-a6e0-6f483b222082	1b9b4640-6c6f-4726-bd28-65bfb2cc9646	General	0	t	24ba15ff-ddbb-45ba-9c12-999990314ac3	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	t
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	20202020-a005-4a05-8a05-a0be5a115103	4a5dec44-2fb8-4d70-a6e0-6f483b222082	4c907a11-fa3c-42c4-82a4-e2235b8cc243	System	1	t	24ba15ff-ddbb-45ba-9c12-999990314ac3	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	t
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	20202020-a003-4a03-8a03-0aa0b1ca3101	4a5dec44-2fb8-4d70-a6e0-6f483b222082	045d27f2-1173-45fe-b1b1-80173b3973ba	Deal	0	t	ed48e600-d403-4626-8209-62da0b7ca4ae	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	t
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	20202020-a003-4a03-8a03-0aa0b1ca3102	4a5dec44-2fb8-4d70-a6e0-6f483b222082	fe43f619-b193-4e75-9f84-43aaf645c9fb	Relations	1	t	ed48e600-d403-4626-8209-62da0b7ca4ae	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	t
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	20202020-a003-4a03-8a03-0aa0b1ca3103	4a5dec44-2fb8-4d70-a6e0-6f483b222082	1437a9d2-8e12-481a-8afe-10d526ca5654	System	2	t	ed48e600-d403-4626-8209-62da0b7ca4ae	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	t
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	20202020-a002-4a02-8a02-ae0a1ea12101	4a5dec44-2fb8-4d70-a6e0-6f483b222082	6bcecd7c-402e-4917-b388-61c3a48bc504	General	0	t	c949770f-35c2-4d59-ad86-1fb04fcd5e92	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	t
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	20202020-a002-4a02-8a02-ae0a1ea12102	4a5dec44-2fb8-4d70-a6e0-6f483b222082	927c4d9b-3624-4070-b546-e8d7be010790	Work	1	t	c949770f-35c2-4d59-ad86-1fb04fcd5e92	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	t
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	20202020-a002-4a02-8a02-ae0a1ea12103	4a5dec44-2fb8-4d70-a6e0-6f483b222082	18d21992-4fb0-45a8-8041-3cd82673a064	Social	2	t	c949770f-35c2-4d59-ad86-1fb04fcd5e92	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	t
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	20202020-a002-4a02-8a02-ae0a1ea12104	4a5dec44-2fb8-4d70-a6e0-6f483b222082	2feb9b66-b2de-42b1-a25e-9e72af919488	System	3	t	c949770f-35c2-4d59-ad86-1fb04fcd5e92	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	t
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	20202020-a006-4a06-8a06-ba5ca11a6101	4a5dec44-2fb8-4d70-a6e0-6f483b222082	7d31ef7b-0153-4fdd-9410-236632a93612	General	0	t	905fa722-5afd-4b81-ba82-ae14fb9b928c	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	t
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	20202020-a006-4a06-8a06-ba5ca11a6103	4a5dec44-2fb8-4d70-a6e0-6f483b222082	928706a2-e79f-41a4-bc1f-cacf5de454ce	System	1	t	905fa722-5afd-4b81-ba82-ae14fb9b928c	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	t
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	c5261eae-f2fe-416e-8ef9-eda5d377f8ca	4a5dec44-2fb8-4d70-a6e0-6f483b222082	ceaaa62a-f46f-4511-a8f0-594be53584d3	General	0	t	21665928-421d-4110-9dec-493ce2e838f9	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	t
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	e6da0410-7f63-41b7-b977-421fc37d67f5	4a5dec44-2fb8-4d70-a6e0-6f483b222082	9cff2620-26fc-4f01-9887-11b89ecdebdf	System	1	t	21665928-421d-4110-9dec-493ce2e838f9	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	t
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	20202020-a011-4a11-8a11-a0bcf10abcf2	4a5dec44-2fb8-4d70-a6e0-6f483b222082	2e217b3c-1317-49f2-a93d-ecc506987f28	General	0	t	f51f99d4-e900-465a-968b-5d5819069b53	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	t
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	20202020-a011-4a11-8a11-a0bcf10abcf4	4a5dec44-2fb8-4d70-a6e0-6f483b222082	7424afef-7c18-4bb5-b7a6-7124c229caae	System	1	t	f51f99d4-e900-465a-968b-5d5819069b53	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	t
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	20202020-a010-4a10-8a10-a0bcf10aaef2	4a5dec44-2fb8-4d70-a6e0-6f483b222082	76fcb404-e441-416e-b73b-252369a355da	General	0	t	36158a62-099d-4ab0-a3c8-aa01c7f590f1	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	t
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	20202020-a010-4a10-8a10-a0bcf10aaef4	4a5dec44-2fb8-4d70-a6e0-6f483b222082	e3d91fc3-f5af-4e78-bb7d-21130359555d	System	1	t	36158a62-099d-4ab0-a3c8-aa01c7f590f1	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	\N	t
\.


--
-- Data for Name: viewFilter; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."viewFilter" ("universalIdentifier", id, "fieldMetadataId", operand, value, "viewFilterGroupId", "positionInViewFilterGroup", "subFieldName", "viewId", "workspaceId", "createdAt", "updatedAt", "deletedAt", "applicationId") FROM stdin;
20202020-af17-4a07-8a07-ba5ca551abf1	680fb34c-f2b5-4204-9020-460dbc8ffd82	1a641c8f-05e2-47d2-89dc-92cb49b71b9e	IS	"{\\"isCurrentWorkspaceMemberSelected\\":true,\\"selectedRecordIds\\":[]}"	\N	\N	\N	db7d7e8d-10ef-4b03-aa68-775b73f78e8c	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082
\.


--
-- Data for Name: viewFilterGroup; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."viewFilterGroup" ("universalIdentifier", id, "parentViewFilterGroupId", "logicalOperator", "positionInViewFilterGroup", "viewId", "workspaceId", "createdAt", "updatedAt", "deletedAt", "applicationId") FROM stdin;
\.


--
-- Data for Name: viewGroup; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."viewGroup" ("universalIdentifier", id, "isVisible", "fieldValue", "position", "viewId", "workspaceId", "createdAt", "updatedAt", "deletedAt", "applicationId") FROM stdin;
20202020-af14-4a04-8a04-0aa0b2ca2bf1	75b123ea-4040-4efc-b3ca-a30d3fef0c35	t	NEW	0	ae71dfb5-cb76-45fa-a250-0a02ee40f016	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082
20202020-af14-4a04-8a04-0aa0b2ca2bf2	b2aec239-5bc2-4336-af79-229f37e7c69a	t	SCREENING	1	ae71dfb5-cb76-45fa-a250-0a02ee40f016	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082
20202020-af14-4a04-8a04-0aa0b2ca2bf3	4c418e41-8497-4e08-aa0a-985bd53827d1	t	MEETING	2	ae71dfb5-cb76-45fa-a250-0a02ee40f016	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082
20202020-af14-4a04-8a04-0aa0b2ca2bf4	15a829f6-8b7c-4338-8869-f91a88c382ad	t	PROPOSAL	3	ae71dfb5-cb76-45fa-a250-0a02ee40f016	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082
20202020-af14-4a04-8a04-0aa0b2ca2bf5	d08ccaad-45db-486d-b00e-43caa00e0d76	t	CUSTOMER	4	ae71dfb5-cb76-45fa-a250-0a02ee40f016	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082
20202020-af17-4a07-8a07-ba5ca551abf2	22212ad0-c4d8-4900-bdfa-f5753ac6cee7	t	TODO	0	db7d7e8d-10ef-4b03-aa68-775b73f78e8c	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082
20202020-af17-4a07-8a07-ba5ca551abf3	d3f2d71b-948e-4d87-be88-57a75d558a9d	t	IN_PROGRESS	1	db7d7e8d-10ef-4b03-aa68-775b73f78e8c	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082
20202020-af17-4a07-8a07-ba5ca551abf4	0ecdb27c-bdc6-4dbe-b178-98ac9b407f8d	t	DONE	2	db7d7e8d-10ef-4b03-aa68-775b73f78e8c	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082
20202020-af17-4a07-8a07-ba5ca551abf5	df09f228-d376-4ec7-ba42-27fcd43b8214	t		3	db7d7e8d-10ef-4b03-aa68-775b73f78e8c	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082
20202020-af18-4a08-8a08-ba5cba5bbf01	fc46f34b-a049-4c08-9baa-018220bc52f4	t	TODO	0	13945e81-0b8b-4327-a667-aa1d2f4a2e66	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082
20202020-af18-4a08-8a08-ba5cba5bbf02	2a45571f-953b-4e00-93ab-57d86144136c	t	IN_PROGRESS	1	13945e81-0b8b-4327-a667-aa1d2f4a2e66	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082
20202020-af18-4a08-8a08-ba5cba5bbf03	05ab958f-f056-44c5-b503-64f6a1115624	t	DONE	2	13945e81-0b8b-4327-a667-aa1d2f4a2e66	627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	2026-04-25 11:34:17.013+00	2026-04-25 11:34:17.013+00	\N	4a5dec44-2fb8-4d70-a6e0-6f483b222082
\.


--
-- Data for Name: viewSort; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."viewSort" ("universalIdentifier", id, "fieldMetadataId", direction, "viewId", "workspaceId", "createdAt", "updatedAt", "deletedAt", "applicationId") FROM stdin;
\.


--
-- Data for Name: webhook; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core.webhook (id, "targetUrl", operations, description, secret, "workspaceId", "createdAt", "updatedAt", "deletedAt", "universalIdentifier", "applicationId") FROM stdin;
\.


--
-- Data for Name: workspace; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core.workspace (id, "displayName", logo, "inviteHash", "deletedAt", "createdAt", "updatedAt", "allowImpersonation", "isPublicInviteLinkEnabled", "activationStatus", "metadataVersion", "databaseSchema", subdomain, "customDomain", "isGoogleAuthEnabled", "isTwoFactorAuthenticationEnforced", "isPasswordAuthEnabled", "isMicrosoftAuthEnabled", "isCustomDomainEnabled", "defaultRoleId", "trashRetentionDays", "routerModel", "isGoogleAuthBypassEnabled", "isPasswordAuthBypassEnabled", "isMicrosoftAuthBypassEnabled", "workspaceCustomApplicationId", "editableProfileFields", "fastModel", "smartModel", "eventLogRetentionDays", "suspendedAt", "aiAdditionalInstructions", "logoFileId", "enabledAiModelIds", "useRecommendedModels") FROM stdin;
627a7b88-8c60-4aa9-8c3f-1e2ddbc2ee00	HabitFlow	\N	8fd87174-1220-4414-aed9-d4cae1b15838	\N	2026-04-25 11:33:51.040463+00	2026-04-25 12:34:16.875918+00	t	t	ACTIVE	23	workspace_5tvw23m2ae5qhvivd4el66s5c	honest-indigo-raccoon	\N	t	f	t	t	f	a6644555-1397-476c-8811-f8879569ac09	14	auto	f	f	f	8c07d085-7bf4-4849-934d-3c70dcf4340d	{email,profilePicture,firstName,lastName}	default-fast-model	default-smart-model	90	\N	\N	\N	{}	t
\.


--
-- Data for Name: workspaceSSOIdentityProvider; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."workspaceSSOIdentityProvider" (id, name, status, "workspaceId", "createdAt", "updatedAt", type, issuer, "clientID", "clientSecret", "ssoURL", certificate, fingerprint) FROM stdin;
\.


--
-- Data for Name: _habit; Type: TABLE DATA; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

COPY workspace_5tvw23m2ae5qhvivd4el66s5c._habit (name, id, "createdAt", "createdBySource", "createdByWorkspaceMemberId", "createdByName", "createdByContext", "deletedAt", "position", "updatedAt", "updatedBySource", "updatedByWorkspaceMemberId", "updatedByName", "updatedByContext", title, "mainGoal", "microStep", "recurrenceRule", "deadlineType", "deadlineValue") FROM stdin;
\.


--
-- Data for Name: _habitLog; Type: TABLE DATA; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

COPY workspace_5tvw23m2ae5qhvivd4el66s5c."_habitLog" (name, id, "createdAt", "createdBySource", "createdByWorkspaceMemberId", "createdByName", "createdByContext", "deletedAt", "position", "updatedAt", "updatedBySource", "updatedByWorkspaceMemberId", "updatedByName", "updatedByContext", "habitId", date, status, notes) FROM stdin;
\.


--
-- Data for Name: attachment; Type: TABLE DATA; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

COPY workspace_5tvw23m2ae5qhvivd4el66s5c.attachment (id, "createdAt", "updatedAt", "deletedAt", name, file, "fullPath", "fileCategory", "createdBySource", "createdByWorkspaceMemberId", "createdByName", "createdByContext", "updatedBySource", "updatedByWorkspaceMemberId", "updatedByName", "updatedByContext", "position", "targetTaskId", "targetNoteId", "targetPersonId", "targetCompanyId", "targetOpportunityId", "targetDashboardId", "targetWorkflowId", "targetHabitId", "targetHabitLogId") FROM stdin;
\.


--
-- Data for Name: blocklist; Type: TABLE DATA; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

COPY workspace_5tvw23m2ae5qhvivd4el66s5c.blocklist (id, "createdAt", "updatedAt", "deletedAt", "createdBySource", "createdByWorkspaceMemberId", "createdByName", "createdByContext", "updatedBySource", "updatedByWorkspaceMemberId", "updatedByName", "updatedByContext", "position", handle, "workspaceMemberId") FROM stdin;
\.


--
-- Data for Name: calendarChannel; Type: TABLE DATA; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

COPY workspace_5tvw23m2ae5qhvivd4el66s5c."calendarChannel" (id, "createdAt", "updatedAt", "deletedAt", "createdBySource", "createdByWorkspaceMemberId", "createdByName", "createdByContext", "updatedBySource", "updatedByWorkspaceMemberId", "updatedByName", "updatedByContext", "position", handle, visibility, "isContactAutoCreationEnabled", "contactAutoCreationPolicy", "isSyncEnabled", "syncCursor", "syncStatus", "syncStage", "syncStageStartedAt", "syncedAt", "throttleFailureCount", "connectedAccountId") FROM stdin;
\.


--
-- Data for Name: calendarChannelEventAssociation; Type: TABLE DATA; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

COPY workspace_5tvw23m2ae5qhvivd4el66s5c."calendarChannelEventAssociation" (id, "createdAt", "updatedAt", "deletedAt", "createdBySource", "createdByWorkspaceMemberId", "createdByName", "createdByContext", "updatedBySource", "updatedByWorkspaceMemberId", "updatedByName", "updatedByContext", "position", "eventExternalId", "recurringEventExternalId", "calendarChannelId", "calendarEventId") FROM stdin;
\.


--
-- Data for Name: calendarEvent; Type: TABLE DATA; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

COPY workspace_5tvw23m2ae5qhvivd4el66s5c."calendarEvent" (id, "createdAt", "updatedAt", "deletedAt", "createdBySource", "createdByWorkspaceMemberId", "createdByName", "createdByContext", "updatedBySource", "updatedByWorkspaceMemberId", "updatedByName", "updatedByContext", "position", title, "isCanceled", "isFullDay", "startsAt", "endsAt", "externalCreatedAt", "externalUpdatedAt", description, location, "iCalUid", "conferenceSolution", "conferenceLinkPrimaryLinkLabel", "conferenceLinkPrimaryLinkUrl", "conferenceLinkSecondaryLinks") FROM stdin;
\.


--
-- Data for Name: calendarEventParticipant; Type: TABLE DATA; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

COPY workspace_5tvw23m2ae5qhvivd4el66s5c."calendarEventParticipant" (id, "createdAt", "updatedAt", "deletedAt", "createdBySource", "createdByWorkspaceMemberId", "createdByName", "createdByContext", "updatedBySource", "updatedByWorkspaceMemberId", "updatedByName", "updatedByContext", "position", handle, "displayName", "isOrganizer", "responseStatus", "calendarEventId", "personId", "workspaceMemberId") FROM stdin;
\.


--
-- Data for Name: company; Type: TABLE DATA; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

COPY workspace_5tvw23m2ae5qhvivd4el66s5c.company (id, "createdAt", "updatedAt", "deletedAt", name, "domainNamePrimaryLinkLabel", "domainNamePrimaryLinkUrl", "domainNameSecondaryLinks", "addressAddressStreet1", "addressAddressStreet2", "addressAddressCity", "addressAddressPostcode", "addressAddressState", "addressAddressCountry", "addressAddressLat", "addressAddressLng", employees, "linkedinLinkPrimaryLinkLabel", "linkedinLinkPrimaryLinkUrl", "linkedinLinkSecondaryLinks", "xLinkPrimaryLinkLabel", "xLinkPrimaryLinkUrl", "xLinkSecondaryLinks", "annualRecurringRevenueAmountMicros", "annualRecurringRevenueCurrencyCode", "idealCustomerProfile", "position", "createdBySource", "createdByWorkspaceMemberId", "createdByName", "createdByContext", "updatedBySource", "updatedByWorkspaceMemberId", "updatedByName", "updatedByContext", "accountOwnerId") FROM stdin;
c776ee49-f608-4a77-8cc8-6fe96ae1e43f	2026-04-25 11:34:19.069229+00	2026-04-25 11:34:19.069229+00	\N	Airbnb	\N	https://airbnb.com	\N	888 Brannan St	\N	San Francisco	94103	CA	United States	\N	\N	5000	\N	\N	\N	\N	\N	\N	\N	\N	f	1	SYSTEM	\N	System	\N	SYSTEM	\N	System	\N	\N
f45ee421-8a3e-4aa5-a1cf-7207cc6754e1	2026-04-25 11:34:19.069229+00	2026-04-25 11:34:19.069229+00	\N	Anthropic	\N	https://anthropic.com	\N	548 Market Street	\N	San Francisco	94104	CA	United States	\N	\N	1100	\N	\N	\N	\N	\N	\N	\N	\N	f	2	SYSTEM	\N	System	\N	SYSTEM	\N	System	\N	\N
1f70157c-4ea5-4d81-bc49-e1401abfbb94	2026-04-25 11:34:19.069229+00	2026-04-25 11:34:19.069229+00	\N	Stripe	\N	https://stripe.com	\N	Eutaw Street	\N	Dublin	\N	\N	Ireland	\N	\N	8000	\N	\N	\N	\N	\N	\N	\N	\N	f	3	SYSTEM	\N	System	\N	SYSTEM	\N	System	\N	\N
9d5bcf43-7d38-4e88-82cb-d6d4ce638bf0	2026-04-25 11:34:19.069229+00	2026-04-25 11:34:19.069229+00	\N	Figma	\N	https://figma.com	\N	760 Market St	Floor 10	San Francisco	94102	\N	United States	\N	\N	800	\N	\N	\N	\N	\N	\N	\N	\N	f	4	SYSTEM	\N	System	\N	SYSTEM	\N	System	\N	\N
06290608-8bf0-4806-99ae-a715a6a93fad	2026-04-25 11:34:19.069229+00	2026-04-25 11:34:19.069229+00	\N	Notion	\N	https://notion.com	\N	2300 Harrison St	\N	San Francisco	94110	CA	United States	\N	\N	400	\N	\N	\N	\N	\N	\N	\N	\N	f	5	SYSTEM	\N	System	\N	SYSTEM	\N	System	\N	\N
\.


--
-- Data for Name: connectedAccount; Type: TABLE DATA; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

COPY workspace_5tvw23m2ae5qhvivd4el66s5c."connectedAccount" (id, "createdAt", "updatedAt", "deletedAt", "createdBySource", "createdByWorkspaceMemberId", "createdByName", "createdByContext", "updatedBySource", "updatedByWorkspaceMemberId", "updatedByName", "updatedByContext", "position", handle, provider, "accessToken", "refreshToken", "lastSyncHistoryId", "authFailedAt", "lastCredentialsRefreshedAt", "handleAliases", scopes, "connectionParameters", "accountOwnerId") FROM stdin;
\.


--
-- Data for Name: dashboard; Type: TABLE DATA; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

COPY workspace_5tvw23m2ae5qhvivd4el66s5c.dashboard (id, "createdAt", "updatedAt", "deletedAt", title, "position", "pageLayoutId", "createdBySource", "createdByWorkspaceMemberId", "createdByName", "createdByContext", "updatedBySource", "updatedByWorkspaceMemberId", "updatedByName", "updatedByContext") FROM stdin;
f31ecf3b-87d3-4e8a-a84b-b6f0f3f8c7e2	2026-04-25 11:34:19.069229+00	2026-04-25 11:34:19.069229+00	\N	My First Dashboard	0	525a8cc0-1361-4da3-a502-c8e0cd2b4343	SYSTEM	\N	System	{}	SYSTEM	\N	System	{}
\.


--
-- Data for Name: message; Type: TABLE DATA; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

COPY workspace_5tvw23m2ae5qhvivd4el66s5c.message (id, "createdAt", "updatedAt", "deletedAt", "createdBySource", "createdByWorkspaceMemberId", "createdByName", "createdByContext", "updatedBySource", "updatedByWorkspaceMemberId", "updatedByName", "updatedByContext", "position", "headerMessageId", direction, subject, text, "receivedAt", "messageThreadId") FROM stdin;
\.


--
-- Data for Name: messageChannel; Type: TABLE DATA; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

COPY workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannel" (id, "createdAt", "updatedAt", "deletedAt", "createdBySource", "createdByWorkspaceMemberId", "createdByName", "createdByContext", "updatedBySource", "updatedByWorkspaceMemberId", "updatedByName", "updatedByContext", "position", visibility, handle, type, "isContactAutoCreationEnabled", "contactAutoCreationPolicy", "messageFolderImportPolicy", "excludeNonProfessionalEmails", "excludeGroupEmails", "pendingGroupEmailsAction", "isSyncEnabled", "syncCursor", "syncedAt", "syncStatus", "syncStage", "syncStageStartedAt", "throttleFailureCount", "throttleRetryAfter", "connectedAccountId") FROM stdin;
\.


--
-- Data for Name: messageChannelMessageAssociation; Type: TABLE DATA; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

COPY workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannelMessageAssociation" (id, "createdAt", "updatedAt", "deletedAt", "createdBySource", "createdByWorkspaceMemberId", "createdByName", "createdByContext", "updatedBySource", "updatedByWorkspaceMemberId", "updatedByName", "updatedByContext", "position", "messageExternalId", "messageThreadExternalId", direction, "messageChannelId", "messageId", "messageThreadId") FROM stdin;
\.


--
-- Data for Name: messageChannelMessageAssociationMessageFolder; Type: TABLE DATA; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

COPY workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannelMessageAssociationMessageFolder" (id, "createdAt", "updatedAt", "deletedAt", "createdBySource", "createdByWorkspaceMemberId", "createdByName", "createdByContext", "updatedBySource", "updatedByWorkspaceMemberId", "updatedByName", "updatedByContext", "position", "messageFolderId", "messageChannelMessageAssociationId") FROM stdin;
\.


--
-- Data for Name: messageFolder; Type: TABLE DATA; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

COPY workspace_5tvw23m2ae5qhvivd4el66s5c."messageFolder" (id, "createdAt", "updatedAt", "deletedAt", "createdBySource", "createdByWorkspaceMemberId", "createdByName", "createdByContext", "updatedBySource", "updatedByWorkspaceMemberId", "updatedByName", "updatedByContext", "position", name, "syncCursor", "isSentFolder", "isSynced", "parentFolderId", "externalId", "pendingSyncAction", "messageChannelId") FROM stdin;
\.


--
-- Data for Name: messageParticipant; Type: TABLE DATA; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

COPY workspace_5tvw23m2ae5qhvivd4el66s5c."messageParticipant" (id, "createdAt", "updatedAt", "deletedAt", "createdBySource", "createdByWorkspaceMemberId", "createdByName", "createdByContext", "updatedBySource", "updatedByWorkspaceMemberId", "updatedByName", "updatedByContext", "position", role, handle, "displayName", "messageId", "personId", "workspaceMemberId") FROM stdin;
\.


--
-- Data for Name: messageThread; Type: TABLE DATA; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

COPY workspace_5tvw23m2ae5qhvivd4el66s5c."messageThread" (id, "createdAt", "updatedAt", "deletedAt", "createdBySource", "createdByWorkspaceMemberId", "createdByName", "createdByContext", "updatedBySource", "updatedByWorkspaceMemberId", "updatedByName", "updatedByContext", "position", subject) FROM stdin;
\.


--
-- Data for Name: note; Type: TABLE DATA; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

COPY workspace_5tvw23m2ae5qhvivd4el66s5c.note (id, "createdAt", "updatedAt", "deletedAt", "position", title, "bodyV2Blocknote", "bodyV2Markdown", "createdBySource", "createdByWorkspaceMemberId", "createdByName", "createdByContext", "updatedBySource", "updatedByWorkspaceMemberId", "updatedByName", "updatedByContext") FROM stdin;
\.


--
-- Data for Name: noteTarget; Type: TABLE DATA; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

COPY workspace_5tvw23m2ae5qhvivd4el66s5c."noteTarget" (id, "createdAt", "updatedAt", "deletedAt", "createdBySource", "createdByWorkspaceMemberId", "createdByName", "createdByContext", "updatedBySource", "updatedByWorkspaceMemberId", "updatedByName", "updatedByContext", "position", "targetCompanyId", "noteId", "targetPersonId", "targetOpportunityId", "targetHabitId", "targetHabitLogId") FROM stdin;
\.


--
-- Data for Name: opportunity; Type: TABLE DATA; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

COPY workspace_5tvw23m2ae5qhvivd4el66s5c.opportunity (id, "createdAt", "updatedAt", "deletedAt", name, "amountAmountMicros", "amountCurrencyCode", "closeDate", stage, "position", "createdBySource", "createdByWorkspaceMemberId", "createdByName", "createdByContext", "updatedBySource", "updatedByWorkspaceMemberId", "updatedByName", "updatedByContext", "companyId", "pointOfContactId", "ownerId") FROM stdin;
822639e5-9bf7-40f1-8882-a11140362339	2026-04-25 11:34:19.069229+00	2026-04-25 11:34:19.069229+00	\N	Platform Migration	60000000000	USD	2026-01-31 16:25:00+00	PROPOSAL	1	SYSTEM	\N	System	\N	SYSTEM	\N	System	\N	1f70157c-4ea5-4d81-bc49-e1401abfbb94	edf6d445-13a7-4373-9a47-8f89e8c0a877	8a4fa6b3-2644-4c16-a70f-aee374858ee3
fc747edc-cb00-4078-8d6b-1fab2611dae4	2026-04-25 11:34:19.069229+00	2026-04-25 11:34:19.069229+00	\N	AI Model Training	100000000000	USD	2026-02-15 16:25:00+00	CUSTOMER	2	SYSTEM	\N	System	\N	SYSTEM	\N	System	\N	f45ee421-8a3e-4aa5-a1cf-7207cc6754e1	93c72d2e-e65c-44c4-99ad-f87f50349dcf	8a4fa6b3-2644-4c16-a70f-aee374858ee3
75de302f-1044-4957-8da4-1f67ebefd52b	2026-04-25 11:34:19.069229+00	2026-04-25 11:34:19.069229+00	\N	Workspace Expansion	45000000000	USD	2026-01-20 16:26:00+00	MEETING	3	SYSTEM	\N	System	\N	SYSTEM	\N	System	\N	06290608-8bf0-4806-99ae-a715a6a93fad	7a93d1e5-3f74-4945-8a65-d7f996083f72	8a4fa6b3-2644-4c16-a70f-aee374858ee3
2beb07b0-340c-41d7-be33-5aa91757f329	2026-04-25 11:34:19.069229+00	2026-04-25 11:34:19.069229+00	\N	API Integration Deal	75000000000	USD	2026-01-25 16:26:00+00	SCREENING	4	SYSTEM	\N	System	\N	SYSTEM	\N	System	\N	1f70157c-4ea5-4d81-bc49-e1401abfbb94	edf6d445-13a7-4373-9a47-8f89e8c0a877	8a4fa6b3-2644-4c16-a70f-aee374858ee3
9543adcf-ec03-44e2-9233-3c2d3ebae98a	2026-04-25 11:34:19.069229+00	2026-04-25 11:34:19.069229+00	\N	Enterprise Plan Upgrade	50000000000	USD	2026-03-10 16:26:00+00	NEW	5	SYSTEM	\N	System	\N	SYSTEM	\N	System	\N	c776ee49-f608-4a77-8cc8-6fe96ae1e43f	a2e78a5e-338b-46df-8811-fa08c7d19d35	8a4fa6b3-2644-4c16-a70f-aee374858ee3
9457f8e9-16ae-43b9-92ee-cbd21f3dded5	2026-04-25 11:34:19.069229+00	2026-04-25 11:34:19.069229+00	\N	Design Partnership	30000000000	USD	2026-01-15 16:27:00+00	NEW	6	SYSTEM	\N	System	\N	SYSTEM	\N	System	\N	9d5bcf43-7d38-4e88-82cb-d6d4ce638bf0	b1e26fa6-c757-4c88-abfa-4b11f5cf3acf	8a4fa6b3-2644-4c16-a70f-aee374858ee3
\.


--
-- Data for Name: person; Type: TABLE DATA; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

COPY workspace_5tvw23m2ae5qhvivd4el66s5c.person (id, "createdAt", "updatedAt", "deletedAt", "nameFirstName", "nameLastName", "emailsPrimaryEmail", "emailsAdditionalEmails", "linkedinLinkPrimaryLinkLabel", "linkedinLinkPrimaryLinkUrl", "linkedinLinkSecondaryLinks", "xLinkPrimaryLinkLabel", "xLinkPrimaryLinkUrl", "xLinkSecondaryLinks", "jobTitle", "phonesPrimaryPhoneNumber", "phonesPrimaryPhoneCountryCode", "phonesPrimaryPhoneCallingCode", "phonesAdditionalPhones", city, "avatarUrl", "avatarFile", "position", "createdBySource", "createdByWorkspaceMemberId", "createdByName", "createdByContext", "updatedBySource", "updatedByWorkspaceMemberId", "updatedByName", "updatedByContext", "companyId") FROM stdin;
a2e78a5e-338b-46df-8811-fa08c7d19d35	2026-04-25 11:34:19.069229+00	2026-04-25 11:34:19.069229+00	\N	Brian	Chesky	chesky@airbnb.com	\N	\N	\N	\N	\N	\N	\N	\N	123456789	\N	+1	\N	San Francisco	https://twentyhq.github.io/placeholder-images/founders/brian-chesky.jpg	\N	1	SYSTEM	\N	System	\N	SYSTEM	\N	System	\N	c776ee49-f608-4a77-8cc8-6fe96ae1e43f
93c72d2e-e65c-44c4-99ad-f87f50349dcf	2026-04-25 11:34:19.069229+00	2026-04-25 11:34:19.069229+00	\N	Dario	Amodei	amodei@anthropic.com	\N	\N	\N	\N	\N	\N	\N	\N	555123456	\N	+1	\N	San Francisco	https://twentyhq.github.io/placeholder-images/founders/dario-amodei.jpg	\N	2	SYSTEM	\N	System	\N	SYSTEM	\N	System	\N	f45ee421-8a3e-4aa5-a1cf-7207cc6754e1
edf6d445-13a7-4373-9a47-8f89e8c0a877	2026-04-25 11:34:19.069229+00	2026-04-25 11:34:19.069229+00	\N	Patrick	Collison	collison@stripe.com	\N	\N	\N	\N	\N	\N	\N	\N	987625341	\N	+1	\N	San Francisco	https://twentyhq.github.io/placeholder-images/founders/patrick-collison.jpg	\N	3	SYSTEM	\N	System	\N	SYSTEM	\N	System	\N	1f70157c-4ea5-4d81-bc49-e1401abfbb94
b1e26fa6-c757-4c88-abfa-4b11f5cf3acf	2026-04-25 11:34:19.069229+00	2026-04-25 11:34:19.069229+00	\N	Dylan	Field	field@figma.com	\N	\N	\N	\N	\N	\N	\N	\N	098822619	\N	+1	\N	San Francisco	https://twentyhq.github.io/placeholder-images/founders/dylan-field.jpg	\N	4	SYSTEM	\N	System	\N	SYSTEM	\N	System	\N	9d5bcf43-7d38-4e88-82cb-d6d4ce638bf0
7a93d1e5-3f74-4945-8a65-d7f996083f72	2026-04-25 11:34:19.069229+00	2026-04-25 11:34:19.069229+00	\N	Ivan	Zhao	zhao@notion.com	\N	\N	\N	\N	\N	\N	\N	\N	882261739	\N	+1	\N	San Francisco	https://twentyhq.github.io/placeholder-images/founders/ivan-zhao.jpg	\N	5	SYSTEM	\N	System	\N	SYSTEM	\N	System	\N	06290608-8bf0-4806-99ae-a715a6a93fad
\.


--
-- Data for Name: task; Type: TABLE DATA; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

COPY workspace_5tvw23m2ae5qhvivd4el66s5c.task (id, "createdAt", "updatedAt", "deletedAt", "position", title, "bodyV2Blocknote", "bodyV2Markdown", "dueAt", status, "createdBySource", "createdByWorkspaceMemberId", "createdByName", "createdByContext", "updatedBySource", "updatedByWorkspaceMemberId", "updatedByName", "updatedByContext", "assigneeId") FROM stdin;
\.


--
-- Data for Name: taskTarget; Type: TABLE DATA; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

COPY workspace_5tvw23m2ae5qhvivd4el66s5c."taskTarget" (id, "createdAt", "updatedAt", "deletedAt", "createdBySource", "createdByWorkspaceMemberId", "createdByName", "createdByContext", "updatedBySource", "updatedByWorkspaceMemberId", "updatedByName", "updatedByContext", "position", "targetCompanyId", "targetOpportunityId", "targetPersonId", "taskId", "targetHabitId", "targetHabitLogId") FROM stdin;
\.


--
-- Data for Name: timelineActivity; Type: TABLE DATA; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

COPY workspace_5tvw23m2ae5qhvivd4el66s5c."timelineActivity" (id, "createdAt", "updatedAt", "deletedAt", "createdBySource", "createdByWorkspaceMemberId", "createdByName", "createdByContext", "updatedBySource", "updatedByWorkspaceMemberId", "updatedByName", "updatedByContext", "position", "happensAt", name, properties, "linkedRecordCachedName", "linkedRecordId", "linkedObjectMetadataId", "targetCompanyId", "targetDashboardId", "targetNoteId", "targetOpportunityId", "targetPersonId", "targetTaskId", "workspaceMemberId", "targetWorkflowId", "targetWorkflowVersionId", "targetWorkflowRunId", "targetHabitId", "targetHabitLogId") FROM stdin;
\.


--
-- Data for Name: workflow; Type: TABLE DATA; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

COPY workspace_5tvw23m2ae5qhvivd4el66s5c.workflow (id, "createdAt", "updatedAt", "deletedAt", name, "lastPublishedVersionId", statuses, "position", "createdBySource", "createdByWorkspaceMemberId", "createdByName", "createdByContext", "updatedBySource", "updatedByWorkspaceMemberId", "updatedByName", "updatedByContext") FROM stdin;
8b213cac-a68b-4ffe-817a-3ec994e9932d	2026-04-25 11:34:19.069229+00	2026-04-25 11:34:19.069229+00	\N	Quick Lead	ac67974f-c524-4288-9d88-af8515400b68	{ACTIVE}	1	SYSTEM	\N	System	{}	SYSTEM	\N	System	\N
887c6c06-fbc5-4b45-8d6b-f7b6b0f40b12	2026-04-25 11:34:19.069229+00	2026-04-25 11:34:19.069229+00	\N	Create company when adding a new person	0f276d7e-a950-41ab-ad98-35e80753dc58	{ACTIVE}	2	SYSTEM	\N	System	{}	SYSTEM	\N	System	\N
\.


--
-- Data for Name: workflowAutomatedTrigger; Type: TABLE DATA; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

COPY workspace_5tvw23m2ae5qhvivd4el66s5c."workflowAutomatedTrigger" (id, "createdAt", "updatedAt", "deletedAt", "createdBySource", "createdByWorkspaceMemberId", "createdByName", "createdByContext", "updatedBySource", "updatedByWorkspaceMemberId", "updatedByName", "updatedByContext", "position", type, settings, "workflowId") FROM stdin;
c54f5990-13a3-4c3b-b75d-df09e7843036	2026-04-25 11:34:19.069229+00	2026-04-25 11:34:19.069229+00	\N	MANUAL	\N	System	\N	MANUAL	\N	System	\N	0	DATABASE_EVENT	{"fields": ["emails"], "eventName": "person.upserted"}	887c6c06-fbc5-4b45-8d6b-f7b6b0f40b12
\.


--
-- Data for Name: workflowRun; Type: TABLE DATA; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

COPY workspace_5tvw23m2ae5qhvivd4el66s5c."workflowRun" (id, "createdAt", "updatedAt", "deletedAt", name, "enqueuedAt", "startedAt", "endedAt", status, "createdBySource", "createdByWorkspaceMemberId", "createdByName", "createdByContext", "updatedBySource", "updatedByWorkspaceMemberId", "updatedByName", "updatedByContext", state, "position", "workflowId", "workflowVersionId") FROM stdin;
\.


--
-- Data for Name: workflowVersion; Type: TABLE DATA; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

COPY workspace_5tvw23m2ae5qhvivd4el66s5c."workflowVersion" (id, "createdAt", "updatedAt", "deletedAt", "createdBySource", "createdByWorkspaceMemberId", "createdByName", "createdByContext", "updatedBySource", "updatedByWorkspaceMemberId", "updatedByName", "updatedByContext", name, trigger, steps, status, "position", "workflowId") FROM stdin;
ac67974f-c524-4288-9d88-af8515400b68	2026-04-25 11:34:19.069229+00	2026-04-25 11:34:19.069229+00	\N	MANUAL	\N	System	\N	MANUAL	\N	System	\N	v1	{"name": "Launch manually", "type": "MANUAL", "settings": {"icon": "IconUserPlus", "availability": {"type": "GLOBAL"}, "outputSchema": {}}, "nextStepIds": ["6e089bc9-aabd-435f-865f-f31c01c8f4a7"]}	[{"id": "6e089bc9-aabd-435f-865f-f31c01c8f4a7", "name": "Quick Lead Form", "type": "FORM", "valid": false, "settings": {"input": [{"id": "14d669f0-5249-4fa4-b0bb-f8bd408328d5", "name": "firstName", "type": "TEXT", "label": "First name", "placeholder": "Tim"}, {"id": "4eb6ce85-d231-4aef-9837-744490c026d0", "name": "lastName", "type": "TEXT", "label": "Last Name", "placeholder": "Apple"}, {"id": "adbf0e9f-1427-49be-b4fb-092b34d97350", "name": "email", "type": "TEXT", "label": "Email", "placeholder": "timapple@apple.com"}, {"id": "4ffc7992-9e65-4a4d-9baf-b52e62f2c273", "name": "jobTitle", "type": "TEXT", "label": "Job title", "placeholder": "CEO"}, {"id": "42f11926-04ea-4924-94a4-2293cc748362", "name": "companyName", "type": "TEXT", "label": "Company name", "placeholder": "Apple"}, {"id": "d6ca80ee-26cd-466d-91bf-984d7205451c", "name": "companyDomain", "type": "TEXT", "label": "Company domain", "placeholder": "https://www.apple.com"}], "outputSchema": {"email": {"type": "TEXT", "label": "Email", "value": "My text", "isLeaf": true}, "jobTitle": {"type": "TEXT", "label": "Job title", "value": "My text", "isLeaf": true}, "lastName": {"type": "TEXT", "label": "Last Name", "value": "My text", "isLeaf": true}, "firstName": {"type": "TEXT", "label": "First name", "value": "My text", "isLeaf": true}, "companyName": {"type": "TEXT", "label": "Company name", "value": "My text", "isLeaf": true}, "companyDomain": {"type": "TEXT", "label": "Company domain", "value": "My text", "isLeaf": true}}, "errorHandlingOptions": {"retryOnFailure": {"value": false}, "continueOnFailure": {"value": false}}}, "__typename": "WorkflowAction", "nextStepIds": ["0715b6cd-7cc1-4b98-971b-00f54dfe643b"]}, {"id": "0715b6cd-7cc1-4b98-971b-00f54dfe643b", "name": "Create Company", "type": "CREATE_RECORD", "valid": false, "settings": {"input": {"objectName": "company", "objectRecord": {"name": "{{6e089bc9-aabd-435f-865f-f31c01c8f4a7.companyName}}", "domainName": {"primaryLinkUrl": "{{6e089bc9-aabd-435f-865f-f31c01c8f4a7.companyDomain}}", "primaryLinkLabel": ""}}}, "outputSchema": {"fields": {"id": {"icon": "Icon123", "type": "UUID", "label": "Id", "value": "123e4567-e89b-12d3-a456-426614174000", "isLeaf": true, "fieldMetadataId": "989ac6cb-adb6-415c-bf1d-162733db3813"}, "name": {"icon": "IconBuildingSkyscraper", "type": "TEXT", "label": "Name", "value": "My text", "isLeaf": true, "fieldMetadataId": "69512596-ab97-4a06-a1c9-006d5983356b"}, "xLink": {"icon": "IconBrandX", "type": "LINKS", "label": "X", "value": {"primaryLinkUrl": {"type": "TEXT", "label": "Primary Link Url", "value": "My text", "isLeaf": true, "fieldMetadataId": "73ed6365-303e-4fe4-ab86-b9a04ef19244", "isCompositeSubField": true}, "secondaryLinks": {"type": "RAW_JSON", "label": "Secondary Links", "value": null, "isLeaf": true, "fieldMetadataId": "73ed6365-303e-4fe4-ab86-b9a04ef19244", "isCompositeSubField": true}, "primaryLinkLabel": {"type": "TEXT", "label": "Primary Link Label", "value": "My text", "isLeaf": true, "fieldMetadataId": "73ed6365-303e-4fe4-ab86-b9a04ef19244", "isCompositeSubField": true}}, "isLeaf": false, "fieldMetadataId": "73ed6365-303e-4fe4-ab86-b9a04ef19244"}, "address": {"icon": "IconMap", "type": "ADDRESS", "label": "Address", "value": {"addressLat": {"type": "NUMERIC", "label": "Address Lat", "value": null, "isLeaf": true, "fieldMetadataId": "10cf8f8d-3811-4368-8a62-f850fac550bb", "isCompositeSubField": true}, "addressLng": {"type": "NUMERIC", "label": "Address Lng", "value": null, "isLeaf": true, "fieldMetadataId": "10cf8f8d-3811-4368-8a62-f850fac550bb", "isCompositeSubField": true}, "addressCity": {"type": "TEXT", "label": "Address City", "value": "My text", "isLeaf": true, "fieldMetadataId": "10cf8f8d-3811-4368-8a62-f850fac550bb", "isCompositeSubField": true}, "addressState": {"type": "TEXT", "label": "Address State", "value": "My text", "isLeaf": true, "fieldMetadataId": "10cf8f8d-3811-4368-8a62-f850fac550bb", "isCompositeSubField": true}, "addressCountry": {"type": "TEXT", "label": "Address Country", "value": "My text", "isLeaf": true, "fieldMetadataId": "10cf8f8d-3811-4368-8a62-f850fac550bb", "isCompositeSubField": true}, "addressStreet1": {"type": "TEXT", "label": "Address Street1", "value": "My text", "isLeaf": true, "fieldMetadataId": "10cf8f8d-3811-4368-8a62-f850fac550bb", "isCompositeSubField": true}, "addressStreet2": {"type": "TEXT", "label": "Address Street2", "value": "My text", "isLeaf": true, "fieldMetadataId": "10cf8f8d-3811-4368-8a62-f850fac550bb", "isCompositeSubField": true}, "addressPostcode": {"type": "TEXT", "label": "Address Postcode", "value": "My text", "isLeaf": true, "fieldMetadataId": "10cf8f8d-3811-4368-8a62-f850fac550bb", "isCompositeSubField": true}}, "isLeaf": false, "fieldMetadataId": "10cf8f8d-3811-4368-8a62-f850fac550bb"}, "createdAt": {"icon": "IconCalendar", "type": "DATE_TIME", "label": "Creation date", "value": "01/23/2025 15:16", "isLeaf": true, "fieldMetadataId": "9737fc59-4955-431f-aaa0-81f449767c67"}, "createdBy": {"icon": "IconCreativeCommonsSa", "type": "ACTOR", "label": "Created by", "value": {"name": {"type": "TEXT", "label": "Name", "value": "My text", "isLeaf": true, "fieldMetadataId": "dbeed298-970c-4c45-94b7-43e30b4e08b7", "isCompositeSubField": true}, "source": {"type": "SELECT", "label": "Source", "value": null, "isLeaf": true, "fieldMetadataId": "dbeed298-970c-4c45-94b7-43e30b4e08b7", "isCompositeSubField": true}, "context": {"type": "RAW_JSON", "label": "Context", "value": null, "isLeaf": true, "fieldMetadataId": "dbeed298-970c-4c45-94b7-43e30b4e08b7", "isCompositeSubField": true}, "workspaceMemberId": {"type": "UUID", "label": "Workspace Member Id", "value": "123e4567-e89b-12d3-a456-426614174000", "isLeaf": true, "fieldMetadataId": "dbeed298-970c-4c45-94b7-43e30b4e08b7", "isCompositeSubField": true}}, "isLeaf": false, "fieldMetadataId": "dbeed298-970c-4c45-94b7-43e30b4e08b7"}, "deletedAt": {"icon": "IconCalendarMinus", "type": "DATE_TIME", "label": "Deleted at", "value": "01/23/2025 15:16", "isLeaf": true, "fieldMetadataId": "5033f182-0702-42c3-9ac3-220672b31aaa"}, "employees": {"icon": "IconUsers", "type": "NUMBER", "label": "Employees", "value": 20, "isLeaf": true, "fieldMetadataId": "31951850-f9d4-400a-936b-e64c900abb08"}, "updatedAt": {"icon": "IconCalendarClock", "type": "DATE_TIME", "label": "Last update", "value": "01/23/2025 15:16", "isLeaf": true, "fieldMetadataId": "e7d1b58f-d423-4360-8b0a-0984dfdb5524"}, "updatedBy": {"icon": "IconUserCircle", "type": "ACTOR", "label": "Updated by", "value": {"name": {"type": "TEXT", "label": "Name", "value": "My text", "isLeaf": true, "fieldMetadataId": "b301914a-64ca-4198-81ee-9c0eacb12643", "isCompositeSubField": true}, "source": {"type": "SELECT", "label": "Source", "value": null, "isLeaf": true, "fieldMetadataId": "b301914a-64ca-4198-81ee-9c0eacb12643", "isCompositeSubField": true}, "context": {"type": "RAW_JSON", "label": "Context", "value": null, "isLeaf": true, "fieldMetadataId": "b301914a-64ca-4198-81ee-9c0eacb12643", "isCompositeSubField": true}, "workspaceMemberId": {"type": "UUID", "label": "Workspace Member Id", "value": "123e4567-e89b-12d3-a456-426614174000", "isLeaf": true, "fieldMetadataId": "b301914a-64ca-4198-81ee-9c0eacb12643", "isCompositeSubField": true}}, "isLeaf": false, "fieldMetadataId": "b301914a-64ca-4198-81ee-9c0eacb12643"}, "domainName": {"icon": "IconLink", "type": "LINKS", "label": "Domain Name", "value": {"primaryLinkUrl": {"type": "TEXT", "label": "Primary Link Url", "value": "My text", "isLeaf": true, "fieldMetadataId": "1293a7d1-bf10-4dc2-a75f-c0166cef618e", "isCompositeSubField": true}, "secondaryLinks": {"type": "RAW_JSON", "label": "Secondary Links", "value": null, "isLeaf": true, "fieldMetadataId": "1293a7d1-bf10-4dc2-a75f-c0166cef618e", "isCompositeSubField": true}, "primaryLinkLabel": {"type": "TEXT", "label": "Primary Link Label", "value": "My text", "isLeaf": true, "fieldMetadataId": "1293a7d1-bf10-4dc2-a75f-c0166cef618e", "isCompositeSubField": true}}, "isLeaf": false, "fieldMetadataId": "1293a7d1-bf10-4dc2-a75f-c0166cef618e"}, "linkedinLink": {"icon": "IconBrandLinkedin", "type": "LINKS", "label": "Linkedin", "value": {"primaryLinkUrl": {"type": "TEXT", "label": "Primary Link Url", "value": "My text", "isLeaf": true, "fieldMetadataId": "5ebf4172-7532-42dc-825d-193e2f421de9", "isCompositeSubField": true}, "secondaryLinks": {"type": "RAW_JSON", "label": "Secondary Links", "value": null, "isLeaf": true, "fieldMetadataId": "5ebf4172-7532-42dc-825d-193e2f421de9", "isCompositeSubField": true}, "primaryLinkLabel": {"type": "TEXT", "label": "Primary Link Label", "value": "My text", "isLeaf": true, "fieldMetadataId": "5ebf4172-7532-42dc-825d-193e2f421de9", "isCompositeSubField": true}}, "isLeaf": false, "fieldMetadataId": "5ebf4172-7532-42dc-825d-193e2f421de9"}, "accountOwnerId": {"icon": "IconUserCircle", "type": "UUID", "label": "Account Owner Id", "value": "123e4567-e89b-12d3-a456-426614174000", "isLeaf": true, "fieldMetadataId": "bebb69c6-7327-4c21-ba85-70039c4154a0"}, "idealCustomerProfile": {"icon": "IconTarget", "type": "BOOLEAN", "label": "ICP", "value": true, "isLeaf": true, "fieldMetadataId": "af93449c-cb6e-4025-9140-08e4606fa185"}, "annualRecurringRevenue": {"icon": "IconMoneybag", "type": "CURRENCY", "label": "ARR", "value": {"amountMicros": {"type": "NUMERIC", "label": "Amount Micros", "value": null, "isLeaf": true, "fieldMetadataId": "f460516e-7aa7-48b8-b2fd-dabb6eeadeac", "isCompositeSubField": true}, "currencyCode": {"type": "TEXT", "label": "Currency Code", "value": "My text", "isLeaf": true, "fieldMetadataId": "f460516e-7aa7-48b8-b2fd-dabb6eeadeac", "isCompositeSubField": true}}, "isLeaf": false, "fieldMetadataId": "f460516e-7aa7-48b8-b2fd-dabb6eeadeac"}}, "object": {"icon": "IconBuildingSkyscraper", "label": "Company", "value": "A company", "isLeaf": true, "fieldIdName": "id", "nameSingular": "company"}, "_outputSchemaType": "RECORD"}, "errorHandlingOptions": {"retryOnFailure": {"value": false}, "continueOnFailure": {"value": false}}}, "__typename": "WorkflowAction", "nextStepIds": ["6f553ea7-b00e-4371-9d88-d8298568a246"]}, {"id": "6f553ea7-b00e-4371-9d88-d8298568a246", "name": "Create Person", "type": "CREATE_RECORD", "valid": false, "settings": {"input": {"objectName": "person", "objectRecord": {"name": {"lastName": "{{6e089bc9-aabd-435f-865f-f31c01c8f4a7.lastName}}", "firstName": "{{6e089bc9-aabd-435f-865f-f31c01c8f4a7.firstName}}"}, "emails": {"primaryEmail": "{{6e089bc9-aabd-435f-865f-f31c01c8f4a7.email}}", "additionalEmails": []}, "companyId": "{{0715b6cd-7cc1-4b98-971b-00f54dfe643b.id}}"}}, "outputSchema": {"fields": {"id": {"icon": "Icon123", "type": "UUID", "label": "Id", "value": "123e4567-e89b-12d3-a456-426614174000", "isLeaf": true, "fieldMetadataId": "e329d2d4-4879-47da-8402-401b5966faa1"}, "city": {"icon": "IconMap", "type": "TEXT", "label": "City", "value": "My text", "isLeaf": true, "fieldMetadataId": "b9c947b4-e238-44ff-89d9-11a2de5ae267"}, "name": {"icon": "IconUser", "type": "FULL_NAME", "label": "Name", "value": {"lastName": {"type": "TEXT", "label": "Last Name", "value": "My text", "isLeaf": true, "fieldMetadataId": "643bc00b-8772-46ed-bd47-00acc00fb8a5", "isCompositeSubField": true}, "firstName": {"type": "TEXT", "label": "First Name", "value": "My text", "isLeaf": true, "fieldMetadataId": "643bc00b-8772-46ed-bd47-00acc00fb8a5", "isCompositeSubField": true}}, "isLeaf": false, "fieldMetadataId": "643bc00b-8772-46ed-bd47-00acc00fb8a5"}, "xLink": {"icon": "IconBrandX", "type": "LINKS", "label": "X", "value": {"primaryLinkUrl": {"type": "TEXT", "label": "Primary Link Url", "value": "My text", "isLeaf": true, "fieldMetadataId": "08b80a08-0360-4346-aa0e-a406666210ba", "isCompositeSubField": true}, "secondaryLinks": {"type": "RAW_JSON", "label": "Secondary Links", "value": null, "isLeaf": true, "fieldMetadataId": "08b80a08-0360-4346-aa0e-a406666210ba", "isCompositeSubField": true}, "primaryLinkLabel": {"type": "TEXT", "label": "Primary Link Label", "value": "My text", "isLeaf": true, "fieldMetadataId": "08b80a08-0360-4346-aa0e-a406666210ba", "isCompositeSubField": true}}, "isLeaf": false, "fieldMetadataId": "08b80a08-0360-4346-aa0e-a406666210ba"}, "emails": {"icon": "IconMail", "type": "EMAILS", "label": "Emails", "value": {"primaryEmail": {"type": "TEXT", "label": "Primary Email", "value": "My text", "isLeaf": true, "fieldMetadataId": "0d02b1fa-feb0-48dc-a361-95533309ea0f", "isCompositeSubField": true}, "additionalEmails": {"type": "RAW_JSON", "label": "Additional Emails", "value": null, "isLeaf": true, "fieldMetadataId": "0d02b1fa-feb0-48dc-a361-95533309ea0f", "isCompositeSubField": true}}, "isLeaf": false, "fieldMetadataId": "0d02b1fa-feb0-48dc-a361-95533309ea0f"}, "phones": {"icon": "IconPhone", "type": "PHONES", "label": "Phones", "value": {"additionalPhones": {"type": "RAW_JSON", "label": "Additional Phones", "value": null, "isLeaf": true, "fieldMetadataId": "a431ac64-8f23-4a8b-abfa-1c0185afddbb", "isCompositeSubField": true}, "primaryPhoneNumber": {"type": "TEXT", "label": "Primary Phone Number", "value": "My text", "isLeaf": true, "fieldMetadataId": "a431ac64-8f23-4a8b-abfa-1c0185afddbb", "isCompositeSubField": true}, "primaryPhoneCallingCode": {"type": "TEXT", "label": "Primary Phone Calling Code", "value": "My text", "isLeaf": true, "fieldMetadataId": "a431ac64-8f23-4a8b-abfa-1c0185afddbb", "isCompositeSubField": true}, "primaryPhoneCountryCode": {"type": "TEXT", "label": "Primary Phone Country Code", "value": "My text", "isLeaf": true, "fieldMetadataId": "a431ac64-8f23-4a8b-abfa-1c0185afddbb", "isCompositeSubField": true}}, "isLeaf": false, "fieldMetadataId": "a431ac64-8f23-4a8b-abfa-1c0185afddbb"}, "jobTitle": {"icon": "IconBriefcase", "type": "TEXT", "label": "Job Title", "value": "My text", "isLeaf": true, "fieldMetadataId": "4f8fedc8-8be0-4c53-8363-a8b2c6116962"}, "avatarUrl": {"icon": "IconFileUpload", "type": "TEXT", "label": "Avatar", "value": "My text", "isLeaf": true, "fieldMetadataId": "10e09fbb-ce99-4271-a1bf-3ee3eeb593f7"}, "companyId": {"icon": "IconBuildingSkyscraper", "type": "UUID", "label": "Company Id", "value": "123e4567-e89b-12d3-a456-426614174000", "isLeaf": true, "fieldMetadataId": "a045fbba-8284-497a-bba2-cd71dff54cef"}, "createdAt": {"icon": "IconCalendar", "type": "DATE_TIME", "label": "Creation date", "value": "01/23/2025 15:16", "isLeaf": true, "fieldMetadataId": "f19480c3-fb79-4813-8532-8d78dd80c5af"}, "createdBy": {"icon": "IconCreativeCommonsSa", "type": "ACTOR", "label": "Created by", "value": {"name": {"type": "TEXT", "label": "Name", "value": "My text", "isLeaf": true, "fieldMetadataId": "ea2b28f9-8389-416c-82b1-61cb0a6fc1cf", "isCompositeSubField": true}, "source": {"type": "SELECT", "label": "Source", "value": null, "isLeaf": true, "fieldMetadataId": "ea2b28f9-8389-416c-82b1-61cb0a6fc1cf", "isCompositeSubField": true}, "context": {"type": "RAW_JSON", "label": "Context", "value": null, "isLeaf": true, "fieldMetadataId": "ea2b28f9-8389-416c-82b1-61cb0a6fc1cf", "isCompositeSubField": true}, "workspaceMemberId": {"type": "UUID", "label": "Workspace Member Id", "value": "123e4567-e89b-12d3-a456-426614174000", "isLeaf": true, "fieldMetadataId": "ea2b28f9-8389-416c-82b1-61cb0a6fc1cf", "isCompositeSubField": true}}, "isLeaf": false, "fieldMetadataId": "ea2b28f9-8389-416c-82b1-61cb0a6fc1cf"}, "deletedAt": {"icon": "IconCalendarMinus", "type": "DATE_TIME", "label": "Deleted at", "value": "01/23/2025 15:16", "isLeaf": true, "fieldMetadataId": "b7c859be-b75e-4734-8f25-ff5735e259ac"}, "updatedAt": {"icon": "IconCalendarClock", "type": "DATE_TIME", "label": "Last update", "value": "01/23/2025 15:16", "isLeaf": true, "fieldMetadataId": "5cb03ab1-1739-4408-bd99-a263dc5cc9ca"}, "updatedBy": {"icon": "IconUserCircle", "type": "ACTOR", "label": "Updated by", "value": {"name": {"type": "TEXT", "label": "Name", "value": "My text", "isLeaf": true, "fieldMetadataId": "aaf0a4d0-8ec1-40ae-aa77-47f2d4289947", "isCompositeSubField": true}, "source": {"type": "SELECT", "label": "Source", "value": null, "isLeaf": true, "fieldMetadataId": "aaf0a4d0-8ec1-40ae-aa77-47f2d4289947", "isCompositeSubField": true}, "context": {"type": "RAW_JSON", "label": "Context", "value": null, "isLeaf": true, "fieldMetadataId": "aaf0a4d0-8ec1-40ae-aa77-47f2d4289947", "isCompositeSubField": true}, "workspaceMemberId": {"type": "UUID", "label": "Workspace Member Id", "value": "123e4567-e89b-12d3-a456-426614174000", "isLeaf": true, "fieldMetadataId": "aaf0a4d0-8ec1-40ae-aa77-47f2d4289947", "isCompositeSubField": true}}, "isLeaf": false, "fieldMetadataId": "aaf0a4d0-8ec1-40ae-aa77-47f2d4289947"}, "avatarFile": {"icon": "IconFileUpload", "type": "FILES", "label": "Avatar File", "value": null, "isLeaf": true, "fieldMetadataId": "7905e868-5470-44dc-8e22-f3db7cae022d"}, "linkedinLink": {"icon": "IconBrandLinkedin", "type": "LINKS", "label": "Linkedin", "value": {"primaryLinkUrl": {"type": "TEXT", "label": "Primary Link Url", "value": "My text", "isLeaf": true, "fieldMetadataId": "32f2fd13-d449-4abf-8f35-f72eb7b44560", "isCompositeSubField": true}, "secondaryLinks": {"type": "RAW_JSON", "label": "Secondary Links", "value": null, "isLeaf": true, "fieldMetadataId": "32f2fd13-d449-4abf-8f35-f72eb7b44560", "isCompositeSubField": true}, "primaryLinkLabel": {"type": "TEXT", "label": "Primary Link Label", "value": "My text", "isLeaf": true, "fieldMetadataId": "32f2fd13-d449-4abf-8f35-f72eb7b44560", "isCompositeSubField": true}}, "isLeaf": false, "fieldMetadataId": "32f2fd13-d449-4abf-8f35-f72eb7b44560"}}}, "errorHandlingOptions": {"retryOnFailure": {"value": false}, "continueOnFailure": {"value": false}}}, "__typename": "WorkflowAction", "nextStepIds": null}]	ACTIVE	1	8b213cac-a68b-4ffe-817a-3ec994e9932d
0f276d7e-a950-41ab-ad98-35e80753dc58	2026-04-25 11:34:19.069229+00	2026-04-25 11:34:19.069229+00	\N	MANUAL	\N	System	\N	MANUAL	\N	System	\N	v1	{"name": "Record is created or updated", "type": "DATABASE_EVENT", "settings": {"fields": ["emails"], "eventName": "person.upserted", "outputSchema": {"fields": {"properties.after.id": {"icon": "Icon123", "type": "UUID", "label": "Id", "value": "123e4567-e89b-12d3-a456-426614174000", "isLeaf": true, "fieldMetadataId": "e329d2d4-4879-47da-8402-401b5966faa1"}, "properties.after.city": {"icon": "IconMap", "type": "TEXT", "label": "City", "value": "My text", "isLeaf": true, "fieldMetadataId": "b9c947b4-e238-44ff-89d9-11a2de5ae267"}, "properties.after.name": {"icon": "IconUser", "type": "FULL_NAME", "label": "Name", "value": {"lastName": {"type": "TEXT", "label": "Last Name", "value": "My text", "isLeaf": true, "fieldMetadataId": "643bc00b-8772-46ed-bd47-00acc00fb8a5", "isCompositeSubField": true}, "firstName": {"type": "TEXT", "label": "First Name", "value": "My text", "isLeaf": true, "fieldMetadataId": "643bc00b-8772-46ed-bd47-00acc00fb8a5", "isCompositeSubField": true}}, "isLeaf": false, "fieldMetadataId": "643bc00b-8772-46ed-bd47-00acc00fb8a5"}, "properties.after.xLink": {"icon": "IconBrandX", "type": "LINKS", "label": "X", "value": {"primaryLinkUrl": {"type": "TEXT", "label": "Primary Link Url", "value": "My text", "isLeaf": true, "fieldMetadataId": "08b80a08-0360-4346-aa0e-a406666210ba", "isCompositeSubField": true}, "secondaryLinks": {"type": "RAW_JSON", "label": "Secondary Links", "value": null, "isLeaf": true, "fieldMetadataId": "08b80a08-0360-4346-aa0e-a406666210ba", "isCompositeSubField": true}, "primaryLinkLabel": {"type": "TEXT", "label": "Primary Link Label", "value": "My text", "isLeaf": true, "fieldMetadataId": "08b80a08-0360-4346-aa0e-a406666210ba", "isCompositeSubField": true}}, "isLeaf": false, "fieldMetadataId": "08b80a08-0360-4346-aa0e-a406666210ba"}, "properties.after.emails": {"icon": "IconMail", "type": "EMAILS", "label": "Emails", "value": {"primaryEmail": {"type": "TEXT", "label": "Primary Email", "value": "My text", "isLeaf": true, "fieldMetadataId": "0d02b1fa-feb0-48dc-a361-95533309ea0f", "isCompositeSubField": true}, "additionalEmails": {"type": "RAW_JSON", "label": "Additional Emails", "value": null, "isLeaf": true, "fieldMetadataId": "0d02b1fa-feb0-48dc-a361-95533309ea0f", "isCompositeSubField": true}}, "isLeaf": false, "fieldMetadataId": "0d02b1fa-feb0-48dc-a361-95533309ea0f"}, "properties.after.phones": {"icon": "IconPhone", "type": "PHONES", "label": "Phones", "value": {"additionalPhones": {"type": "RAW_JSON", "label": "Additional Phones", "value": null, "isLeaf": true, "fieldMetadataId": "a431ac64-8f23-4a8b-abfa-1c0185afddbb", "isCompositeSubField": true}, "primaryPhoneNumber": {"type": "TEXT", "label": "Primary Phone Number", "value": "My text", "isLeaf": true, "fieldMetadataId": "a431ac64-8f23-4a8b-abfa-1c0185afddbb", "isCompositeSubField": true}, "primaryPhoneCallingCode": {"type": "TEXT", "label": "Primary Phone Calling Code", "value": "My text", "isLeaf": true, "fieldMetadataId": "a431ac64-8f23-4a8b-abfa-1c0185afddbb", "isCompositeSubField": true}, "primaryPhoneCountryCode": {"type": "TEXT", "label": "Primary Phone Country Code", "value": "My text", "isLeaf": true, "fieldMetadataId": "a431ac64-8f23-4a8b-abfa-1c0185afddbb", "isCompositeSubField": true}}, "isLeaf": false, "fieldMetadataId": "a431ac64-8f23-4a8b-abfa-1c0185afddbb"}, "properties.after.jobTitle": {"icon": "IconBriefcase", "type": "TEXT", "label": "Job Title", "value": "My text", "isLeaf": true, "fieldMetadataId": "4f8fedc8-8be0-4c53-8363-a8b2c6116962"}, "properties.after.avatarUrl": {"icon": "IconFileUpload", "type": "TEXT", "label": "Avatar", "value": "My text", "isLeaf": true, "fieldMetadataId": "10e09fbb-ce99-4271-a1bf-3ee3eeb593f7"}, "properties.after.companyId": {"icon": "IconBuildingSkyscraper", "type": "UUID", "label": "Company Id", "value": "123e4567-e89b-12d3-a456-426614174000", "isLeaf": true, "fieldMetadataId": "a045fbba-8284-497a-bba2-cd71dff54cef"}, "properties.after.createdAt": {"icon": "IconCalendar", "type": "DATE_TIME", "label": "Creation date", "value": "01/23/2025 15:16", "isLeaf": true, "fieldMetadataId": "f19480c3-fb79-4813-8532-8d78dd80c5af"}, "properties.after.createdBy": {"icon": "IconCreativeCommonsSa", "type": "ACTOR", "label": "Created by", "value": {"name": {"type": "TEXT", "label": "Name", "value": "My text", "isLeaf": true, "fieldMetadataId": "ea2b28f9-8389-416c-82b1-61cb0a6fc1cf", "isCompositeSubField": true}, "source": {"type": "SELECT", "label": "Source", "value": null, "isLeaf": true, "fieldMetadataId": "ea2b28f9-8389-416c-82b1-61cb0a6fc1cf", "isCompositeSubField": true}, "context": {"type": "RAW_JSON", "label": "Context", "value": null, "isLeaf": true, "fieldMetadataId": "ea2b28f9-8389-416c-82b1-61cb0a6fc1cf", "isCompositeSubField": true}, "workspaceMemberId": {"type": "UUID", "label": "Workspace Member Id", "value": "123e4567-e89b-12d3-a456-426614174000", "isLeaf": true, "fieldMetadataId": "ea2b28f9-8389-416c-82b1-61cb0a6fc1cf", "isCompositeSubField": true}}, "isLeaf": false, "fieldMetadataId": "ea2b28f9-8389-416c-82b1-61cb0a6fc1cf"}, "properties.after.deletedAt": {"icon": "IconCalendarMinus", "type": "DATE_TIME", "label": "Deleted at", "value": "01/23/2025 15:16", "isLeaf": true, "fieldMetadataId": "b7c859be-b75e-4734-8f25-ff5735e259ac"}, "properties.after.updatedAt": {"icon": "IconCalendarClock", "type": "DATE_TIME", "label": "Last update", "value": "01/23/2025 15:16", "isLeaf": true, "fieldMetadataId": "5cb03ab1-1739-4408-bd99-a263dc5cc9ca"}, "properties.after.updatedBy": {"icon": "IconUserCircle", "type": "ACTOR", "label": "Updated by", "value": {"name": {"type": "TEXT", "label": "Name", "value": "My text", "isLeaf": true, "fieldMetadataId": "aaf0a4d0-8ec1-40ae-aa77-47f2d4289947", "isCompositeSubField": true}, "source": {"type": "SELECT", "label": "Source", "value": null, "isLeaf": true, "fieldMetadataId": "aaf0a4d0-8ec1-40ae-aa77-47f2d4289947", "isCompositeSubField": true}, "context": {"type": "RAW_JSON", "label": "Context", "value": null, "isLeaf": true, "fieldMetadataId": "aaf0a4d0-8ec1-40ae-aa77-47f2d4289947", "isCompositeSubField": true}, "workspaceMemberId": {"type": "UUID", "label": "Workspace Member Id", "value": "123e4567-e89b-12d3-a456-426614174000", "isLeaf": true, "fieldMetadataId": "aaf0a4d0-8ec1-40ae-aa77-47f2d4289947", "isCompositeSubField": true}}, "isLeaf": false, "fieldMetadataId": "aaf0a4d0-8ec1-40ae-aa77-47f2d4289947"}, "properties.after.avatarFile": {"icon": "IconFileUpload", "type": "FILES", "label": "Avatar File", "value": null, "isLeaf": true, "fieldMetadataId": "7905e868-5470-44dc-8e22-f3db7cae022d"}, "properties.after.linkedinLink": {"icon": "IconBrandLinkedin", "type": "LINKS", "label": "Linkedin", "value": {"primaryLinkUrl": {"type": "TEXT", "label": "Primary Link Url", "value": "My text", "isLeaf": true, "fieldMetadataId": "32f2fd13-d449-4abf-8f35-f72eb7b44560", "isCompositeSubField": true}, "secondaryLinks": {"type": "RAW_JSON", "label": "Secondary Links", "value": null, "isLeaf": true, "fieldMetadataId": "32f2fd13-d449-4abf-8f35-f72eb7b44560", "isCompositeSubField": true}, "primaryLinkLabel": {"type": "TEXT", "label": "Primary Link Label", "value": "My text", "isLeaf": true, "fieldMetadataId": "32f2fd13-d449-4abf-8f35-f72eb7b44560", "isCompositeSubField": true}}, "isLeaf": false, "fieldMetadataId": "32f2fd13-d449-4abf-8f35-f72eb7b44560"}}, "object": {"icon": "IconUser", "label": "Person", "value": "A person", "isLeaf": true, "fieldIdName": "properties.after.id", "objectMetadataId": "f59c15d0-9a52-4e93-b44f-ed4fc4bd90be"}, "_outputSchemaType": "RECORD"}}, "nextStepIds": ["c30d7cbe-00e0-4966-bc1a-99b0a11a2cca"]}	[{"id": "c30d7cbe-00e0-4966-bc1a-99b0a11a2cca", "name": "Is this a personal email?", "type": "CODE", "valid": false, "position": {"x": 227.25, "y": 130}, "settings": {"input": {"logicFunctionId": "e74f8dec-3d4a-5504-94ec-de196a36805e", "logicFunctionInput": {"primaryEmail": "{{trigger.properties.after.emails.primaryEmail}}"}}, "outputSchema": {"isPersonal": {"type": "boolean", "label": "isPersonal", "value": true, "isLeaf": true}}, "errorHandlingOptions": {"retryOnFailure": {"value": false}, "continueOnFailure": {"value": false}}}, "__typename": "WorkflowAction", "nextStepIds": ["01f3db05-aae5-4e4b-b361-96684f09c704"]}, {"id": "01f3db05-aae5-4e4b-b361-96684f09c704", "name": "If business email", "type": "FILTER", "valid": false, "position": {"x": 249.25, "y": 260}, "settings": {"input": {"stepFilters": [{"id": "0e595385-9e18-4869-abfd-cf72952b124c", "type": "boolean", "value": "false", "operand": "IS", "isFullRecord": false, "stepOutputKey": "{{c30d7cbe-00e0-4966-bc1a-99b0a11a2cca.isPersonal}}", "stepFilterGroupId": "5204d5f5-7b23-428c-9f84-c37971d497d3", "positionInStepFilterGroup": 0}], "stepFilterGroups": [{"id": "5204d5f5-7b23-428c-9f84-c37971d497d3", "logicalOperator": "AND"}]}, "outputSchema": {}, "errorHandlingOptions": {"retryOnFailure": {"value": false}, "continueOnFailure": {"value": false}}}, "__typename": "WorkflowAction", "nextStepIds": ["1b01193b-8300-4d79-940b-44464bf45505"]}, {"id": "1b01193b-8300-4d79-940b-44464bf45505", "name": "Extract domain from email", "type": "CODE", "valid": false, "position": {"x": 219.75, "y": 390}, "settings": {"input": {"logicFunctionId": "a82e3309-11ae-552c-a456-d803c30162d1", "logicFunctionInput": {"email": "{{trigger.properties.after.emails.primaryEmail}}"}}, "outputSchema": {"url": {"icon": "IconVariable", "type": "string", "label": "url", "value": "https://twenty.com", "isLeaf": true}, "domain": {"icon": "IconVariable", "type": "string", "label": "domain", "value": "twenty.com", "isLeaf": true}}, "errorHandlingOptions": {"retryOnFailure": {"value": false}, "continueOnFailure": {"value": false}}}, "__typename": "WorkflowAction", "nextStepIds": ["becb3acf-79bb-4672-8a42-3696e94957b5"]}, {"id": "becb3acf-79bb-4672-8a42-3696e94957b5", "name": "Search Company", "type": "FIND_RECORDS", "valid": false, "position": {"x": 247.75, "y": 520}, "settings": {"input": {"limit": 25, "filter": {"recordFilters": [{"id": "a9b917a0-5c4c-4e8f-bf91-160d0b888693", "type": "LINKS", "label": "Domain Name", "value": "{{1b01193b-8300-4d79-940b-44464bf45505.domain}}", "operand": "CONTAINS", "displayValue": "{{1b01193b-8300-4d79-940b-44464bf45505.domain}}", "subFieldName": "primaryLinkUrl", "fieldMetadataId": "1293a7d1-bf10-4dc2-a75f-c0166cef618e", "recordFilterGroupId": "194e151c-cf46-4e8f-a48b-649c36082dfa"}], "recordFilterGroups": [{"id": "194e151c-cf46-4e8f-a48b-649c36082dfa", "logicalOperator": "AND"}]}, "objectName": "company"}, "outputSchema": {}, "errorHandlingOptions": {"retryOnFailure": {"value": false}, "continueOnFailure": {"value": false}}}, "__typename": "WorkflowAction", "nextStepIds": ["9d0b6ef2-aad2-4853-92e1-95f2abf10d5b"]}, {"id": "9d0b6ef2-aad2-4853-92e1-95f2abf10d5b", "name": "Find exact company match", "type": "CODE", "valid": false, "position": {"x": 247.75, "y": 650}, "settings": {"input": {"logicFunctionId": "8e00d17d-60e3-5bbc-bc04-1a591fd2d50e", "logicFunctionInput": {"domain": "{{1b01193b-8300-4d79-940b-44464bf45505.domain}}", "companies": "{{becb3acf-79bb-4672-8a42-3696e94957b5.all}}"}}, "outputSchema": {"hasMatch": {"type": "boolean", "label": "hasMatch", "value": true, "isLeaf": true}, "companyId": {"type": "string", "label": "companyId", "value": "00000000-0000-0000-0000-000000000000", "isLeaf": true}}, "errorHandlingOptions": {"retryOnFailure": {"value": false}, "continueOnFailure": {"value": false}}}, "__typename": "WorkflowAction", "nextStepIds": ["0c99a900-656a-40e8-977e-5a7357be33b9"]}, {"id": "0c99a900-656a-40e8-977e-5a7357be33b9", "name": "If a company already exists", "type": "IF_ELSE", "valid": false, "position": {"x": 216.25, "y": 780}, "settings": {"input": {"branches": [{"id": "1344c151-15ff-40e2-a1a3-925fabaf5b1c", "nextStepIds": ["ffdd4271-75d4-4805-b1f8-2167a113c3b2"], "filterGroupId": "f5c41047-2a6e-49fb-968a-fa7789a90ee5"}, {"id": "fe6dd152-1103-4324-af51-3ff994d1f8a7", "nextStepIds": ["ddafb9db-a94f-40b9-a5c9-becce857edf7"]}], "stepFilters": [{"id": "290cc6a3-08fd-4be5-b42e-966d0bb90ff7", "type": "boolean", "value": "true", "operand": "IS", "isFullRecord": false, "stepOutputKey": "{{9d0b6ef2-aad2-4853-92e1-95f2abf10d5b.hasMatch}}", "stepFilterGroupId": "f5c41047-2a6e-49fb-968a-fa7789a90ee5", "positionInStepFilterGroup": 0}], "stepFilterGroups": [{"id": "f5c41047-2a6e-49fb-968a-fa7789a90ee5", "logicalOperator": "AND"}]}, "outputSchema": {}, "errorHandlingOptions": {"retryOnFailure": {"value": false}, "continueOnFailure": {"value": false}}}, "__typename": "WorkflowAction"}, {"id": "ffdd4271-75d4-4805-b1f8-2167a113c3b2", "name": "Attach person to existing company", "type": "UPDATE_RECORD", "valid": false, "position": {"x": 0, "y": 910}, "settings": {"input": {"objectName": "person", "objectRecord": {"companyId": "{{9d0b6ef2-aad2-4853-92e1-95f2abf10d5b.companyId}}"}, "fieldsToUpdate": ["companyId"], "objectRecordId": "{{trigger.properties.after.id}}"}, "outputSchema": {}, "errorHandlingOptions": {"retryOnFailure": {"value": false}, "continueOnFailure": {"value": false}}}, "__typename": "WorkflowAction"}, {"id": "ddafb9db-a94f-40b9-a5c9-becce857edf7", "name": "Create a new company", "type": "CREATE_RECORD", "valid": false, "position": {"x": 440, "y": 910}, "settings": {"input": {"objectName": "company", "objectRecord": {"name": "{{1b01193b-8300-4d79-940b-44464bf45505.domain}}", "domainName": {"primaryLinkUrl": "{{1b01193b-8300-4d79-940b-44464bf45505.url}}", "primaryLinkLabel": "{{1b01193b-8300-4d79-940b-44464bf45505.domain}}"}}}, "outputSchema": {}, "errorHandlingOptions": {"retryOnFailure": {"value": false}, "continueOnFailure": {"value": false}}}, "__typename": "WorkflowAction", "nextStepIds": ["d5d5d6e1-391f-4142-83c1-670f7087f079"]}, {"id": "d5d5d6e1-391f-4142-83c1-670f7087f079", "name": "Attach person to this company", "type": "UPDATE_RECORD", "valid": false, "position": {"x": 420.5, "y": 1040}, "settings": {"input": {"objectName": "person", "objectRecord": {"companyId": "{{ddafb9db-a94f-40b9-a5c9-becce857edf7.id}}"}, "fieldsToUpdate": ["companyId"], "objectRecordId": "{{trigger.properties.after.id}}"}, "outputSchema": {}, "errorHandlingOptions": {"retryOnFailure": {"value": false}, "continueOnFailure": {"value": false}}}, "__typename": "WorkflowAction"}]	ACTIVE	2	887c6c06-fbc5-4b45-8d6b-f7b6b0f40b12
\.


--
-- Data for Name: workspaceMember; Type: TABLE DATA; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

COPY workspace_5tvw23m2ae5qhvivd4el66s5c."workspaceMember" (id, "createdAt", "updatedAt", "deletedAt", "position", "nameFirstName", "nameLastName", "colorScheme", locale, "avatarUrl", "userEmail", "calendarStartDay", "userId", "timeZone", "dateFormat", "timeFormat", "numberFormat", "createdBySource", "createdByWorkspaceMemberId", "createdByName", "createdByContext", "updatedBySource", "updatedByWorkspaceMemberId", "updatedByName", "updatedByContext") FROM stdin;
8a4fa6b3-2644-4c16-a70f-aee374858ee3	2026-04-25 11:34:18.919589+00	2026-04-25 11:34:46.892075+00	\N	0	Kir	Kir	System	en		lancasterproxima@ya.ru	7	5d82ed37-eb7b-47bd-b501-fd43dbc9dd40	system	SYSTEM	SYSTEM	SYSTEM	MANUAL	\N	System	\N	MANUAL	\N	System	\N
\.


--
-- Name: _typeorm_migrations_id_seq; Type: SEQUENCE SET; Schema: core; Owner: postgres
--

SELECT pg_catalog.setval('core._typeorm_migrations_id_seq', 182, true);


--
-- Name: file IDX_APPLICATION_PATH_WORKSPACE_ID_APPLICATION_ID_UNIQUE; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.file
    ADD CONSTRAINT "IDX_APPLICATION_PATH_WORKSPACE_ID_APPLICATION_ID_UNIQUE" UNIQUE ("workspaceId", "applicationId", path);


--
-- Name: applicationVariable IDX_APPLICATION_VARIABLE_KEY_APPLICATION_ID_UNIQUE; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."applicationVariable"
    ADD CONSTRAINT "IDX_APPLICATION_VARIABLE_KEY_APPLICATION_ID_UNIQUE" UNIQUE (key, "applicationId");


--
-- Name: approvedAccessDomain IDX_APPROVED_ACCESS_DOMAIN_DOMAIN_WORKSPACE_ID_UNIQUE; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."approvedAccessDomain"
    ADD CONSTRAINT "IDX_APPROVED_ACCESS_DOMAIN_DOMAIN_WORKSPACE_ID_UNIQUE" UNIQUE (domain, "workspaceId");


--
-- Name: applicationRegistrationVariable IDX_APP_REG_VAR_KEY_APP_REGISTRATION_ID_UNIQUE; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."applicationRegistrationVariable"
    ADD CONSTRAINT "IDX_APP_REG_VAR_KEY_APP_REGISTRATION_ID_UNIQUE" UNIQUE (key, "applicationRegistrationId");


--
-- Name: emailingDomain IDX_EMAILING_DOMAIN_DOMAIN_WORKSPACE_ID_UNIQUE; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."emailingDomain"
    ADD CONSTRAINT "IDX_EMAILING_DOMAIN_DOMAIN_WORKSPACE_ID_UNIQUE" UNIQUE (domain, "workspaceId");


--
-- Name: featureFlag IDX_FEATURE_FLAG_KEY_WORKSPACE_ID_UNIQUE; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."featureFlag"
    ADD CONSTRAINT "IDX_FEATURE_FLAG_KEY_WORKSPACE_ID_UNIQUE" UNIQUE (key, "workspaceId");


--
-- Name: fieldMetadata IDX_FIELD_METADATA_NAME_OBJECT_METADATA_ID_WORKSPACE_ID_UNIQUE; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."fieldMetadata"
    ADD CONSTRAINT "IDX_FIELD_METADATA_NAME_OBJECT_METADATA_ID_WORKSPACE_ID_UNIQUE" UNIQUE (name, "objectMetadataId", "workspaceId");


--
-- Name: fieldPermission IDX_FIELD_PERMISSION_FIELD_METADATA_ID_ROLE_ID_UNIQUE; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."fieldPermission"
    ADD CONSTRAINT "IDX_FIELD_PERMISSION_FIELD_METADATA_ID_ROLE_ID_UNIQUE" UNIQUE ("fieldMetadataId", "roleId");


--
-- Name: indexMetadata IDX_INDEX_METADATA_NAME_WORKSPACE_ID_OBJECT_METADATA_ID_UNIQUE; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."indexMetadata"
    ADD CONSTRAINT "IDX_INDEX_METADATA_NAME_WORKSPACE_ID_OBJECT_METADATA_ID_UNIQUE" UNIQUE (name, "workspaceId", "objectMetadataId");


--
-- Name: keyValuePair IDX_KEY_VALUE_PAIR_KEY_USER_ID_WORKSPACE_ID_UNIQUE; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."keyValuePair"
    ADD CONSTRAINT "IDX_KEY_VALUE_PAIR_KEY_USER_ID_WORKSPACE_ID_UNIQUE" UNIQUE (key, "userId", "workspaceId");


--
-- Name: objectMetadata IDX_OBJECT_METADATA_NAME_PLURAL_WORKSPACE_ID_UNIQUE; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."objectMetadata"
    ADD CONSTRAINT "IDX_OBJECT_METADATA_NAME_PLURAL_WORKSPACE_ID_UNIQUE" UNIQUE ("namePlural", "workspaceId");


--
-- Name: objectMetadata IDX_OBJECT_METADATA_NAME_SINGULAR_WORKSPACE_ID_UNIQUE; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."objectMetadata"
    ADD CONSTRAINT "IDX_OBJECT_METADATA_NAME_SINGULAR_WORKSPACE_ID_UNIQUE" UNIQUE ("nameSingular", "workspaceId");


--
-- Name: objectPermission IDX_OBJECT_PERMISSION_OBJECT_METADATA_ID_ROLE_ID_UNIQUE; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."objectPermission"
    ADD CONSTRAINT "IDX_OBJECT_PERMISSION_OBJECT_METADATA_ID_ROLE_ID_UNIQUE" UNIQUE ("objectMetadataId", "roleId");


--
-- Name: permissionFlag IDX_PERMISSION_FLAG_FLAG_ROLE_ID_UNIQUE; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."permissionFlag"
    ADD CONSTRAINT "IDX_PERMISSION_FLAG_FLAG_ROLE_ID_UNIQUE" UNIQUE (flag, "roleId");


--
-- Name: role IDX_ROLE_LABEL_WORKSPACE_ID_UNIQUE; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.role
    ADD CONSTRAINT "IDX_ROLE_LABEL_WORKSPACE_ID_UNIQUE" UNIQUE (label, "workspaceId");


--
-- Name: roleTarget IDX_ROLE_TARGET_UNIQUE_AGENT; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."roleTarget"
    ADD CONSTRAINT "IDX_ROLE_TARGET_UNIQUE_AGENT" UNIQUE ("workspaceId", "agentId");


--
-- Name: roleTarget IDX_ROLE_TARGET_UNIQUE_API_KEY; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."roleTarget"
    ADD CONSTRAINT "IDX_ROLE_TARGET_UNIQUE_API_KEY" UNIQUE ("workspaceId", "apiKeyId");


--
-- Name: roleTarget IDX_ROLE_TARGET_UNIQUE_USER_WORKSPACE; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."roleTarget"
    ADD CONSTRAINT "IDX_ROLE_TARGET_UNIQUE_USER_WORKSPACE" UNIQUE ("workspaceId", "userWorkspaceId");


--
-- Name: searchFieldMetadata IDX_SEARCH_FIELD_METADATA_OBJECT_FIELD_UNIQUE; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."searchFieldMetadata"
    ADD CONSTRAINT "IDX_SEARCH_FIELD_METADATA_OBJECT_FIELD_UNIQUE" UNIQUE ("objectMetadataId", "fieldMetadataId");


--
-- Name: viewFieldGroup PK_006f1cb78ab9eeef56c3e305009; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."viewFieldGroup"
    ADD CONSTRAINT "PK_006f1cb78ab9eeef56c3e305009" PRIMARY KEY (id);


--
-- Name: searchFieldMetadata PK_085190eb7531f4aeb8ccab3f42c; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."searchFieldMetadata"
    ADD CONSTRAINT "PK_085190eb7531f4aeb8ccab3f42c" PRIMARY KEY (id);


--
-- Name: viewFilter PK_09f9ffa2f66263b9eb301460137; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."viewFilter"
    ADD CONSTRAINT "PK_09f9ffa2f66263b9eb301460137" PRIMARY KEY (id);


--
-- Name: agentTurn PK_0e3f599ba7cf6a02fc940d9f18d; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."agentTurn"
    ADD CONSTRAINT "PK_0e3f599ba7cf6a02fc940d9f18d" PRIMARY KEY (id);


--
-- Name: roleTarget PK_0fe0b3be0a4a966e76c00f44df9; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."roleTarget"
    ADD CONSTRAINT "PK_0fe0b3be0a4a966e76c00f44df9" PRIMARY KEY (id);


--
-- Name: agent PK_1000e989398c5d4ed585cf9a46f; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.agent
    ADD CONSTRAINT "PK_1000e989398c5d4ed585cf9a46f" PRIMARY KEY (id);


--
-- Name: appToken PK_143bfe36c6284c6d3a52c94741f; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."appToken"
    ADD CONSTRAINT "PK_143bfe36c6284c6d3a52c94741f" PRIMARY KEY (id);


--
-- Name: viewFilterGroup PK_16f55359d609168b826405ed307; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."viewFilterGroup"
    ADD CONSTRAINT "PK_16f55359d609168b826405ed307" PRIMARY KEY (id);


--
-- Name: userWorkspace PK_222871f3641385e36e0b9f82aeb; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."userWorkspace"
    ADD CONSTRAINT "PK_222871f3641385e36e0b9f82aeb" PRIMARY KEY (id);


--
-- Name: objectPermission PK_23a4033c1aa380d0d1431731add; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."objectPermission"
    ADD CONSTRAINT "PK_23a4033c1aa380d0d1431731add" PRIMARY KEY (id);


--
-- Name: apiKey PK_2ae3a5e8e04fb402b2dc8d6ce4b; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."apiKey"
    ADD CONSTRAINT "PK_2ae3a5e8e04fb402b2dc8d6ce4b" PRIMARY KEY (id);


--
-- Name: pageLayoutWidget PK_2f997489b8b15cb26a0b9d4220b; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."pageLayoutWidget"
    ADD CONSTRAINT "PK_2f997489b8b15cb26a0b9d4220b" PRIMARY KEY (id);


--
-- Name: file PK_36b46d232307066b3a2c9ea3a1d; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.file
    ADD CONSTRAINT "PK_36b46d232307066b3a2c9ea3a1d" PRIMARY KEY (id);


--
-- Name: postgresCredentials PK_3f9c4cdf895bfea0a6ea15bdd81; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."postgresCredentials"
    ADD CONSTRAINT "PK_3f9c4cdf895bfea0a6ea15bdd81" PRIMARY KEY (id);


--
-- Name: messageChannel PK_438b9412475f39712ed065f77af; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."messageChannel"
    ADD CONSTRAINT "PK_438b9412475f39712ed065f77af" PRIMARY KEY (id);


--
-- Name: logicFunction PK_49bfacee064bee9d0d486483b60; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."logicFunction"
    ADD CONSTRAINT "PK_49bfacee064bee9d0d486483b60" PRIMARY KEY (id);


--
-- Name: pageLayout PK_5028ccb46ffa0c945d2f9246dfa; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."pageLayout"
    ADD CONSTRAINT "PK_5028ccb46ffa0c945d2f9246dfa" PRIMARY KEY (id);


--
-- Name: rowLevelPermissionPredicateGroup PK_5084d63eb632c38d70b974841f3; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."rowLevelPermissionPredicateGroup"
    ADD CONSTRAINT "PK_5084d63eb632c38d70b974841f3" PRIMARY KEY (id);


--
-- Name: approvedAccessDomain PK_523281ce57c84e1a039f4538c19; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."approvedAccessDomain"
    ADD CONSTRAINT "PK_523281ce57c84e1a039f4538c19" PRIMARY KEY (id);


--
-- Name: application PK_569e0c3e863ebdf5f2408ee1670; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.application
    ADD CONSTRAINT "PK_569e0c3e863ebdf5f2408ee1670" PRIMARY KEY (id);


--
-- Name: indexFieldMetadata PK_5928f67e43eff7d95aa79fd96fd; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."indexFieldMetadata"
    ADD CONSTRAINT "PK_5928f67e43eff7d95aa79fd96fd" PRIMARY KEY (id);


--
-- Name: applicationVariable PK_62f7823eb5f1e416c9d60614dfb; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."applicationVariable"
    ADD CONSTRAINT "PK_62f7823eb5f1e416c9d60614dfb" PRIMARY KEY (id);


--
-- Name: dataSource PK_6d01ae6c0f47baf4f8e37342268; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."dataSource"
    ADD CONSTRAINT "PK_6d01ae6c0f47baf4f8e37342268" PRIMARY KEY (id);


--
-- Name: calendarChannel PK_796d701c0c35518517d0f3e0e0b; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."calendarChannel"
    ADD CONSTRAINT "PK_796d701c0c35518517d0f3e0e0b" PRIMARY KEY (id);


--
-- Name: agentMessagePart PK_7e8c9f0b1a2b3c4d5e6f7a8b9c0; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."agentMessagePart"
    ADD CONSTRAINT "PK_7e8c9f0b1a2b3c4d5e6f7a8b9c0" PRIMARY KEY (id);


--
-- Name: objectMetadata PK_81fb7f4f4244211cfbd188af1e8; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."objectMetadata"
    ADD CONSTRAINT "PK_81fb7f4f4244211cfbd188af1e8" PRIMARY KEY (id);


--
-- Name: agentChatThread PK_82f67c93227868769e9553f059e; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."agentChatThread"
    ADD CONSTRAINT "PK_82f67c93227868769e9553f059e" PRIMARY KEY (id);


--
-- Name: frontComponent PK_843479d93ef40e58dc4587339aa; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."frontComponent"
    ADD CONSTRAINT "PK_843479d93ef40e58dc4587339aa" PRIMARY KEY (id);


--
-- Name: messageFolder PK_85cb5a339d9f7f1106dde9e4db8; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."messageFolder"
    ADD CONSTRAINT "PK_85cb5a339d9f7f1106dde9e4db8" PRIMARY KEY (id);


--
-- Name: view PK_86cfb9e426c77d60b900fe2b543; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.view
    ADD CONSTRAINT "PK_86cfb9e426c77d60b900fe2b543" PRIMARY KEY (id);


--
-- Name: featureFlag PK_894efa1b1822de801f3b9e04069; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."featureFlag"
    ADD CONSTRAINT "PK_894efa1b1822de801f3b9e04069" PRIMARY KEY (id);


--
-- Name: agentMessage PK_8c2e7b0c3c9e1b7a9e5e3f4d5c6; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."agentMessage"
    ADD CONSTRAINT "PK_8c2e7b0c3c9e1b7a9e5e3f4d5c6" PRIMARY KEY (id);


--
-- Name: connectedAccount PK_8e7a0a0bbc2e06ac2acf89b7f3a; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."connectedAccount"
    ADD CONSTRAINT "PK_8e7a0a0bbc2e06ac2acf89b7f3a" PRIMARY KEY (id);


--
-- Name: permissionFlag PK_a02789db60620a1e9f90147b50f; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."permissionFlag"
    ADD CONSTRAINT "PK_a02789db60620a1e9f90147b50f" PRIMARY KEY (id);


--
-- Name: logicFunctionLayer PK_a1077708d1b19463ab2eda7c246; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."logicFunctionLayer"
    ADD CONSTRAINT "PK_a1077708d1b19463ab2eda7c246" PRIMARY KEY (id);


--
-- Name: upgradeMigration PK_a43ea44de07f51fdc55b88af2ad; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."upgradeMigration"
    ADD CONSTRAINT "PK_a43ea44de07f51fdc55b88af2ad" PRIMARY KEY (id);


--
-- Name: workspaceSSOIdentityProvider PK_a4e3928eb641e7cd612042b628b; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."workspaceSSOIdentityProvider"
    ADD CONSTRAINT "PK_a4e3928eb641e7cd612042b628b" PRIMARY KEY (id);


--
-- Name: skill PK_a5167c44f4d4e61423f7f5e43bf; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.skill
    ADD CONSTRAINT "PK_a5167c44f4d4e61423f7f5e43bf" PRIMARY KEY (id);


--
-- Name: _typeorm_migrations PK_a6ff2a8e8bb563f3d15635efd01; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core._typeorm_migrations
    ADD CONSTRAINT "PK_a6ff2a8e8bb563f3d15635efd01" PRIMARY KEY (id);


--
-- Name: agentTurnEvaluation PK_agentTurnEvaluation; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."agentTurnEvaluation"
    ADD CONSTRAINT "PK_agentTurnEvaluation" PRIMARY KEY (id);


--
-- Name: applicationRegistration PK_application_registration; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."applicationRegistration"
    ADD CONSTRAINT "PK_application_registration" PRIMARY KEY (id);


--
-- Name: applicationRegistrationVariable PK_application_registration_variable; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."applicationRegistrationVariable"
    ADD CONSTRAINT "PK_application_registration_variable" PRIMARY KEY (id);


--
-- Name: role PK_b36bcfe02fc8de3c57a8b2391c2; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.role
    ADD CONSTRAINT "PK_b36bcfe02fc8de3c57a8b2391c2" PRIMARY KEY (id);


--
-- Name: viewField PK_ba2a5aa5f0bd7ac82788fae921e; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."viewField"
    ADD CONSTRAINT "PK_ba2a5aa5f0bd7ac82788fae921e" PRIMARY KEY (id);


--
-- Name: twoFactorAuthenticationMethod PK_c455f6a499e7110fc95e4bea540; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."twoFactorAuthenticationMethod"
    ADD CONSTRAINT "PK_c455f6a499e7110fc95e4bea540" PRIMARY KEY (id);


--
-- Name: keyValuePair PK_c5a1ca828435d3eaf8f9361ed4b; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."keyValuePair"
    ADD CONSTRAINT "PK_c5a1ca828435d3eaf8f9361ed4b" PRIMARY KEY (id);


--
-- Name: workspace PK_ca86b6f9b3be5fe26d307d09b49; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.workspace
    ADD CONSTRAINT "PK_ca86b6f9b3be5fe26d307d09b49" PRIMARY KEY (id);


--
-- Name: user PK_cace4a159ff9f2512dd42373760; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."user"
    ADD CONSTRAINT "PK_cace4a159ff9f2512dd42373760" PRIMARY KEY (id);


--
-- Name: fieldMetadata PK_d046b1c7cea325ebc4cdc25e7a9; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."fieldMetadata"
    ADD CONSTRAINT "PK_d046b1c7cea325ebc4cdc25e7a9" PRIMARY KEY (id);


--
-- Name: viewGroup PK_d2aa8cad01e9d5e99c23f9ccec3; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."viewGroup"
    ADD CONSTRAINT "PK_d2aa8cad01e9d5e99c23f9ccec3" PRIMARY KEY (id);


--
-- Name: fieldPermission PK_d7bb911e4f9b1b5e3bfcfdd1c4b; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."fieldPermission"
    ADD CONSTRAINT "PK_d7bb911e4f9b1b5e3bfcfdd1c4b" PRIMARY KEY (id);


--
-- Name: navigationMenuItem PK_d8689756f55769faea7dc0ae968; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."navigationMenuItem"
    ADD CONSTRAINT "PK_d8689756f55769faea7dc0ae968" PRIMARY KEY (id);


--
-- Name: emailingDomain PK_dca7032537b5d307f8cc6d74f1d; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."emailingDomain"
    ADD CONSTRAINT "PK_dca7032537b5d307f8cc6d74f1d" PRIMARY KEY (id);


--
-- Name: webhook PK_e6765510c2d078db49632b59020; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.webhook
    ADD CONSTRAINT "PK_e6765510c2d078db49632b59020" PRIMARY KEY (id);


--
-- Name: rowLevelPermissionPredicate PK_e7ac2b75856fc7f300b5feb0e39; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."rowLevelPermissionPredicate"
    ADD CONSTRAINT "PK_e7ac2b75856fc7f300b5feb0e39" PRIMARY KEY (id);


--
-- Name: viewSort PK_eceb74d297f926313af6463d496; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."viewSort"
    ADD CONSTRAINT "PK_eceb74d297f926313af6463d496" PRIMARY KEY (id);


--
-- Name: pageLayoutTab PK_f1327f6ea950cdc59fe17569c5c; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."pageLayoutTab"
    ADD CONSTRAINT "PK_f1327f6ea950cdc59fe17569c5c" PRIMARY KEY (id);


--
-- Name: indexMetadata PK_f73bb3c3678aee204e341f0ca4e; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."indexMetadata"
    ADD CONSTRAINT "PK_f73bb3c3678aee204e341f0ca4e" PRIMARY KEY (id);


--
-- Name: commandMenuItem PK_fd076dc869e721593133fe8a007; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."commandMenuItem"
    ADD CONSTRAINT "PK_fd076dc869e721593133fe8a007" PRIMARY KEY (id);


--
-- Name: publicDomain PK_ff55a0f1bc3b6e2c32feff734b1; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."publicDomain"
    ADD CONSTRAINT "PK_ff55a0f1bc3b6e2c32feff734b1" PRIMARY KEY (id);


--
-- Name: applicationRegistration REL_36715821de396df9536fd4afc8; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."applicationRegistration"
    ADD CONSTRAINT "REL_36715821de396df9536fd4afc8" UNIQUE ("tarballFileId");


--
-- Name: fieldMetadata REL_47a6c57e1652b6475f8248cff7; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."fieldMetadata"
    ADD CONSTRAINT "REL_47a6c57e1652b6475f8248cff7" UNIQUE ("relationTargetFieldMetadataId");


--
-- Name: publicDomain UQ_1311e24fbd049c561c53a274f2a; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."publicDomain"
    ADD CONSTRAINT "UQ_1311e24fbd049c561c53a274f2a" UNIQUE (domain);


--
-- Name: workspace UQ_282123b2f32e927b6003311e33a; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.workspace
    ADD CONSTRAINT "UQ_282123b2f32e927b6003311e33a" UNIQUE ("logoFileId");


--
-- Name: application UQ_28f20711184b3c3318a8e44d117; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.application
    ADD CONSTRAINT "UQ_28f20711184b3c3318a8e44d117" UNIQUE ("yarnLockFileId");


--
-- Name: application UQ_3818380258798f9ffa9963b6dc4; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.application
    ADD CONSTRAINT "UQ_3818380258798f9ffa9963b6dc4" UNIQUE ("packageJsonFileId");


--
-- Name: workspace UQ_900f0a3eb789159c26c8bcb39cd; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.workspace
    ADD CONSTRAINT "UQ_900f0a3eb789159c26c8bcb39cd" UNIQUE ("customDomain");


--
-- Name: workspace UQ_cba6255a24deb1fff07dd7351b8; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.workspace
    ADD CONSTRAINT "UQ_cba6255a24deb1fff07dd7351b8" UNIQUE (subdomain);


--
-- Name: _habitLog _habitLog_pkey; Type: CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c."_habitLog"
    ADD CONSTRAINT "_habitLog_pkey" PRIMARY KEY (id);


--
-- Name: _habit _habit_pkey; Type: CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c._habit
    ADD CONSTRAINT _habit_pkey PRIMARY KEY (id);


--
-- Name: attachment attachment_pkey; Type: CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c.attachment
    ADD CONSTRAINT attachment_pkey PRIMARY KEY (id);


--
-- Name: blocklist blocklist_pkey; Type: CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c.blocklist
    ADD CONSTRAINT blocklist_pkey PRIMARY KEY (id);


--
-- Name: calendarChannelEventAssociation calendarChannelEventAssociation_pkey; Type: CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c."calendarChannelEventAssociation"
    ADD CONSTRAINT "calendarChannelEventAssociation_pkey" PRIMARY KEY (id);


--
-- Name: calendarChannel calendarChannel_pkey; Type: CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c."calendarChannel"
    ADD CONSTRAINT "calendarChannel_pkey" PRIMARY KEY (id);


--
-- Name: calendarEventParticipant calendarEventParticipant_pkey; Type: CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c."calendarEventParticipant"
    ADD CONSTRAINT "calendarEventParticipant_pkey" PRIMARY KEY (id);


--
-- Name: calendarEvent calendarEvent_pkey; Type: CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c."calendarEvent"
    ADD CONSTRAINT "calendarEvent_pkey" PRIMARY KEY (id);


--
-- Name: company company_pkey; Type: CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c.company
    ADD CONSTRAINT company_pkey PRIMARY KEY (id);


--
-- Name: connectedAccount connectedAccount_pkey; Type: CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c."connectedAccount"
    ADD CONSTRAINT "connectedAccount_pkey" PRIMARY KEY (id);


--
-- Name: dashboard dashboard_pkey; Type: CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c.dashboard
    ADD CONSTRAINT dashboard_pkey PRIMARY KEY (id);


--
-- Name: messageChannelMessageAssociationMessageFolder messageChannelMessageAssociationMessageFolder_pkey; Type: CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannelMessageAssociationMessageFolder"
    ADD CONSTRAINT "messageChannelMessageAssociationMessageFolder_pkey" PRIMARY KEY (id);


--
-- Name: messageChannelMessageAssociation messageChannelMessageAssociation_pkey; Type: CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannelMessageAssociation"
    ADD CONSTRAINT "messageChannelMessageAssociation_pkey" PRIMARY KEY (id);


--
-- Name: messageChannel messageChannel_pkey; Type: CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannel"
    ADD CONSTRAINT "messageChannel_pkey" PRIMARY KEY (id);


--
-- Name: messageFolder messageFolder_pkey; Type: CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c."messageFolder"
    ADD CONSTRAINT "messageFolder_pkey" PRIMARY KEY (id);


--
-- Name: messageParticipant messageParticipant_pkey; Type: CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c."messageParticipant"
    ADD CONSTRAINT "messageParticipant_pkey" PRIMARY KEY (id);


--
-- Name: messageThread messageThread_pkey; Type: CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c."messageThread"
    ADD CONSTRAINT "messageThread_pkey" PRIMARY KEY (id);


--
-- Name: message message_pkey; Type: CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c.message
    ADD CONSTRAINT message_pkey PRIMARY KEY (id);


--
-- Name: noteTarget noteTarget_pkey; Type: CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c."noteTarget"
    ADD CONSTRAINT "noteTarget_pkey" PRIMARY KEY (id);


--
-- Name: note note_pkey; Type: CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c.note
    ADD CONSTRAINT note_pkey PRIMARY KEY (id);


--
-- Name: opportunity opportunity_pkey; Type: CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c.opportunity
    ADD CONSTRAINT opportunity_pkey PRIMARY KEY (id);


--
-- Name: person person_pkey; Type: CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- Name: taskTarget taskTarget_pkey; Type: CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c."taskTarget"
    ADD CONSTRAINT "taskTarget_pkey" PRIMARY KEY (id);


--
-- Name: task task_pkey; Type: CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c.task
    ADD CONSTRAINT task_pkey PRIMARY KEY (id);


--
-- Name: timelineActivity timelineActivity_pkey; Type: CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c."timelineActivity"
    ADD CONSTRAINT "timelineActivity_pkey" PRIMARY KEY (id);


--
-- Name: workflowAutomatedTrigger workflowAutomatedTrigger_pkey; Type: CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c."workflowAutomatedTrigger"
    ADD CONSTRAINT "workflowAutomatedTrigger_pkey" PRIMARY KEY (id);


--
-- Name: workflowRun workflowRun_pkey; Type: CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c."workflowRun"
    ADD CONSTRAINT "workflowRun_pkey" PRIMARY KEY (id);


--
-- Name: workflowVersion workflowVersion_pkey; Type: CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c."workflowVersion"
    ADD CONSTRAINT "workflowVersion_pkey" PRIMARY KEY (id);


--
-- Name: workflow workflow_pkey; Type: CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c.workflow
    ADD CONSTRAINT workflow_pkey PRIMARY KEY (id);


--
-- Name: workspaceMember workspaceMember_pkey; Type: CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c."workspaceMember"
    ADD CONSTRAINT "workspaceMember_pkey" PRIMARY KEY (id);


--
-- Name: IDX_0082568653b80c15903c5a2ba9; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_0082568653b80c15903c5a2ba9" ON core."roleTarget" USING btree ("workspaceId", "universalIdentifier");


--
-- Name: IDX_0cc4d03dbcc269e77ba4d297fb; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_0cc4d03dbcc269e77ba4d297fb" ON core.agent USING btree ("workspaceId", "universalIdentifier");


--
-- Name: IDX_0dedb90c717e179ef653c512b9; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_0dedb90c717e179ef653c512b9" ON core."fieldPermission" USING btree ("workspaceId", "universalIdentifier");


--
-- Name: IDX_256fabec226411154baba649df; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_256fabec226411154baba649df" ON core."pageLayout" USING btree ("workspaceId", "universalIdentifier");


--
-- Name: IDX_2909f5139c479e4632df03fd5e; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_2909f5139c479e4632df03fd5e" ON core."twoFactorAuthenticationMethod" USING btree ("userWorkspaceId", strategy);


--
-- Name: IDX_2a33a0e7e44c393ca7bb578dae; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_2a33a0e7e44c393ca7bb578dae" ON core."pageLayoutWidget" USING btree ("workspaceId", "universalIdentifier");


--
-- Name: IDX_2aff9daad5cc3b5e15ca717334; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_2aff9daad5cc3b5e15ca717334" ON core."agentMessagePart" USING btree ("messageId");


--
-- Name: IDX_2f0fd3da807fb993701619d0ac; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_2f0fd3da807fb993701619d0ac" ON core."logicFunction" USING btree ("workspaceId", "universalIdentifier");


--
-- Name: IDX_3763c4e8f942ff1e24040a13a9; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_3763c4e8f942ff1e24040a13a9" ON core."pageLayoutTab" USING btree ("workspaceId", "universalIdentifier");


--
-- Name: IDX_38232fc0c6567ed029c2b1a12c; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_38232fc0c6567ed029c2b1a12c" ON core."viewSort" USING btree ("workspaceId", "universalIdentifier");


--
-- Name: IDX_3a00d35710f4227ded320fd96d; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_3a00d35710f4227ded320fd96d" ON core."objectMetadata" USING btree ("workspaceId", "universalIdentifier");


--
-- Name: IDX_3b7ff27925c0959777682c1adc; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_3b7ff27925c0959777682c1adc" ON core.role USING btree ("workspaceId", "universalIdentifier");


--
-- Name: IDX_3bd935d6f8c5ce87194b8db824; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_3bd935d6f8c5ce87194b8db824" ON core."agentChatThread" USING btree ("userWorkspaceId");


--
-- Name: IDX_3be906dca9d5b50fbfe40e33f0; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_3be906dca9d5b50fbfe40e33f0" ON core."agentTurn" USING btree ("threadId");


--
-- Name: IDX_3d097ed53841d80904ed02c837; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_3d097ed53841d80904ed02c837" ON core."agentChatThread" USING btree ("workspaceId");


--
-- Name: IDX_48c75cb32ff0d2887ef0dc547f; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_48c75cb32ff0d2887ef0dc547f" ON core."agentMessage" USING btree ("agentId");


--
-- Name: IDX_4c31daa882e3130534995bf90c; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_4c31daa882e3130534995bf90c" ON core."agentMessage" USING btree ("threadId");


--
-- Name: IDX_4d8beaebdfcd5d82ebe6e8b58f; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_4d8beaebdfcd5d82ebe6e8b58f" ON core."navigationMenuItem" USING btree ("workspaceId", "universalIdentifier");


--
-- Name: IDX_552aa6908966e980099b3e5ebf; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_552aa6908966e980099b3e5ebf" ON core.view USING btree ("workspaceId", "universalIdentifier");


--
-- Name: IDX_70b398dc45219db8f3e36b3a07; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_70b398dc45219db8f3e36b3a07" ON core."agentMessagePart" USING btree ("workspaceId");


--
-- Name: IDX_75db4f2e80922078e8171ae130; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_75db4f2e80922078e8171ae130" ON core."agentMessage" USING btree ("workspaceId");


--
-- Name: IDX_78ae6cfe5f49a76c4bf842ad58; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_78ae6cfe5f49a76c4bf842ad58" ON core."applicationVariable" USING btree ("workspaceId");


--
-- Name: IDX_87dbab10ac94d9a091f8efaa67; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_87dbab10ac94d9a091f8efaa67" ON core."agentMessage" USING btree ("turnId");


--
-- Name: IDX_AGENT_ID_DELETED_AT; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_AGENT_ID_DELETED_AT" ON core.agent USING btree (id, "deletedAt");


--
-- Name: IDX_AGENT_NAME_WORKSPACE_ID_UNIQUE; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_AGENT_NAME_WORKSPACE_ID_UNIQUE" ON core.agent USING btree (name, "workspaceId") WHERE ("deletedAt" IS NULL);


--
-- Name: IDX_API_KEY_WORKSPACE_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_API_KEY_WORKSPACE_ID" ON core."apiKey" USING btree ("workspaceId");


--
-- Name: IDX_APPLICATION_REGISTRATION_CREATED_BY_USER_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_APPLICATION_REGISTRATION_CREATED_BY_USER_ID" ON core."applicationRegistration" USING btree ("createdByUserId");


--
-- Name: IDX_APPLICATION_REGISTRATION_OAUTH_CLIENT_ID_UNIQUE; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_APPLICATION_REGISTRATION_OAUTH_CLIENT_ID_UNIQUE" ON core."applicationRegistration" USING btree ("oAuthClientId") WHERE ("deletedAt" IS NULL);


--
-- Name: IDX_APPLICATION_REGISTRATION_UNIVERSAL_IDENTIFIER_UNIQUE; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_APPLICATION_REGISTRATION_UNIVERSAL_IDENTIFIER_UNIQUE" ON core."applicationRegistration" USING btree ("universalIdentifier") WHERE ("deletedAt" IS NULL);


--
-- Name: IDX_APPLICATION_REGISTRATION_WORKSPACE_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_APPLICATION_REGISTRATION_WORKSPACE_ID" ON core."applicationRegistration" USING btree ("workspaceId");


--
-- Name: IDX_APPLICATION_UNIVERSAL_IDENTIFIER_WORKSPACE_ID_UNIQUE; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_APPLICATION_UNIVERSAL_IDENTIFIER_WORKSPACE_ID_UNIQUE" ON core.application USING btree ("universalIdentifier", "workspaceId") WHERE (("deletedAt" IS NULL) AND ("universalIdentifier" IS NOT NULL));


--
-- Name: IDX_APPLICATION_WORKSPACE_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_APPLICATION_WORKSPACE_ID" ON core.application USING btree ("workspaceId");


--
-- Name: IDX_APP_REG_VAR_APP_REGISTRATION_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_APP_REG_VAR_APP_REGISTRATION_ID" ON core."applicationRegistrationVariable" USING btree ("applicationRegistrationId");


--
-- Name: IDX_COMMAND_MENU_ITEM_AVAILABILITY_OBJECT_METADATA_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_COMMAND_MENU_ITEM_AVAILABILITY_OBJECT_METADATA_ID" ON core."commandMenuItem" USING btree ("availabilityObjectMetadataId");


--
-- Name: IDX_COMMAND_MENU_ITEM_FRONT_COMPONENT_ID_WORKSPACE_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_COMMAND_MENU_ITEM_FRONT_COMPONENT_ID_WORKSPACE_ID" ON core."commandMenuItem" USING btree ("frontComponentId", "workspaceId");


--
-- Name: IDX_COMMAND_MENU_ITEM_PAGE_LAYOUT_ID_WORKSPACE_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_COMMAND_MENU_ITEM_PAGE_LAYOUT_ID_WORKSPACE_ID" ON core."commandMenuItem" USING btree ("pageLayoutId", "workspaceId");


--
-- Name: IDX_COMMAND_MENU_ITEM_WORKFLOW_VERSION_ID_WORKSPACE_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_COMMAND_MENU_ITEM_WORKFLOW_VERSION_ID_WORKSPACE_ID" ON core."commandMenuItem" USING btree ("workflowVersionId", "workspaceId");


--
-- Name: IDX_DATA_SOURCE_WORKSPACE_ID_CREATED_AT; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_DATA_SOURCE_WORKSPACE_ID_CREATED_AT" ON core."dataSource" USING btree ("workspaceId", "createdAt");


--
-- Name: IDX_FIELD_METADATA_OBJECT_METADATA_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_FIELD_METADATA_OBJECT_METADATA_ID" ON core."fieldMetadata" USING btree ("objectMetadataId");


--
-- Name: IDX_FIELD_METADATA_OBJECT_METADATA_ID_WORKSPACE_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_FIELD_METADATA_OBJECT_METADATA_ID_WORKSPACE_ID" ON core."fieldMetadata" USING btree ("objectMetadataId", "workspaceId");


--
-- Name: IDX_FIELD_METADATA_RELATION_TARGET_FIELD_METADATA_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_FIELD_METADATA_RELATION_TARGET_FIELD_METADATA_ID" ON core."fieldMetadata" USING btree ("relationTargetFieldMetadataId");


--
-- Name: IDX_FIELD_METADATA_RELATION_TARGET_OBJECT_METADATA_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_FIELD_METADATA_RELATION_TARGET_OBJECT_METADATA_ID" ON core."fieldMetadata" USING btree ("relationTargetObjectMetadataId");


--
-- Name: IDX_FIELD_METADATA_WORKSPACE_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_FIELD_METADATA_WORKSPACE_ID" ON core."fieldMetadata" USING btree ("workspaceId");


--
-- Name: IDX_FIELD_PERMISSION_WORKSPACE_ID_ROLE_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_FIELD_PERMISSION_WORKSPACE_ID_ROLE_ID" ON core."fieldPermission" USING btree ("workspaceId", "roleId");


--
-- Name: IDX_FILE_WORKSPACE_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_FILE_WORKSPACE_ID" ON core.file USING btree ("workspaceId");


--
-- Name: IDX_INDEX_FIELD_METADATA_FIELD_METADATA_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_INDEX_FIELD_METADATA_FIELD_METADATA_ID" ON core."indexFieldMetadata" USING btree ("fieldMetadataId");


--
-- Name: IDX_INDEX_METADATA_WORKSPACE_ID_OBJECT_METADATA_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_INDEX_METADATA_WORKSPACE_ID_OBJECT_METADATA_ID" ON core."indexMetadata" USING btree ("workspaceId", "objectMetadataId");


--
-- Name: IDX_KEY_VALUE_PAIR_KEY_NULL_USER_ID_NULL_WORKSPACE_ID_UNIQUE; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_KEY_VALUE_PAIR_KEY_NULL_USER_ID_NULL_WORKSPACE_ID_UNIQUE" ON core."keyValuePair" USING btree (key) WHERE (("userId" IS NULL) AND ("workspaceId" IS NULL));


--
-- Name: IDX_KEY_VALUE_PAIR_KEY_USER_ID_NULL_WORKSPACE_ID_UNIQUE; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_KEY_VALUE_PAIR_KEY_USER_ID_NULL_WORKSPACE_ID_UNIQUE" ON core."keyValuePair" USING btree (key, "userId") WHERE ("workspaceId" IS NULL);


--
-- Name: IDX_KEY_VALUE_PAIR_KEY_WORKSPACE_ID_NULL_USER_ID_UNIQUE; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_KEY_VALUE_PAIR_KEY_WORKSPACE_ID_NULL_USER_ID_UNIQUE" ON core."keyValuePair" USING btree (key, "workspaceId") WHERE ("userId" IS NULL);


--
-- Name: IDX_LOGIC_FUNCTION_ID_DELETED_AT; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_LOGIC_FUNCTION_ID_DELETED_AT" ON core."logicFunction" USING btree (id, "deletedAt");


--
-- Name: IDX_NAVIGATION_MENU_ITEM_FOLDER_ID_WORKSPACE_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_NAVIGATION_MENU_ITEM_FOLDER_ID_WORKSPACE_ID" ON core."navigationMenuItem" USING btree ("folderId", "workspaceId");


--
-- Name: IDX_NAVIGATION_MENU_ITEM_PAGE_LAYOUT_ID_WORKSPACE_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_NAVIGATION_MENU_ITEM_PAGE_LAYOUT_ID_WORKSPACE_ID" ON core."navigationMenuItem" USING btree ("pageLayoutId", "workspaceId");


--
-- Name: IDX_NAVIGATION_MENU_ITEM_TARGET_RECORD_OBJ_METADATA_WS_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_NAVIGATION_MENU_ITEM_TARGET_RECORD_OBJ_METADATA_WS_ID" ON core."navigationMenuItem" USING btree ("targetRecordId", "targetObjectMetadataId", "workspaceId");


--
-- Name: IDX_NAVIGATION_MENU_ITEM_USER_WORKSPACE_ID_WORKSPACE_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_NAVIGATION_MENU_ITEM_USER_WORKSPACE_ID_WORKSPACE_ID" ON core."navigationMenuItem" USING btree ("userWorkspaceId", "workspaceId");


--
-- Name: IDX_NAVIGATION_MENU_ITEM_VIEW_ID_WORKSPACE_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_NAVIGATION_MENU_ITEM_VIEW_ID_WORKSPACE_ID" ON core."navigationMenuItem" USING btree ("viewId", "workspaceId");


--
-- Name: IDX_OBJECT_PERMISSION_WORKSPACE_ID_ROLE_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_OBJECT_PERMISSION_WORKSPACE_ID_ROLE_ID" ON core."objectPermission" USING btree ("workspaceId", "roleId");


--
-- Name: IDX_PAGE_LAYOUT_TAB_WORKSPACE_ID_PAGE_LAYOUT_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_PAGE_LAYOUT_TAB_WORKSPACE_ID_PAGE_LAYOUT_ID" ON core."pageLayoutTab" USING btree ("workspaceId", "pageLayoutId") WHERE ("deletedAt" IS NULL);


--
-- Name: IDX_PAGE_LAYOUT_WIDGET_OBJECT_METADATA_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_PAGE_LAYOUT_WIDGET_OBJECT_METADATA_ID" ON core."pageLayoutWidget" USING btree ("objectMetadataId");


--
-- Name: IDX_PAGE_LAYOUT_WIDGET_WORKSPACE_ID_PAGE_LAYOUT_TAB_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_PAGE_LAYOUT_WIDGET_WORKSPACE_ID_PAGE_LAYOUT_TAB_ID" ON core."pageLayoutWidget" USING btree ("workspaceId", "pageLayoutTabId") WHERE ("deletedAt" IS NULL);


--
-- Name: IDX_PAGE_LAYOUT_WORKSPACE_ID_OBJECT_METADATA_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_PAGE_LAYOUT_WORKSPACE_ID_OBJECT_METADATA_ID" ON core."pageLayout" USING btree ("workspaceId", "objectMetadataId") WHERE ("deletedAt" IS NULL);


--
-- Name: IDX_PERMISSION_FLAG_ROLE_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_PERMISSION_FLAG_ROLE_ID" ON core."permissionFlag" USING btree ("roleId");


--
-- Name: IDX_RLPPG_PARENT_GROUP_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_RLPPG_PARENT_GROUP_ID" ON core."rowLevelPermissionPredicateGroup" USING btree ("parentRowLevelPermissionPredicateGroupId");


--
-- Name: IDX_RLPPG_WORKSPACE_ID_ROLE_ID_OBJECT_METADATA_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_RLPPG_WORKSPACE_ID_ROLE_ID_OBJECT_METADATA_ID" ON core."rowLevelPermissionPredicateGroup" USING btree ("workspaceId", "roleId", "objectMetadataId");


--
-- Name: IDX_RLPP_FIELD_METADATA_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_RLPP_FIELD_METADATA_ID" ON core."rowLevelPermissionPredicate" USING btree ("fieldMetadataId");


--
-- Name: IDX_RLPP_GROUP_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_RLPP_GROUP_ID" ON core."rowLevelPermissionPredicate" USING btree ("rowLevelPermissionPredicateGroupId");


--
-- Name: IDX_RLPP_WORKSPACE_ID_ROLE_ID_OBJECT_METADATA_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_RLPP_WORKSPACE_ID_ROLE_ID_OBJECT_METADATA_ID" ON core."rowLevelPermissionPredicate" USING btree ("workspaceId", "roleId", "objectMetadataId");


--
-- Name: IDX_RLPP_WORKSPACE_MEMBER_FIELD_METADATA_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_RLPP_WORKSPACE_MEMBER_FIELD_METADATA_ID" ON core."rowLevelPermissionPredicate" USING btree ("workspaceMemberFieldMetadataId");


--
-- Name: IDX_ROLE_TARGET_AGENT_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_ROLE_TARGET_AGENT_ID" ON core."roleTarget" USING btree ("agentId");


--
-- Name: IDX_ROLE_TARGET_API_KEY_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_ROLE_TARGET_API_KEY_ID" ON core."roleTarget" USING btree ("apiKeyId");


--
-- Name: IDX_ROLE_TARGET_ROLE_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_ROLE_TARGET_ROLE_ID" ON core."roleTarget" USING btree ("roleId");


--
-- Name: IDX_ROLE_TARGET_WORKSPACE_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_ROLE_TARGET_WORKSPACE_ID" ON core."roleTarget" USING btree ("userWorkspaceId", "workspaceId");


--
-- Name: IDX_SEARCH_FIELD_METADATA_OBJECT_METADATA_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_SEARCH_FIELD_METADATA_OBJECT_METADATA_ID" ON core."searchFieldMetadata" USING btree ("objectMetadataId");


--
-- Name: IDX_SEARCH_FIELD_METADATA_WORKSPACE_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_SEARCH_FIELD_METADATA_WORKSPACE_ID" ON core."searchFieldMetadata" USING btree ("workspaceId");


--
-- Name: IDX_SKILL_ID_IS_ACTIVE; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_SKILL_ID_IS_ACTIVE" ON core.skill USING btree (id, "isActive");


--
-- Name: IDX_SKILL_NAME_WORKSPACE_ID_UNIQUE; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_SKILL_NAME_WORKSPACE_ID_UNIQUE" ON core.skill USING btree (name, "workspaceId") WHERE ("isActive" = true);


--
-- Name: IDX_USER_WORKSPACE_USER_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_USER_WORKSPACE_USER_ID" ON core."userWorkspace" USING btree ("userId");


--
-- Name: IDX_USER_WORKSPACE_USER_ID_WORKSPACE_ID_UNIQUE; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_USER_WORKSPACE_USER_ID_WORKSPACE_ID_UNIQUE" ON core."userWorkspace" USING btree ("userId", "workspaceId") WHERE ("deletedAt" IS NULL);


--
-- Name: IDX_USER_WORKSPACE_WORKSPACE_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_USER_WORKSPACE_WORKSPACE_ID" ON core."userWorkspace" USING btree ("workspaceId");


--
-- Name: IDX_VIEW_CALENDAR_FIELD_METADATA; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_VIEW_CALENDAR_FIELD_METADATA" ON core.view USING btree ("calendarFieldMetadataId");


--
-- Name: IDX_VIEW_CREATED_BY_USER_WORKSPACE; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_VIEW_CREATED_BY_USER_WORKSPACE" ON core.view USING btree ("createdByUserWorkspaceId");


--
-- Name: IDX_VIEW_FIELD_FIELD_METADATA_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_VIEW_FIELD_FIELD_METADATA_ID" ON core."viewField" USING btree ("fieldMetadataId");


--
-- Name: IDX_VIEW_FIELD_FIELD_METADATA_ID_VIEW_ID_UNIQUE; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_VIEW_FIELD_FIELD_METADATA_ID_VIEW_ID_UNIQUE" ON core."viewField" USING btree ("fieldMetadataId", "viewId") WHERE ("deletedAt" IS NULL);


--
-- Name: IDX_VIEW_FIELD_GROUP_VIEW_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_VIEW_FIELD_GROUP_VIEW_ID" ON core."viewFieldGroup" USING btree ("viewId");


--
-- Name: IDX_VIEW_FIELD_GROUP_WORKSPACE_ID_VIEW_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_VIEW_FIELD_GROUP_WORKSPACE_ID_VIEW_ID" ON core."viewFieldGroup" USING btree ("workspaceId", "viewId");


--
-- Name: IDX_VIEW_FIELD_VIEW_FIELD_GROUP_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_VIEW_FIELD_VIEW_FIELD_GROUP_ID" ON core."viewField" USING btree ("viewFieldGroupId");


--
-- Name: IDX_VIEW_FIELD_VIEW_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_VIEW_FIELD_VIEW_ID" ON core."viewField" USING btree ("viewId");


--
-- Name: IDX_VIEW_FIELD_WORKSPACE_ID_VIEW_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_VIEW_FIELD_WORKSPACE_ID_VIEW_ID" ON core."viewField" USING btree ("workspaceId", "viewId");


--
-- Name: IDX_VIEW_FILTER_FIELD_METADATA_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_VIEW_FILTER_FIELD_METADATA_ID" ON core."viewFilter" USING btree ("fieldMetadataId");


--
-- Name: IDX_VIEW_FILTER_GROUP_PARENT_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_VIEW_FILTER_GROUP_PARENT_ID" ON core."viewFilterGroup" USING btree ("parentViewFilterGroupId");


--
-- Name: IDX_VIEW_FILTER_GROUP_VIEW_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_VIEW_FILTER_GROUP_VIEW_ID" ON core."viewFilterGroup" USING btree ("viewId");


--
-- Name: IDX_VIEW_FILTER_GROUP_WORKSPACE_ID_VIEW_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_VIEW_FILTER_GROUP_WORKSPACE_ID_VIEW_ID" ON core."viewFilterGroup" USING btree ("workspaceId", "viewId");


--
-- Name: IDX_VIEW_FILTER_VIEW_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_VIEW_FILTER_VIEW_ID" ON core."viewFilter" USING btree ("viewId");


--
-- Name: IDX_VIEW_FILTER_WORKSPACE_ID_VIEW_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_VIEW_FILTER_WORKSPACE_ID_VIEW_ID" ON core."viewFilter" USING btree ("workspaceId", "viewId");


--
-- Name: IDX_VIEW_GROUP_VIEW_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_VIEW_GROUP_VIEW_ID" ON core."viewGroup" USING btree ("viewId");


--
-- Name: IDX_VIEW_GROUP_WORKSPACE_ID_VIEW_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_VIEW_GROUP_WORKSPACE_ID_VIEW_ID" ON core."viewGroup" USING btree ("workspaceId", "viewId");


--
-- Name: IDX_VIEW_KANBAN_FIELD_METADATA; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_VIEW_KANBAN_FIELD_METADATA" ON core.view USING btree ("kanbanAggregateOperationFieldMetadataId");


--
-- Name: IDX_VIEW_MAIN_GROUP_BY_FIELD_METADATA; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_VIEW_MAIN_GROUP_BY_FIELD_METADATA" ON core.view USING btree ("mainGroupByFieldMetadataId");


--
-- Name: IDX_VIEW_SORT_FIELD_METADATA_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_VIEW_SORT_FIELD_METADATA_ID" ON core."viewSort" USING btree ("fieldMetadataId");


--
-- Name: IDX_VIEW_SORT_FIELD_METADATA_ID_VIEW_ID_UNIQUE; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_VIEW_SORT_FIELD_METADATA_ID_VIEW_ID_UNIQUE" ON core."viewSort" USING btree ("fieldMetadataId", "viewId") WHERE ("deletedAt" IS NULL);


--
-- Name: IDX_VIEW_SORT_VIEW_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_VIEW_SORT_VIEW_ID" ON core."viewSort" USING btree ("viewId");


--
-- Name: IDX_VIEW_SORT_WORKSPACE_ID_VIEW_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_VIEW_SORT_WORKSPACE_ID_VIEW_ID" ON core."viewSort" USING btree ("workspaceId", "viewId");


--
-- Name: IDX_VIEW_VISIBILITY; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_VIEW_VISIBILITY" ON core.view USING btree (visibility);


--
-- Name: IDX_VIEW_WORKSPACE_ID_OBJECT_METADATA_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_VIEW_WORKSPACE_ID_OBJECT_METADATA_ID" ON core.view USING btree ("workspaceId", "objectMetadataId");


--
-- Name: IDX_WEBHOOK_WORKSPACE_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_WEBHOOK_WORKSPACE_ID" ON core.webhook USING btree ("workspaceId");


--
-- Name: IDX_WORKSPACE_ACTIVATION_STATUS; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_WORKSPACE_ACTIVATION_STATUS" ON core.workspace USING btree ("activationStatus");


--
-- Name: IDX_a1413f7f0e71cb5825ac40c4fa; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_a1413f7f0e71cb5825ac40c4fa" ON core."frontComponent" USING btree ("workspaceId", "universalIdentifier");


--
-- Name: IDX_a14b5665091e86d461fb585924; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_a14b5665091e86d461fb585924" ON core."rowLevelPermissionPredicateGroup" USING btree ("workspaceId", "universalIdentifier");


--
-- Name: IDX_a3a5976e1b580ba1086c595802; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_a3a5976e1b580ba1086c595802" ON core."commandMenuItem" USING btree ("workspaceId", "universalIdentifier");


--
-- Name: IDX_a44e3b03f0eca32d0504d5ef73; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_a44e3b03f0eca32d0504d5ef73" ON core."viewGroup" USING btree ("workspaceId", "universalIdentifier");


--
-- Name: IDX_a4bb3c6176c2607693a6756ff6; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_a4bb3c6176c2607693a6756ff6" ON core."agentTurn" USING btree ("workspaceId");


--
-- Name: IDX_b27c681286ac581f81498c5d4b; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_b27c681286ac581f81498c5d4b" ON core."indexMetadata" USING btree ("workspaceId", "universalIdentifier");


--
-- Name: IDX_b8282d1e10fbb7856950f86c61; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_b8282d1e10fbb7856950f86c61" ON core."twoFactorAuthenticationMethod" USING btree ("workspaceId");


--
-- Name: IDX_b86af4ea24cae518dee8eae996; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_b86af4ea24cae518dee8eae996" ON core."viewField" USING btree ("workspaceId", "universalIdentifier");


--
-- Name: IDX_c5ea53618b32558fe24e495f21; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_c5ea53618b32558fe24e495f21" ON core."objectPermission" USING btree ("workspaceId", "universalIdentifier");


--
-- Name: IDX_c81d8fabdda94b7fa86fb6f1e7; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_c81d8fabdda94b7fa86fb6f1e7" ON core."agentTurnEvaluation" USING btree ("workspaceId");


--
-- Name: IDX_c94f072dbd3c11f7df51db5293; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_c94f072dbd3c11f7df51db5293" ON core."agentTurnEvaluation" USING btree ("turnId");


--
-- Name: IDX_cd4588bfc9ad73345b3953a039; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_cd4588bfc9ad73345b3953a039" ON core."viewFilter" USING btree ("workspaceId", "universalIdentifier");


--
-- Name: IDX_d48d713d01cc3c81bad1f39795; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_d48d713d01cc3c81bad1f39795" ON core.webhook USING btree ("workspaceId", "universalIdentifier");


--
-- Name: IDX_d8cf7f15cf6466ac0e3b443b3d; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_d8cf7f15cf6466ac0e3b443b3d" ON core."indexFieldMetadata" USING btree ("workspaceId");


--
-- Name: IDX_da8ffd3c24b4a819430a861067; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_da8ffd3c24b4a819430a861067" ON core."permissionFlag" USING btree ("workspaceId", "universalIdentifier");


--
-- Name: IDX_e46f3e01227f1c8ee0c8041821; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_e46f3e01227f1c8ee0c8041821" ON core."rowLevelPermissionPredicate" USING btree ("workspaceId", "universalIdentifier");


--
-- Name: IDX_e6398c21e6bb31b525272fac84; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_e6398c21e6bb31b525272fac84" ON core.skill USING btree ("workspaceId", "universalIdentifier");


--
-- Name: IDX_e6d7c07f32e6f0f08cf639d4f5; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_e6d7c07f32e6f0f08cf639d4f5" ON core."agentTurn" USING btree ("agentId");


--
-- Name: IDX_e6ed40a61e4584e98584019a47; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_e6ed40a61e4584e98584019a47" ON core."viewFilterGroup" USING btree ("workspaceId", "universalIdentifier");


--
-- Name: IDX_e88d35604c4445b16e682edb30; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_e88d35604c4445b16e682edb30" ON core."viewFieldGroup" USING btree ("workspaceId", "universalIdentifier");


--
-- Name: IDX_f1c88fdfc3ad8910b17fc1fd73; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_f1c88fdfc3ad8910b17fc1fd73" ON core."fieldMetadata" USING btree ("workspaceId", "universalIdentifier");


--
-- Name: UQ_USER_EMAIL; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "UQ_USER_EMAIL" ON core."user" USING btree (email) WHERE ("deletedAt" IS NULL);


--
-- Name: UQ_upgrade_migration_instance; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "UQ_upgrade_migration_instance" ON core."upgradeMigration" USING btree (name, attempt) WHERE ("workspaceId" IS NULL);


--
-- Name: UQ_upgrade_migration_workspace; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "UQ_upgrade_migration_workspace" ON core."upgradeMigration" USING btree (name, attempt, "workspaceId") WHERE ("workspaceId" IS NOT NULL);


--
-- Name: IDX_04d8ad72536bbeb4430998211f8; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_04d8ad72536bbeb4430998211f8" ON workspace_5tvw23m2ae5qhvivd4el66s5c.attachment USING btree ("targetPersonId");


--
-- Name: IDX_19ad12ae96a5d4357ff3a15ba2b; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_19ad12ae96a5d4357ff3a15ba2b" ON workspace_5tvw23m2ae5qhvivd4el66s5c."messageParticipant" USING btree ("messageId");


--
-- Name: IDX_1db95a87400f7679efc43a15e68; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_1db95a87400f7679efc43a15e68" ON workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannelMessageAssociationMessageFolder" USING btree ("messageFolderId");


--
-- Name: IDX_1ff229b8237e8368a92c08d11f0; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_1ff229b8237e8368a92c08d11f0" ON workspace_5tvw23m2ae5qhvivd4el66s5c."timelineActivity" USING btree ("targetTaskId");


--
-- Name: IDX_21649fe7fe250834d1dd37125b1; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_21649fe7fe250834d1dd37125b1" ON workspace_5tvw23m2ae5qhvivd4el66s5c.attachment USING btree ("targetCompanyId");


--
-- Name: IDX_22908125b74f1a7984b460d4ccb; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_22908125b74f1a7984b460d4ccb" ON workspace_5tvw23m2ae5qhvivd4el66s5c."_habitLog" USING gin ("searchVector");


--
-- Name: IDX_261d8661b94dbb98cc85cffab46; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_261d8661b94dbb98cc85cffab46" ON workspace_5tvw23m2ae5qhvivd4el66s5c."workflowRun" USING gin ("searchVector");


--
-- Name: IDX_26a021921ba73b428be8f244ded; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_26a021921ba73b428be8f244ded" ON workspace_5tvw23m2ae5qhvivd4el66s5c."timelineActivity" USING btree ("targetNoteId");


--
-- Name: IDX_2e85541b739066142845bdef99a; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_2e85541b739066142845bdef99a" ON workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannelMessageAssociation" USING btree ("messageChannelId");


--
-- Name: IDX_2f07fa4cf183061692f8d99df80; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_2f07fa4cf183061692f8d99df80" ON workspace_5tvw23m2ae5qhvivd4el66s5c."noteTarget" USING btree ("targetCompanyId");


--
-- Name: IDX_30f5fd16a4aa058d1a6c4b8ac10; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_30f5fd16a4aa058d1a6c4b8ac10" ON workspace_5tvw23m2ae5qhvivd4el66s5c.attachment USING btree ("targetWorkflowId");


--
-- Name: IDX_3491dc65669342b9bfb1637f5e0; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_3491dc65669342b9bfb1637f5e0" ON workspace_5tvw23m2ae5qhvivd4el66s5c.attachment USING btree ("targetTaskId");


--
-- Name: IDX_397bfb7946782933c476b98d925; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_397bfb7946782933c476b98d925" ON workspace_5tvw23m2ae5qhvivd4el66s5c."workflowAutomatedTrigger" USING btree ("workflowId");


--
-- Name: IDX_3c8bbe54bd34f40dfe2d05ac964; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_3c8bbe54bd34f40dfe2d05ac964" ON workspace_5tvw23m2ae5qhvivd4el66s5c."connectedAccount" USING btree ("accountOwnerId");


--
-- Name: IDX_3f4c0095cf17b62868bec089fab; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_3f4c0095cf17b62868bec089fab" ON workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannelMessageAssociation" USING btree ("messageId");


--
-- Name: IDX_40150517e4f1ab6154e426eafce; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_40150517e4f1ab6154e426eafce" ON workspace_5tvw23m2ae5qhvivd4el66s5c."calendarEventParticipant" USING btree ("calendarEventId");


--
-- Name: IDX_419778384cd97935db3e246f589; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_419778384cd97935db3e246f589" ON workspace_5tvw23m2ae5qhvivd4el66s5c."taskTarget" USING btree ("targetCompanyId");


--
-- Name: IDX_47a5ea9e149973d6ef980bdc4f1; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_47a5ea9e149973d6ef980bdc4f1" ON workspace_5tvw23m2ae5qhvivd4el66s5c."messageParticipant" USING btree ("personId");


--
-- Name: IDX_4b9feee3298c853326bf6ff8e42; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_4b9feee3298c853326bf6ff8e42" ON workspace_5tvw23m2ae5qhvivd4el66s5c.opportunity USING btree ("companyId");


--
-- Name: IDX_4c7e63468918a5d5233ccb65de7; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_4c7e63468918a5d5233ccb65de7" ON workspace_5tvw23m2ae5qhvivd4el66s5c.attachment USING btree ("targetDashboardId");


--
-- Name: IDX_51329bbcdab6618a75361670c26; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_51329bbcdab6618a75361670c26" ON workspace_5tvw23m2ae5qhvivd4el66s5c."workflowVersion" USING gin ("searchVector");


--
-- Name: IDX_55c9aaf7039b09cec455a872dde; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_55c9aaf7039b09cec455a872dde" ON workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannelMessageAssociationMessageFolder" USING btree ("messageChannelMessageAssociationId", "messageFolderId") WHERE ("deletedAt" IS NULL);


--
-- Name: IDX_58b130a455b1451066c84dc63e2; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_58b130a455b1451066c84dc63e2" ON workspace_5tvw23m2ae5qhvivd4el66s5c."timelineActivity" USING btree ("targetWorkflowRunId");


--
-- Name: IDX_5d002cd3b5be1cb05c0b7b28582; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_5d002cd3b5be1cb05c0b7b28582" ON workspace_5tvw23m2ae5qhvivd4el66s5c.message USING btree ("messageThreadId");


--
-- Name: IDX_62d09af534224aa478109b2d585; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_62d09af534224aa478109b2d585" ON workspace_5tvw23m2ae5qhvivd4el66s5c."timelineActivity" USING btree ("targetOpportunityId");


--
-- Name: IDX_699ff395576ff0f73cc87464166; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_699ff395576ff0f73cc87464166" ON workspace_5tvw23m2ae5qhvivd4el66s5c.attachment USING btree ("targetNoteId");


--
-- Name: IDX_6b2a27852dd0e0846577662a33a; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_6b2a27852dd0e0846577662a33a" ON workspace_5tvw23m2ae5qhvivd4el66s5c."timelineActivity" USING btree ("targetDashboardId");


--
-- Name: IDX_6dbfc4d091e55b676e5f698c2c2; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_6dbfc4d091e55b676e5f698c2c2" ON workspace_5tvw23m2ae5qhvivd4el66s5c."workflowVersion" USING btree ("workflowId");


--
-- Name: IDX_70c8cfc3c0c8407789db32ad9cf; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_70c8cfc3c0c8407789db32ad9cf" ON workspace_5tvw23m2ae5qhvivd4el66s5c."calendarEventParticipant" USING btree ("workspaceMemberId");


--
-- Name: IDX_733381453fca683f36c05af5478; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_733381453fca683f36c05af5478" ON workspace_5tvw23m2ae5qhvivd4el66s5c."calendarChannelEventAssociation" USING btree ("calendarEventId");


--
-- Name: IDX_74ad70941560ba6b2a179ad460c; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_74ad70941560ba6b2a179ad460c" ON workspace_5tvw23m2ae5qhvivd4el66s5c."taskTarget" USING btree ("taskId");


--
-- Name: IDX_7a56509bca48a709378017a9135; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_7a56509bca48a709378017a9135" ON workspace_5tvw23m2ae5qhvivd4el66s5c."messageParticipant" USING btree ("workspaceMemberId");


--
-- Name: IDX_7b40c7f03dd1f998ba765ad0730; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_7b40c7f03dd1f998ba765ad0730" ON workspace_5tvw23m2ae5qhvivd4el66s5c."calendarChannel" USING btree ("connectedAccountId");


--
-- Name: IDX_7e2582241f3b749d7a43d7d0231; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_7e2582241f3b749d7a43d7d0231" ON workspace_5tvw23m2ae5qhvivd4el66s5c."noteTarget" USING btree ("noteId");


--
-- Name: IDX_9058210268a941b4b77a609e982; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_9058210268a941b4b77a609e982" ON workspace_5tvw23m2ae5qhvivd4el66s5c."noteTarget" USING btree ("targetOpportunityId");


--
-- Name: IDX_953cb9c73db904f98697f4867b2; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_953cb9c73db904f98697f4867b2" ON workspace_5tvw23m2ae5qhvivd4el66s5c."timelineActivity" USING btree ("targetWorkflowVersionId");


--
-- Name: IDX_968d4fd721a78b75c13a1b9ec12; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_968d4fd721a78b75c13a1b9ec12" ON workspace_5tvw23m2ae5qhvivd4el66s5c."calendarChannelEventAssociation" USING btree ("calendarChannelId");


--
-- Name: IDX_9a2065c2b56ffe8b74d1a12705f; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_9a2065c2b56ffe8b74d1a12705f" ON workspace_5tvw23m2ae5qhvivd4el66s5c."timelineActivity" USING btree ("targetWorkflowId");


--
-- Name: IDX_9b267fc4a89dd1aaec4c5340f05; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_9b267fc4a89dd1aaec4c5340f05" ON workspace_5tvw23m2ae5qhvivd4el66s5c."timelineActivity" USING btree ("targetCompanyId");


--
-- Name: IDX_9e247b4ab168100e4aa8fb6a853; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_9e247b4ab168100e4aa8fb6a853" ON workspace_5tvw23m2ae5qhvivd4el66s5c.blocklist USING btree ("workspaceMemberId");


--
-- Name: IDX_9f96d65260c4676faac27cb6bf3; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_9f96d65260c4676faac27cb6bf3" ON workspace_5tvw23m2ae5qhvivd4el66s5c.opportunity USING gin ("searchVector");


--
-- Name: IDX_9fdeb410f15f569f2843698c5b3; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_9fdeb410f15f569f2843698c5b3" ON workspace_5tvw23m2ae5qhvivd4el66s5c."workflowRun" USING btree ("workflowVersionId");


--
-- Name: IDX_UNIQUE_2a32339058d0b6910b0834ddf81; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_UNIQUE_2a32339058d0b6910b0834ddf81" ON workspace_5tvw23m2ae5qhvivd4el66s5c.company USING btree ("domainNamePrimaryLinkUrl");


--
-- Name: IDX_UNIQUE_39954942ffa78c957b5dee47739; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_UNIQUE_39954942ffa78c957b5dee47739" ON workspace_5tvw23m2ae5qhvivd4el66s5c."workspaceMember" USING btree ("userEmail");


--
-- Name: IDX_UNIQUE_87914cd3ce963115f8cb943e2ac; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_UNIQUE_87914cd3ce963115f8cb943e2ac" ON workspace_5tvw23m2ae5qhvivd4el66s5c.person USING btree ("emailsPrimaryEmail");


--
-- Name: IDX_a1bbe482462d9f016582d99d4e6; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_a1bbe482462d9f016582d99d4e6" ON workspace_5tvw23m2ae5qhvivd4el66s5c."messageFolder" USING btree ("messageChannelId");


--
-- Name: IDX_a1e176335c31525bf3cc12f0e00; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_a1e176335c31525bf3cc12f0e00" ON workspace_5tvw23m2ae5qhvivd4el66s5c."noteTarget" USING btree ("targetPersonId");


--
-- Name: IDX_a975841121f56bbd023071fce69; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_a975841121f56bbd023071fce69" ON workspace_5tvw23m2ae5qhvivd4el66s5c._habit USING gin ("searchVector");


--
-- Name: IDX_ad176b81735717e4ff6e46be6c2; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_ad176b81735717e4ff6e46be6c2" ON workspace_5tvw23m2ae5qhvivd4el66s5c."_habitLog" USING btree ("habitId");


--
-- Name: IDX_ae09ff97967369e0644bacc0fce; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_ae09ff97967369e0644bacc0fce" ON workspace_5tvw23m2ae5qhvivd4el66s5c.person USING btree ("companyId");


--
-- Name: IDX_ae112c10e060420923011767b14; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_ae112c10e060420923011767b14" ON workspace_5tvw23m2ae5qhvivd4el66s5c.opportunity USING btree (stage);


--
-- Name: IDX_b5b4da613fc4d734f65fb1deb6b; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_b5b4da613fc4d734f65fb1deb6b" ON workspace_5tvw23m2ae5qhvivd4el66s5c.task USING btree ("assigneeId");


--
-- Name: IDX_ba8418718688702d3113fde2fe1; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_ba8418718688702d3113fde2fe1" ON workspace_5tvw23m2ae5qhvivd4el66s5c."calendarEventParticipant" USING btree ("personId");


--
-- Name: IDX_bbd7aec1976fc684a0a5e4816c9; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_bbd7aec1976fc684a0a5e4816c9" ON workspace_5tvw23m2ae5qhvivd4el66s5c.person USING gin ("searchVector");


--
-- Name: IDX_bf1967e8710f32f1a65c67fb4b4; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_bf1967e8710f32f1a65c67fb4b4" ON workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannel" USING btree ("connectedAccountId");


--
-- Name: IDX_c0ac950d77b75527f654b7f6a06; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_c0ac950d77b75527f654b7f6a06" ON workspace_5tvw23m2ae5qhvivd4el66s5c.opportunity USING btree ("pointOfContactId");


--
-- Name: IDX_d01a000cf26e1225d894dc3d364; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_d01a000cf26e1225d894dc3d364" ON workspace_5tvw23m2ae5qhvivd4el66s5c.task USING gin ("searchVector");


--
-- Name: IDX_d09fc4b1711543f42c127270f1e; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_d09fc4b1711543f42c127270f1e" ON workspace_5tvw23m2ae5qhvivd4el66s5c.workflow USING gin ("searchVector");


--
-- Name: IDX_da56d8b595a778d404eae01f29b; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_da56d8b595a778d404eae01f29b" ON workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannelMessageAssociation" USING btree ("messageChannelId", "messageId") WHERE ("deletedAt" IS NULL);


--
-- Name: IDX_daf00d51b50634730fd77f16bb6; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_daf00d51b50634730fd77f16bb6" ON workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannelMessageAssociationMessageFolder" USING btree ("messageChannelMessageAssociationId");


--
-- Name: IDX_dc68847d0ff0b17baef8fb632c2; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_dc68847d0ff0b17baef8fb632c2" ON workspace_5tvw23m2ae5qhvivd4el66s5c."timelineActivity" USING btree ("workspaceMemberId");


--
-- Name: IDX_e47451872f70c8f187a6b460ac7; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_e47451872f70c8f187a6b460ac7" ON workspace_5tvw23m2ae5qhvivd4el66s5c."workspaceMember" USING gin ("searchVector");


--
-- Name: IDX_e49dd7da4ed5c919babcd31c93b; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_e49dd7da4ed5c919babcd31c93b" ON workspace_5tvw23m2ae5qhvivd4el66s5c."timelineActivity" USING btree ("targetPersonId");


--
-- Name: IDX_eced9eb2a6cc8f9a5b49fe4b04e; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_eced9eb2a6cc8f9a5b49fe4b04e" ON workspace_5tvw23m2ae5qhvivd4el66s5c."workflowRun" USING btree ("workflowId");


--
-- Name: IDX_f0e95ec5e72b91f28fffac1201b; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_f0e95ec5e72b91f28fffac1201b" ON workspace_5tvw23m2ae5qhvivd4el66s5c."taskTarget" USING btree ("targetOpportunityId");


--
-- Name: IDX_f20de8d7fc74a405e4083051275; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_f20de8d7fc74a405e4083051275" ON workspace_5tvw23m2ae5qhvivd4el66s5c.note USING gin ("searchVector");


--
-- Name: IDX_f3b76c5322b31cba175b2eccec8; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_f3b76c5322b31cba175b2eccec8" ON workspace_5tvw23m2ae5qhvivd4el66s5c.dashboard USING gin ("searchVector");


--
-- Name: IDX_f3d9b01b0d587804e7beeb2a534; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_f3d9b01b0d587804e7beeb2a534" ON workspace_5tvw23m2ae5qhvivd4el66s5c."taskTarget" USING btree ("targetPersonId");


--
-- Name: IDX_f719a95179070eac397ba18dc70; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_f719a95179070eac397ba18dc70" ON workspace_5tvw23m2ae5qhvivd4el66s5c.company USING btree ("accountOwnerId");


--
-- Name: IDX_fb1f4905546cfc6d70a971c76f7; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_fb1f4905546cfc6d70a971c76f7" ON workspace_5tvw23m2ae5qhvivd4el66s5c.company USING gin ("searchVector");


--
-- Name: IDX_fde993c7020a17c3282edf5c9b8; Type: INDEX; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

CREATE INDEX "IDX_fde993c7020a17c3282edf5c9b8" ON workspace_5tvw23m2ae5qhvivd4el66s5c.attachment USING btree ("targetOpportunityId");


--
-- Name: pageLayoutTab FK_0177b1574efe6e6f24651977340; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."pageLayoutTab"
    ADD CONSTRAINT "FK_0177b1574efe6e6f24651977340" FOREIGN KEY ("pageLayoutId") REFERENCES core."pageLayout"(id) ON DELETE CASCADE;


--
-- Name: navigationMenuItem FK_03c63a0b00ddc3ade21ed0b1a80; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."navigationMenuItem"
    ADD CONSTRAINT "FK_03c63a0b00ddc3ade21ed0b1a80" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: indexMetadata FK_051487e9b745cb175950130b63f; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."indexMetadata"
    ADD CONSTRAINT "FK_051487e9b745cb175950130b63f" FOREIGN KEY ("objectMetadataId") REFERENCES core."objectMetadata"(id) ON DELETE CASCADE;


--
-- Name: fieldMetadata FK_05453a954e458e3d91f2ff5043f; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."fieldMetadata"
    ADD CONSTRAINT "FK_05453a954e458e3d91f2ff5043f" FOREIGN KEY ("applicationId") REFERENCES core.application(id) ON DELETE CASCADE;


--
-- Name: indexMetadata FK_056363e1599f5b9a0e33323d9da; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."indexMetadata"
    ADD CONSTRAINT "FK_056363e1599f5b9a0e33323d9da" FOREIGN KEY ("applicationId") REFERENCES core.application(id) ON DELETE CASCADE;


--
-- Name: pageLayoutWidget FK_0659a4d171c93f5c046f18d24cd; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."pageLayoutWidget"
    ADD CONSTRAINT "FK_0659a4d171c93f5c046f18d24cd" FOREIGN KEY ("pageLayoutTabId") REFERENCES core."pageLayoutTab"(id) ON DELETE CASCADE;


--
-- Name: applicationRegistrationVariable FK_067a6267789011853178a6ab57a; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."applicationRegistrationVariable"
    ADD CONSTRAINT "FK_067a6267789011853178a6ab57a" FOREIGN KEY ("applicationRegistrationId") REFERENCES core."applicationRegistration"(id) ON DELETE CASCADE;


--
-- Name: viewFilter FK_06858adf0fb54ec88fa602198ca; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."viewFilter"
    ADD CONSTRAINT "FK_06858adf0fb54ec88fa602198ca" FOREIGN KEY ("viewId") REFERENCES core.view(id) ON DELETE CASCADE;


--
-- Name: application FK_08d1d5e33c2a3ce7c140e9b335b; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.application
    ADD CONSTRAINT "FK_08d1d5e33c2a3ce7c140e9b335b" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logicFunctionLayer FK_0a2947ca6a9adefa41eb62b2322; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."logicFunctionLayer"
    ADD CONSTRAINT "FK_0a2947ca6a9adefa41eb62b2322" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: viewField FK_0a48a0b66daedac1314437be5eb; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."viewField"
    ADD CONSTRAINT "FK_0a48a0b66daedac1314437be5eb" FOREIGN KEY ("fieldMetadataId") REFERENCES core."fieldMetadata"(id) ON DELETE CASCADE;


--
-- Name: keyValuePair FK_0dae35d1c0fbdda6495be4ae71a; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."keyValuePair"
    ADD CONSTRAINT "FK_0dae35d1c0fbdda6495be4ae71a" FOREIGN KEY ("userId") REFERENCES core."user"(id) ON DELETE CASCADE;


--
-- Name: viewFieldGroup FK_118208b32ebf53be5aaede9c9cf; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."viewFieldGroup"
    ADD CONSTRAINT "FK_118208b32ebf53be5aaede9c9cf" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: permissionFlag FK_13f8ca9c517976733a1ce4c10eb; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."permissionFlag"
    ADD CONSTRAINT "FK_13f8ca9c517976733a1ce4c10eb" FOREIGN KEY ("roleId") REFERENCES core.role(id) ON DELETE CASCADE;


--
-- Name: rowLevelPermissionPredicate FK_15199deab40d48dd1480a2faf85; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."rowLevelPermissionPredicate"
    ADD CONSTRAINT "FK_15199deab40d48dd1480a2faf85" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: viewFieldGroup FK_15c7197294c08e6e780d9734c99; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."viewFieldGroup"
    ADD CONSTRAINT "FK_15c7197294c08e6e780d9734c99" FOREIGN KEY ("viewId") REFERENCES core.view(id) ON DELETE CASCADE;


--
-- Name: navigationMenuItem FK_175fc64110c36793eaf9765d1c6; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."navigationMenuItem"
    ADD CONSTRAINT "FK_175fc64110c36793eaf9765d1c6" FOREIGN KEY ("folderId") REFERENCES core."navigationMenuItem"(id) ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED;


--
-- Name: viewFilter FK_193548db5abc45713087f7d1af6; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."viewFilter"
    ADD CONSTRAINT "FK_193548db5abc45713087f7d1af6" FOREIGN KEY ("fieldMetadataId") REFERENCES core."fieldMetadata"(id) ON DELETE CASCADE;


--
-- Name: searchFieldMetadata FK_1b78544eb06f82059a2a01013a3; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."searchFieldMetadata"
    ADD CONSTRAINT "FK_1b78544eb06f82059a2a01013a3" FOREIGN KEY ("objectMetadataId") REFERENCES core."objectMetadata"(id) ON DELETE CASCADE;


--
-- Name: connectedAccount FK_1c7af038a011e99c27044793c6a; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."connectedAccount"
    ADD CONSTRAINT "FK_1c7af038a011e99c27044793c6a" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: rowLevelPermissionPredicateGroup FK_1e82563accb67114f65a3993b86; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."rowLevelPermissionPredicateGroup"
    ADD CONSTRAINT "FK_1e82563accb67114f65a3993b86" FOREIGN KEY ("applicationId") REFERENCES core.application(id) ON DELETE CASCADE;


--
-- Name: messageChannel FK_22d9a21a23fdd99295dc0efc177; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."messageChannel"
    ADD CONSTRAINT "FK_22d9a21a23fdd99295dc0efc177" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: userWorkspace FK_22f5e76f493c3fb20237cfc48b0; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."userWorkspace"
    ADD CONSTRAINT "FK_22f5e76f493c3fb20237cfc48b0" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: rowLevelPermissionPredicate FK_23b36d07d363f81200654fa1334; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."rowLevelPermissionPredicate"
    ADD CONSTRAINT "FK_23b36d07d363f81200654fa1334" FOREIGN KEY ("applicationId") REFERENCES core.application(id) ON DELETE CASCADE;


--
-- Name: pageLayoutTab FK_2528e67c8c0c953d8303172989e; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."pageLayoutTab"
    ADD CONSTRAINT "FK_2528e67c8c0c953d8303172989e" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: agent FK_259c48f99f625708723414adb5d; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.agent
    ADD CONSTRAINT "FK_259c48f99f625708723414adb5d" FOREIGN KEY ("applicationId") REFERENCES core.application(id) ON DELETE CASCADE;


--
-- Name: rowLevelPermissionPredicateGroup FK_25bbd97a29478e18061cb58950f; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."rowLevelPermissionPredicateGroup"
    ADD CONSTRAINT "FK_25bbd97a29478e18061cb58950f" FOREIGN KEY ("parentRowLevelPermissionPredicateGroupId") REFERENCES core."rowLevelPermissionPredicateGroup"(id) ON DELETE CASCADE;


--
-- Name: fieldPermission FK_2763aee5614b54019d692333fe1; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."fieldPermission"
    ADD CONSTRAINT "FK_2763aee5614b54019d692333fe1" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: workspace FK_282123b2f32e927b6003311e33a; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.workspace
    ADD CONSTRAINT "FK_282123b2f32e927b6003311e33a" FOREIGN KEY ("logoFileId") REFERENCES core.file(id) ON DELETE SET NULL;


--
-- Name: application FK_28f20711184b3c3318a8e44d117; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.application
    ADD CONSTRAINT "FK_28f20711184b3c3318a8e44d117" FOREIGN KEY ("yarnLockFileId") REFERENCES core.file(id) ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED;


--
-- Name: agentMessagePart FK_2aff9daad5cc3b5e15ca7173342; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."agentMessagePart"
    ADD CONSTRAINT "FK_2aff9daad5cc3b5e15ca7173342" FOREIGN KEY ("messageId") REFERENCES core."agentMessage"(id) ON DELETE CASCADE;


--
-- Name: viewSort FK_2b36c6adea4542b4844d9fb1806; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."viewSort"
    ADD CONSTRAINT "FK_2b36c6adea4542b4844d9fb1806" FOREIGN KEY ("viewId") REFERENCES core.view(id) ON DELETE CASCADE;


--
-- Name: viewGroup FK_2d7cfc4748058a0ca648835d046; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."viewGroup"
    ADD CONSTRAINT "FK_2d7cfc4748058a0ca648835d046" FOREIGN KEY ("viewId") REFERENCES core.view(id) ON DELETE CASCADE;


--
-- Name: messageChannel FK_2e966cbb240771c67630d52895c; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."messageChannel"
    ADD CONSTRAINT "FK_2e966cbb240771c67630d52895c" FOREIGN KEY ("connectedAccountId") REFERENCES core."connectedAccount"(id) ON DELETE CASCADE;


--
-- Name: viewFilter FK_32cabc67e40d24acab541c469a8; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."viewFilter"
    ADD CONSTRAINT "FK_32cabc67e40d24acab541c469a8" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: commandMenuItem FK_342086f37d44e726a359ed6fd7d; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."commandMenuItem"
    ADD CONSTRAINT "FK_342086f37d44e726a359ed6fd7d" FOREIGN KEY ("frontComponentId") REFERENCES core."frontComponent"(id) ON DELETE CASCADE;


--
-- Name: view FK_348e25d584c7e51417f4e097941; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.view
    ADD CONSTRAINT "FK_348e25d584c7e51417f4e097941" FOREIGN KEY ("applicationId") REFERENCES core.application(id) ON DELETE CASCADE;


--
-- Name: applicationRegistration FK_36715821de396df9536fd4afc81; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."applicationRegistration"
    ADD CONSTRAINT "FK_36715821de396df9536fd4afc81" FOREIGN KEY ("tarballFileId") REFERENCES core.file(id) ON DELETE SET NULL;


--
-- Name: application FK_3818380258798f9ffa9963b6dc4; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.application
    ADD CONSTRAINT "FK_3818380258798f9ffa9963b6dc4" FOREIGN KEY ("packageJsonFileId") REFERENCES core.file(id) ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED;


--
-- Name: viewFieldGroup FK_38ec9201914a42386e5cdaa6521; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."viewFieldGroup"
    ADD CONSTRAINT "FK_38ec9201914a42386e5cdaa6521" FOREIGN KEY ("applicationId") REFERENCES core.application(id) ON DELETE CASCADE;


--
-- Name: view FK_394132f681ecbffa8ac912d1e5f; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.view
    ADD CONSTRAINT "FK_394132f681ecbffa8ac912d1e5f" FOREIGN KEY ("createdByUserWorkspaceId") REFERENCES core."userWorkspace"(id) ON DELETE SET NULL;


--
-- Name: workspace FK_3b1acb13a5dac9956d1a4b32755; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.workspace
    ADD CONSTRAINT "FK_3b1acb13a5dac9956d1a4b32755" FOREIGN KEY ("workspaceCustomApplicationId") REFERENCES core.application(id) ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED;


--
-- Name: agentChatThread FK_3bd935d6f8c5ce87194b8db8240; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."agentChatThread"
    ADD CONSTRAINT "FK_3bd935d6f8c5ce87194b8db8240" FOREIGN KEY ("userWorkspaceId") REFERENCES core."userWorkspace"(id) ON DELETE CASCADE;


--
-- Name: agentTurn FK_3be906dca9d5b50fbfe40e33f07; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."agentTurn"
    ADD CONSTRAINT "FK_3be906dca9d5b50fbfe40e33f07" FOREIGN KEY ("threadId") REFERENCES core."agentChatThread"(id) ON DELETE CASCADE;


--
-- Name: agentChatThread FK_3d097ed53841d80904ed02c8373; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."agentChatThread"
    ADD CONSTRAINT "FK_3d097ed53841d80904ed02c8373" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: view FK_3e5ea41c239ef1b75b0d42bef99; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.view
    ADD CONSTRAINT "FK_3e5ea41c239ef1b75b0d42bef99" FOREIGN KEY ("objectMetadataId") REFERENCES core."objectMetadata"(id) ON DELETE CASCADE;


--
-- Name: rowLevelPermissionPredicateGroup FK_3f1abc7557a4e9f4334d41b07d7; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."rowLevelPermissionPredicateGroup"
    ADD CONSTRAINT "FK_3f1abc7557a4e9f4334d41b07d7" FOREIGN KEY ("roleId") REFERENCES core.role(id) ON DELETE CASCADE;


--
-- Name: file FK_413aaaf293284c3c0266d0bab3a; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.file
    ADD CONSTRAINT "FK_413aaaf293284c3c0266d0bab3a" FOREIGN KEY ("applicationId") REFERENCES core.application(id) ON DELETE RESTRICT;


--
-- Name: messageFolder FK_4237a2fe8a6583354f807c2f8fe; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."messageFolder"
    ADD CONSTRAINT "FK_4237a2fe8a6583354f807c2f8fe" FOREIGN KEY ("messageChannelId") REFERENCES core."messageChannel"(id) ON DELETE CASCADE;


--
-- Name: pageLayoutTab FK_4493447c2e4029aa26cabf30460; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."pageLayoutTab"
    ADD CONSTRAINT "FK_4493447c2e4029aa26cabf30460" FOREIGN KEY ("applicationId") REFERENCES core.application(id) ON DELETE CASCADE;


--
-- Name: skill FK_46f69b93b58666bb388c5c7785a; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.skill
    ADD CONSTRAINT "FK_46f69b93b58666bb388c5c7785a" FOREIGN KEY ("applicationId") REFERENCES core.application(id) ON DELETE CASCADE;


--
-- Name: fieldMetadata FK_47a6c57e1652b6475f8248cff78; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."fieldMetadata"
    ADD CONSTRAINT "FK_47a6c57e1652b6475f8248cff78" FOREIGN KEY ("relationTargetFieldMetadataId") REFERENCES core."fieldMetadata"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: roleTarget FK_4b3865868c7da0747ee8e480851; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."roleTarget"
    ADD CONSTRAINT "FK_4b3865868c7da0747ee8e480851" FOREIGN KEY ("apiKeyId") REFERENCES core."apiKey"(id) ON DELETE CASCADE;


--
-- Name: navigationMenuItem FK_4ba3e5e988c4c5f159ec8753ee3; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."navigationMenuItem"
    ADD CONSTRAINT "FK_4ba3e5e988c4c5f159ec8753ee3" FOREIGN KEY ("pageLayoutId") REFERENCES core."pageLayout"(id) ON DELETE CASCADE;


--
-- Name: agentMessage FK_4c31daa882e3130534995bf90ca; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."agentMessage"
    ADD CONSTRAINT "FK_4c31daa882e3130534995bf90ca" FOREIGN KEY ("threadId") REFERENCES core."agentChatThread"(id) ON DELETE CASCADE;


--
-- Name: applicationVariable FK_51adb49e7f8df35dd23e01c4830; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."applicationVariable"
    ADD CONSTRAINT "FK_51adb49e7f8df35dd23e01c4830" FOREIGN KEY ("applicationId") REFERENCES core.application(id) ON DELETE CASCADE;


--
-- Name: pageLayoutWidget FK_555948f84165dce1fe1f5f955ce; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."pageLayoutWidget"
    ADD CONSTRAINT "FK_555948f84165dce1fe1f5f955ce" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: view FK_580dad12c8b92f3a3c307c4e66d; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.view
    ADD CONSTRAINT "FK_580dad12c8b92f3a3c307c4e66d" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: webhook FK_597ab5e7de76f1836b8fd80d6b9; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.webhook
    ADD CONSTRAINT "FK_597ab5e7de76f1836b8fd80d6b9" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: viewGroup FK_5aff384532c78fa8a42ceeae282; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."viewGroup"
    ADD CONSTRAINT "FK_5aff384532c78fa8a42ceeae282" FOREIGN KEY ("applicationId") REFERENCES core.application(id) ON DELETE CASCADE;


--
-- Name: view FK_5c0d21d6b8d5544a24ab9787114; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.view
    ADD CONSTRAINT "FK_5c0d21d6b8d5544a24ab9787114" FOREIGN KEY ("calendarFieldMetadataId") REFERENCES core."fieldMetadata"(id) ON DELETE CASCADE;


--
-- Name: indexMetadata FK_5c988136a6d6f25a100c1064789; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."indexMetadata"
    ADD CONSTRAINT "FK_5c988136a6d6f25a100c1064789" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: pageLayout FK_5e7f19b88c0864db19e2bad0fc5; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."pageLayout"
    ADD CONSTRAINT "FK_5e7f19b88c0864db19e2bad0fc5" FOREIGN KEY ("applicationId") REFERENCES core.application(id) ON DELETE CASCADE;


--
-- Name: searchFieldMetadata FK_5f10e00da471e19f52513f47d8b; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."searchFieldMetadata"
    ADD CONSTRAINT "FK_5f10e00da471e19f52513f47d8b" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: viewSort FK_5f3278d6791aa4c58423e556ae6; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."viewSort"
    ADD CONSTRAINT "FK_5f3278d6791aa4c58423e556ae6" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: rowLevelPermissionPredicate FK_5fb4b0cebaf1b6418412bf65170; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."rowLevelPermissionPredicate"
    ADD CONSTRAINT "FK_5fb4b0cebaf1b6418412bf65170" FOREIGN KEY ("roleId") REFERENCES core.role(id) ON DELETE CASCADE;


--
-- Name: viewGroup FK_61053f5509cc31e5d7139fba1cb; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."viewGroup"
    ADD CONSTRAINT "FK_61053f5509cc31e5d7139fba1cb" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: navigationMenuItem FK_62d47d14b50b67a03f832481de7; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."navigationMenuItem"
    ADD CONSTRAINT "FK_62d47d14b50b67a03f832481de7" FOREIGN KEY ("targetObjectMetadataId") REFERENCES core."objectMetadata"(id) ON DELETE CASCADE;


--
-- Name: frontComponent FK_63e430d5f8e554c4282e7b48876; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."frontComponent"
    ADD CONSTRAINT "FK_63e430d5f8e554c4282e7b48876" FOREIGN KEY ("applicationId") REFERENCES core.application(id) ON DELETE CASCADE;


--
-- Name: rowLevelPermissionPredicate FK_67519abd77fc637444720192737; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."rowLevelPermissionPredicate"
    ADD CONSTRAINT "FK_67519abd77fc637444720192737" FOREIGN KEY ("rowLevelPermissionPredicateGroupId") REFERENCES core."rowLevelPermissionPredicateGroup"(id) ON DELETE CASCADE;


--
-- Name: viewFilterGroup FK_6aa17342705ae5526de377bf7ed; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."viewFilterGroup"
    ADD CONSTRAINT "FK_6aa17342705ae5526de377bf7ed" FOREIGN KEY ("parentViewFilterGroupId") REFERENCES core."viewFilterGroup"(id) ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED;


--
-- Name: featureFlag FK_6be7761fa8453f3a498aab6e72b; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."featureFlag"
    ADD CONSTRAINT "FK_6be7761fa8453f3a498aab6e72b" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: searchFieldMetadata FK_6d5c6922bfd1578b1eff2abb9d6; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."searchFieldMetadata"
    ADD CONSTRAINT "FK_6d5c6922bfd1578b1eff2abb9d6" FOREIGN KEY ("fieldMetadataId") REFERENCES core."fieldMetadata"(id) ON DELETE CASCADE;


--
-- Name: commandMenuItem FK_6e050fb56a8385718123a4f8bc6; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."commandMenuItem"
    ADD CONSTRAINT "FK_6e050fb56a8385718123a4f8bc6" FOREIGN KEY ("availabilityObjectMetadataId") REFERENCES core."objectMetadata"(id) ON DELETE CASCADE;


--
-- Name: fieldMetadata FK_6f6c87ec32cca956d8be321071c; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."fieldMetadata"
    ADD CONSTRAINT "FK_6f6c87ec32cca956d8be321071c" FOREIGN KEY ("relationTargetObjectMetadataId") REFERENCES core."objectMetadata"(id) ON DELETE CASCADE;


--
-- Name: navigationMenuItem FK_6fd84a774fe4ea4daa9aeeee5ed; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."navigationMenuItem"
    ADD CONSTRAINT "FK_6fd84a774fe4ea4daa9aeeee5ed" FOREIGN KEY ("applicationId") REFERENCES core.application(id) ON DELETE CASCADE;


--
-- Name: agentMessagePart FK_70b398dc45219db8f3e36b3a078; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."agentMessagePart"
    ADD CONSTRAINT "FK_70b398dc45219db8f3e36b3a078" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: objectMetadata FK_71a7af5a5c916f0b96f358f25f7; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."objectMetadata"
    ADD CONSTRAINT "FK_71a7af5a5c916f0b96f358f25f7" FOREIGN KEY ("applicationId") REFERENCES core.application(id) ON DELETE CASCADE;


--
-- Name: fieldPermission FK_71cc60c4a1c9f8a7c434d91d38c; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."fieldPermission"
    ADD CONSTRAINT "FK_71cc60c4a1c9f8a7c434d91d38c" FOREIGN KEY ("applicationId") REFERENCES core.application(id) ON DELETE CASCADE;


--
-- Name: approvedAccessDomain FK_73d3e340b6ce0716a25a86361fc; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."approvedAccessDomain"
    ADD CONSTRAINT "FK_73d3e340b6ce0716a25a86361fc" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: pageLayout FK_747fbc25827bdcb9e35cc68a990; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."pageLayout"
    ADD CONSTRAINT "FK_747fbc25827bdcb9e35cc68a990" FOREIGN KEY ("defaultTabToFocusOnMobileAndSidePanelId") REFERENCES core."pageLayoutTab"(id) ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: agentMessage FK_75db4f2e80922078e8171ae130a; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."agentMessage"
    ADD CONSTRAINT "FK_75db4f2e80922078e8171ae130a" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: pageLayout FK_760ec8b78721991220b76accd55; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."pageLayout"
    ADD CONSTRAINT "FK_760ec8b78721991220b76accd55" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: upgradeMigration FK_77f64a697c55f8802592bd7eeba; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."upgradeMigration"
    ADD CONSTRAINT "FK_77f64a697c55f8802592bd7eeba" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: applicationVariable FK_78ae6cfe5f49a76c4bf842ad58b; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."applicationVariable"
    ADD CONSTRAINT "FK_78ae6cfe5f49a76c4bf842ad58b" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: emailingDomain FK_793a938bef2aae0a2129f78951f; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."emailingDomain"
    ADD CONSTRAINT "FK_793a938bef2aae0a2129f78951f" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: publicDomain FK_7e9ca5fd7aa30b8396ea3d1d6be; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."publicDomain"
    ADD CONSTRAINT "FK_7e9ca5fd7aa30b8396ea3d1d6be" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: role FK_7f3b96f15aaf5a27549288d264b; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.role
    ADD CONSTRAINT "FK_7f3b96f15aaf5a27549288d264b" FOREIGN KEY ("applicationId") REFERENCES core.application(id) ON DELETE CASCADE;


--
-- Name: viewSort FK_818522b962a9b756accb5b3149d; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."viewSort"
    ADD CONSTRAINT "FK_818522b962a9b756accb5b3149d" FOREIGN KEY ("fieldMetadataId") REFERENCES core."fieldMetadata"(id) ON DELETE CASCADE;


--
-- Name: objectPermission FK_826052747c82e59f0a006204256; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."objectPermission"
    ADD CONSTRAINT "FK_826052747c82e59f0a006204256" FOREIGN KEY ("roleId") REFERENCES core.role(id) ON DELETE CASCADE;


--
-- Name: permissionFlag FK_835bc9f7ef959debfc5cd268049; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."permissionFlag"
    ADD CONSTRAINT "FK_835bc9f7ef959debfc5cd268049" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: roleTarget FK_83ea4a0433da5007a198db7667e; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."roleTarget"
    ADD CONSTRAINT "FK_83ea4a0433da5007a198db7667e" FOREIGN KEY ("roleId") REFERENCES core.role(id) ON DELETE CASCADE;


--
-- Name: commandMenuItem FK_8577be6253969364b6725b807b4; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."commandMenuItem"
    ADD CONSTRAINT "FK_8577be6253969364b6725b807b4" FOREIGN KEY ("pageLayoutId") REFERENCES core."pageLayout"(id) ON DELETE CASCADE;


--
-- Name: agentMessage FK_87dbab10ac94d9a091f8efaa67b; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."agentMessage"
    ADD CONSTRAINT "FK_87dbab10ac94d9a091f8efaa67b" FOREIGN KEY ("turnId") REFERENCES core."agentTurn"(id) ON DELETE CASCADE;


--
-- Name: viewFilterGroup FK_8919a390f4022ab1e40182a5ac3; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."viewFilterGroup"
    ADD CONSTRAINT "FK_8919a390f4022ab1e40182a5ac3" FOREIGN KEY ("viewId") REFERENCES core.view(id) ON DELETE CASCADE;


--
-- Name: appToken FK_8cd4819144baf069777b5729136; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."appToken"
    ADD CONSTRAINT "FK_8cd4819144baf069777b5729136" FOREIGN KEY ("userId") REFERENCES core."user"(id) ON DELETE CASCADE;


--
-- Name: postgresCredentials FK_9494639abc06f9c8c3691bf5d22; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."postgresCredentials"
    ADD CONSTRAINT "FK_9494639abc06f9c8c3691bf5d22" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: commandMenuItem FK_94947770f00413f134a1ec01dd7; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."commandMenuItem"
    ADD CONSTRAINT "FK_94947770f00413f134a1ec01dd7" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: applicationRegistration FK_94ab20372e448d45088357f884e; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."applicationRegistration"
    ADD CONSTRAINT "FK_94ab20372e448d45088357f884e" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE SET NULL;


--
-- Name: viewField FK_96158de54c78944b5340b6f708e; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."viewField"
    ADD CONSTRAINT "FK_96158de54c78944b5340b6f708e" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: fieldMetadata FK_9ce5ba7878f498bcf79e447a9a6; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."fieldMetadata"
    ADD CONSTRAINT "FK_9ce5ba7878f498bcf79e447a9a6" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: navigationMenuItem FK_9ec9d8bc9bb4197be12d4efcaf3; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."navigationMenuItem"
    ADD CONSTRAINT "FK_9ec9d8bc9bb4197be12d4efcaf3" FOREIGN KEY ("viewId") REFERENCES core.view(id) ON DELETE CASCADE;


--
-- Name: userWorkspace FK_a2da2ea7d6cd1e5a4c5cb1791f8; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."userWorkspace"
    ADD CONSTRAINT "FK_a2da2ea7d6cd1e5a4c5cb1791f8" FOREIGN KEY ("userId") REFERENCES core."user"(id) ON DELETE CASCADE;


--
-- Name: rowLevelPermissionPredicateGroup FK_a41b6a06e3a7ded2204b0fc815d; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."rowLevelPermissionPredicateGroup"
    ADD CONSTRAINT "FK_a41b6a06e3a7ded2204b0fc815d" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: agentTurn FK_a4bb3c6176c2607693a6756ff6c; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."agentTurn"
    ADD CONSTRAINT "FK_a4bb3c6176c2607693a6756ff6c" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: logicFunction FK_a6ff4745db9bbe5a9616cfdfd5b; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."logicFunction"
    ADD CONSTRAINT "FK_a6ff4745db9bbe5a9616cfdfd5b" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: roleTarget FK_a86894bed7b7e1cc8b3f1d6186f; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."roleTarget"
    ADD CONSTRAINT "FK_a86894bed7b7e1cc8b3f1d6186f" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: commandMenuItem FK_ad42dd64b117491a38120466d65; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."commandMenuItem"
    ADD CONSTRAINT "FK_ad42dd64b117491a38120466d65" FOREIGN KEY ("applicationId") REFERENCES core.application(id) ON DELETE CASCADE;


--
-- Name: twoFactorAuthenticationMethod FK_b0f44ffd7c794beb48cb1e1b1a9; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."twoFactorAuthenticationMethod"
    ADD CONSTRAINT "FK_b0f44ffd7c794beb48cb1e1b1a9" FOREIGN KEY ("userWorkspaceId") REFERENCES core."userWorkspace"(id) ON DELETE CASCADE;


--
-- Name: roleTarget FK_b1db027b64f44029389ace305ac; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."roleTarget"
    ADD CONSTRAINT "FK_b1db027b64f44029389ace305ac" FOREIGN KEY ("applicationId") REFERENCES core.application(id) ON DELETE CASCADE;


--
-- Name: indexFieldMetadata FK_b20192c432612eb710801dd5664; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."indexFieldMetadata"
    ADD CONSTRAINT "FK_b20192c432612eb710801dd5664" FOREIGN KEY ("indexMetadataId") REFERENCES core."indexMetadata"(id) ON DELETE CASCADE;


--
-- Name: permissionFlag FK_b26a9d39a88d0e72373c677c6c5; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."permissionFlag"
    ADD CONSTRAINT "FK_b26a9d39a88d0e72373c677c6c5" FOREIGN KEY ("applicationId") REFERENCES core.application(id) ON DELETE CASCADE;


--
-- Name: navigationMenuItem FK_b2e02050a5faa58ed3e08624659; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."navigationMenuItem"
    ADD CONSTRAINT "FK_b2e02050a5faa58ed3e08624659" FOREIGN KEY ("userWorkspaceId") REFERENCES core."userWorkspace"(id) ON DELETE CASCADE;


--
-- Name: view FK_b3cc95732479f7a1337350c398f; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.view
    ADD CONSTRAINT "FK_b3cc95732479f7a1337350c398f" FOREIGN KEY ("kanbanAggregateOperationFieldMetadataId") REFERENCES core."fieldMetadata"(id) ON DELETE CASCADE;


--
-- Name: viewFilter FK_b518bd61175e0963370e09ef15e; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."viewFilter"
    ADD CONSTRAINT "FK_b518bd61175e0963370e09ef15e" FOREIGN KEY ("viewFilterGroupId") REFERENCES core."viewFilterGroup"(id) ON DELETE CASCADE;


--
-- Name: viewField FK_b560ea62a958deff0c6059caa45; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."viewField"
    ADD CONSTRAINT "FK_b560ea62a958deff0c6059caa45" FOREIGN KEY ("applicationId") REFERENCES core.application(id) ON DELETE CASCADE;


--
-- Name: rowLevelPermissionPredicate FK_b575e84d5ba7f183079c5c8c421; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."rowLevelPermissionPredicate"
    ADD CONSTRAINT "FK_b575e84d5ba7f183079c5c8c421" FOREIGN KEY ("workspaceMemberFieldMetadataId") REFERENCES core."fieldMetadata"(id) ON DELETE SET NULL;


--
-- Name: frontComponent FK_b5e4eea33659f066e865ab6afe0; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."frontComponent"
    ADD CONSTRAINT "FK_b5e4eea33659f066e865ab6afe0" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: twoFactorAuthenticationMethod FK_b8282d1e10fbb7856950f86c616; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."twoFactorAuthenticationMethod"
    ADD CONSTRAINT "FK_b8282d1e10fbb7856950f86c616" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: skill FK_b832ffda9048fae83e52fbe48a7; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.skill
    ADD CONSTRAINT "FK_b832ffda9048fae83e52fbe48a7" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: calendarChannel FK_bb5ebadf91b73c8050fb0a092fa; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."calendarChannel"
    ADD CONSTRAINT "FK_bb5ebadf91b73c8050fb0a092fa" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: fieldPermission FK_bbf16a91f5a10199e5b18c019ba; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."fieldPermission"
    ADD CONSTRAINT "FK_bbf16a91f5a10199e5b18c019ba" FOREIGN KEY ("roleId") REFERENCES core.role(id) ON DELETE CASCADE;


--
-- Name: workspaceSSOIdentityProvider FK_bc8d8855198de1fbc32fba8df93; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."workspaceSSOIdentityProvider"
    ADD CONSTRAINT "FK_bc8d8855198de1fbc32fba8df93" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: indexFieldMetadata FK_be0950612a54b58c72bd62d629e; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."indexFieldMetadata"
    ADD CONSTRAINT "FK_be0950612a54b58c72bd62d629e" FOREIGN KEY ("fieldMetadataId") REFERENCES core."fieldMetadata"(id) ON DELETE CASCADE;


--
-- Name: viewFilterGroup FK_bfc3498b964ef1bfc89b1f2bee3; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."viewFilterGroup"
    ADD CONSTRAINT "FK_bfc3498b964ef1bfc89b1f2bee3" FOREIGN KEY ("applicationId") REFERENCES core.application(id) ON DELETE CASCADE;


--
-- Name: keyValuePair FK_c137e3d8b3980901e114941daa2; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."keyValuePair"
    ADD CONSTRAINT "FK_c137e3d8b3980901e114941daa2" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: agent FK_c4cb56621768a4a325dd772bbe1; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.agent
    ADD CONSTRAINT "FK_c4cb56621768a4a325dd772bbe1" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: pageLayoutWidget FK_c4dc95034f53a12601e623d9171; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."pageLayoutWidget"
    ADD CONSTRAINT "FK_c4dc95034f53a12601e623d9171" FOREIGN KEY ("objectMetadataId") REFERENCES core."objectMetadata"(id) ON DELETE CASCADE;


--
-- Name: viewField FK_c5ab40cd4debb51d588752a4857; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."viewField"
    ADD CONSTRAINT "FK_c5ab40cd4debb51d588752a4857" FOREIGN KEY ("viewId") REFERENCES core.view(id) ON DELETE CASCADE;


--
-- Name: calendarChannel FK_c7bc368c97a18a072413d67cf45; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."calendarChannel"
    ADD CONSTRAINT "FK_c7bc368c97a18a072413d67cf45" FOREIGN KEY ("connectedAccountId") REFERENCES core."connectedAccount"(id) ON DELETE CASCADE;


--
-- Name: agentTurnEvaluation FK_c81d8fabdda94b7fa86fb6f1e70; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."agentTurnEvaluation"
    ADD CONSTRAINT "FK_c81d8fabdda94b7fa86fb6f1e70" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: apiKey FK_c8b3efa54a29aa873043e72fb1d; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."apiKey"
    ADD CONSTRAINT "FK_c8b3efa54a29aa873043e72fb1d" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: agentTurnEvaluation FK_c94f072dbd3c11f7df51db52934; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."agentTurnEvaluation"
    ADD CONSTRAINT "FK_c94f072dbd3c11f7df51db52934" FOREIGN KEY ("turnId") REFERENCES core."agentTurn"(id) ON DELETE CASCADE;


--
-- Name: rowLevelPermissionPredicateGroup FK_ca604fd5ee245bca9f32ed67b9b; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."rowLevelPermissionPredicateGroup"
    ADD CONSTRAINT "FK_ca604fd5ee245bca9f32ed67b9b" FOREIGN KEY ("objectMetadataId") REFERENCES core."objectMetadata"(id) ON DELETE CASCADE;


--
-- Name: application FK_ca635da088fa8d5379ed268b55e; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.application
    ADD CONSTRAINT "FK_ca635da088fa8d5379ed268b55e" FOREIGN KEY ("applicationRegistrationId") REFERENCES core."applicationRegistration"(id) ON DELETE SET NULL;


--
-- Name: view FK_d1fa625016e36ec6f79fb13e824; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.view
    ADD CONSTRAINT "FK_d1fa625016e36ec6f79fb13e824" FOREIGN KEY ("mainGroupByFieldMetadataId") REFERENCES core."fieldMetadata"(id) ON DELETE CASCADE;


--
-- Name: role FK_d2532f520d84f8c22ee45681c5a; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.role
    ADD CONSTRAINT "FK_d2532f520d84f8c22ee45681c5a" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: viewFilter FK_d5651cf33fa56a47cd262a3fb2c; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."viewFilter"
    ADD CONSTRAINT "FK_d5651cf33fa56a47cd262a3fb2c" FOREIGN KEY ("applicationId") REFERENCES core.application(id) ON DELETE CASCADE;


--
-- Name: applicationRegistration FK_d5aa70ce34f5b8e51e5b0deafc2; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."applicationRegistration"
    ADD CONSTRAINT "FK_d5aa70ce34f5b8e51e5b0deafc2" FOREIGN KEY ("createdByUserId") REFERENCES core."user"(id) ON DELETE SET NULL;


--
-- Name: fieldPermission FK_d5c47a26fe71648894d05da3d3a; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."fieldPermission"
    ADD CONSTRAINT "FK_d5c47a26fe71648894d05da3d3a" FOREIGN KEY ("fieldMetadataId") REFERENCES core."fieldMetadata"(id) ON DELETE CASCADE;


--
-- Name: rowLevelPermissionPredicate FK_d5ee96a9a03761f2c328a29523c; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."rowLevelPermissionPredicate"
    ADD CONSTRAINT "FK_d5ee96a9a03761f2c328a29523c" FOREIGN KEY ("objectMetadataId") REFERENCES core."objectMetadata"(id) ON DELETE CASCADE;


--
-- Name: appToken FK_d6ae19a7aa2bbd4919053257772; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."appToken"
    ADD CONSTRAINT "FK_d6ae19a7aa2bbd4919053257772" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: viewField FK_d6f7c88260b1d4eaa8ad0f13c26; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."viewField"
    ADD CONSTRAINT "FK_d6f7c88260b1d4eaa8ad0f13c26" FOREIGN KEY ("viewFieldGroupId") REFERENCES core."viewFieldGroup"(id) ON DELETE SET NULL;


--
-- Name: objectMetadata FK_d82a05a204136c01388ea80bc7a; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."objectMetadata"
    ADD CONSTRAINT "FK_d82a05a204136c01388ea80bc7a" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: indexFieldMetadata FK_d8cf7f15cf6466ac0e3b443b3d2; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."indexFieldMetadata"
    ADD CONSTRAINT "FK_d8cf7f15cf6466ac0e3b443b3d2" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: logicFunction FK_daed3cd4d8048fbe85646874615; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."logicFunction"
    ADD CONSTRAINT "FK_daed3cd4d8048fbe85646874615" FOREIGN KEY ("applicationId") REFERENCES core.application(id) ON DELETE CASCADE;


--
-- Name: fieldPermission FK_dc8e552397f5e44d175fedf752a; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."fieldPermission"
    ADD CONSTRAINT "FK_dc8e552397f5e44d175fedf752a" FOREIGN KEY ("objectMetadataId") REFERENCES core."objectMetadata"(id) ON DELETE CASCADE;


--
-- Name: viewFilterGroup FK_dce74ab06fa7a2effcbf1b98dff; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."viewFilterGroup"
    ADD CONSTRAINT "FK_dce74ab06fa7a2effcbf1b98dff" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: pageLayout FK_dd63ca42614bacf58971aabdcbb; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."pageLayout"
    ADD CONSTRAINT "FK_dd63ca42614bacf58971aabdcbb" FOREIGN KEY ("objectMetadataId") REFERENCES core."objectMetadata"(id) ON DELETE CASCADE;


--
-- Name: fieldMetadata FK_de2a09b9e3e690440480d2dee26; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."fieldMetadata"
    ADD CONSTRAINT "FK_de2a09b9e3e690440480d2dee26" FOREIGN KEY ("objectMetadataId") REFERENCES core."objectMetadata"(id) ON DELETE CASCADE;


--
-- Name: file FK_de468b3d8dcf7e94f7074220929; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.file
    ADD CONSTRAINT "FK_de468b3d8dcf7e94f7074220929" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: dataSource FK_e1914827ee8b22fba4254578311; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."dataSource"
    ADD CONSTRAINT "FK_e1914827ee8b22fba4254578311" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: webhook FK_e755f49a9ef74b36e27932f7a6c; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.webhook
    ADD CONSTRAINT "FK_e755f49a9ef74b36e27932f7a6c" FOREIGN KEY ("applicationId") REFERENCES core.application(id) ON DELETE CASCADE;


--
-- Name: messageFolder FK_e7fb85af997d06d8f7cc7512801; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."messageFolder"
    ADD CONSTRAINT "FK_e7fb85af997d06d8f7cc7512801" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: rowLevelPermissionPredicate FK_eadcbbb92b6d58c6785a780b5b7; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."rowLevelPermissionPredicate"
    ADD CONSTRAINT "FK_eadcbbb92b6d58c6785a780b5b7" FOREIGN KEY ("fieldMetadataId") REFERENCES core."fieldMetadata"(id) ON DELETE CASCADE;


--
-- Name: objectPermission FK_edcd87df18d3284141757bf6e16; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."objectPermission"
    ADD CONSTRAINT "FK_edcd87df18d3284141757bf6e16" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: objectPermission FK_efbcf3528718de2b5c45c0a8a83; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."objectPermission"
    ADD CONSTRAINT "FK_efbcf3528718de2b5c45c0a8a83" FOREIGN KEY ("objectMetadataId") REFERENCES core."objectMetadata"(id) ON DELETE CASCADE;


--
-- Name: objectPermission FK_f2ecee1066fd43800dbc85f87e4; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."objectPermission"
    ADD CONSTRAINT "FK_f2ecee1066fd43800dbc85f87e4" FOREIGN KEY ("applicationId") REFERENCES core.application(id) ON DELETE CASCADE;


--
-- Name: agentMessagePart FK_f3865544cee5742b5f5dd7340ef; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."agentMessagePart"
    ADD CONSTRAINT "FK_f3865544cee5742b5f5dd7340ef" FOREIGN KEY ("fileId") REFERENCES core.file(id) ON DELETE RESTRICT;


--
-- Name: pageLayoutWidget FK_fb84d310b4cfe5916ced6fc3e2a; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."pageLayoutWidget"
    ADD CONSTRAINT "FK_fb84d310b4cfe5916ced6fc3e2a" FOREIGN KEY ("applicationId") REFERENCES core.application(id) ON DELETE CASCADE;


--
-- Name: viewSort FK_ff8cbebe1704954120df82bf393; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."viewSort"
    ADD CONSTRAINT "FK_ff8cbebe1704954120df82bf393" FOREIGN KEY ("applicationId") REFERENCES core.application(id) ON DELETE CASCADE;


--
-- Name: timelineActivity FK_017f8e2306dc1b0182a33b062a5; Type: FK CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c."timelineActivity"
    ADD CONSTRAINT "FK_017f8e2306dc1b0182a33b062a5" FOREIGN KEY ("targetWorkflowId") REFERENCES workspace_5tvw23m2ae5qhvivd4el66s5c.workflow(id) ON DELETE CASCADE;


--
-- Name: timelineActivity FK_0482ca18fc5e49456ce97cf61aa; Type: FK CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c."timelineActivity"
    ADD CONSTRAINT "FK_0482ca18fc5e49456ce97cf61aa" FOREIGN KEY ("targetOpportunityId") REFERENCES workspace_5tvw23m2ae5qhvivd4el66s5c.opportunity(id) ON DELETE SET NULL;


--
-- Name: taskTarget FK_050bf68b54d229f319d6a73ba1c; Type: FK CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c."taskTarget"
    ADD CONSTRAINT "FK_050bf68b54d229f319d6a73ba1c" FOREIGN KEY ("targetPersonId") REFERENCES workspace_5tvw23m2ae5qhvivd4el66s5c.person(id) ON DELETE CASCADE;


--
-- Name: timelineActivity FK_068146151017a5f32c3b152ac04; Type: FK CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c."timelineActivity"
    ADD CONSTRAINT "FK_068146151017a5f32c3b152ac04" FOREIGN KEY ("targetNoteId") REFERENCES workspace_5tvw23m2ae5qhvivd4el66s5c.note(id) ON DELETE SET NULL;


--
-- Name: calendarEventParticipant FK_082f03025609e55b3d55de7cc28; Type: FK CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c."calendarEventParticipant"
    ADD CONSTRAINT "FK_082f03025609e55b3d55de7cc28" FOREIGN KEY ("calendarEventId") REFERENCES workspace_5tvw23m2ae5qhvivd4el66s5c."calendarEvent"(id) ON DELETE CASCADE;


--
-- Name: noteTarget FK_09ab39a1e4408f5a31ab8761bf7; Type: FK CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c."noteTarget"
    ADD CONSTRAINT "FK_09ab39a1e4408f5a31ab8761bf7" FOREIGN KEY ("targetHabitId") REFERENCES workspace_5tvw23m2ae5qhvivd4el66s5c._habit(id) ON DELETE SET NULL;


--
-- Name: calendarChannelEventAssociation FK_1fc99b189521f153bf3bbac7324; Type: FK CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c."calendarChannelEventAssociation"
    ADD CONSTRAINT "FK_1fc99b189521f153bf3bbac7324" FOREIGN KEY ("calendarEventId") REFERENCES workspace_5tvw23m2ae5qhvivd4el66s5c."calendarEvent"(id) ON DELETE CASCADE;


--
-- Name: timelineActivity FK_23ea8a9080759633a448287c157; Type: FK CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c."timelineActivity"
    ADD CONSTRAINT "FK_23ea8a9080759633a448287c157" FOREIGN KEY ("targetWorkflowVersionId") REFERENCES workspace_5tvw23m2ae5qhvivd4el66s5c."workflowVersion"(id) ON DELETE CASCADE;


--
-- Name: workflowRun FK_25b2bf1832ffa264f8dc39f7dab; Type: FK CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c."workflowRun"
    ADD CONSTRAINT "FK_25b2bf1832ffa264f8dc39f7dab" FOREIGN KEY ("workflowVersionId") REFERENCES workspace_5tvw23m2ae5qhvivd4el66s5c."workflowVersion"(id) ON DELETE SET NULL;


--
-- Name: _habitLog FK_2884494860c03b6e4eb8b63f130; Type: FK CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c."_habitLog"
    ADD CONSTRAINT "FK_2884494860c03b6e4eb8b63f130" FOREIGN KEY ("habitId") REFERENCES workspace_5tvw23m2ae5qhvivd4el66s5c._habit(id) ON DELETE SET NULL;


--
-- Name: messageChannel FK_2e966cbb240771c67630d52895c; Type: FK CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannel"
    ADD CONSTRAINT "FK_2e966cbb240771c67630d52895c" FOREIGN KEY ("connectedAccountId") REFERENCES workspace_5tvw23m2ae5qhvivd4el66s5c."connectedAccount"(id) ON DELETE CASCADE;


--
-- Name: timelineActivity FK_393340ea834ab8660b51d482f29; Type: FK CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c."timelineActivity"
    ADD CONSTRAINT "FK_393340ea834ab8660b51d482f29" FOREIGN KEY ("targetDashboardId") REFERENCES workspace_5tvw23m2ae5qhvivd4el66s5c.dashboard(id) ON DELETE SET NULL;


--
-- Name: timelineActivity FK_3c53994e4a67712996d6a9cbf8d; Type: FK CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c."timelineActivity"
    ADD CONSTRAINT "FK_3c53994e4a67712996d6a9cbf8d" FOREIGN KEY ("targetWorkflowRunId") REFERENCES workspace_5tvw23m2ae5qhvivd4el66s5c."workflowRun"(id) ON DELETE CASCADE;


--
-- Name: timelineActivity FK_4c3dea6e2df97ea05126bf62b80; Type: FK CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c."timelineActivity"
    ADD CONSTRAINT "FK_4c3dea6e2df97ea05126bf62b80" FOREIGN KEY ("targetHabitId") REFERENCES workspace_5tvw23m2ae5qhvivd4el66s5c._habit(id) ON DELETE SET NULL;


--
-- Name: timelineActivity FK_4d266cbeff57096026be4b97ee3; Type: FK CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c."timelineActivity"
    ADD CONSTRAINT "FK_4d266cbeff57096026be4b97ee3" FOREIGN KEY ("targetTaskId") REFERENCES workspace_5tvw23m2ae5qhvivd4el66s5c.task(id) ON DELETE SET NULL;


--
-- Name: message FK_51fa5df1094bfdbf99ea91a72fa; Type: FK CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c.message
    ADD CONSTRAINT "FK_51fa5df1094bfdbf99ea91a72fa" FOREIGN KEY ("messageThreadId") REFERENCES workspace_5tvw23m2ae5qhvivd4el66s5c."messageThread"(id) ON DELETE CASCADE;


--
-- Name: noteTarget FK_52050fd9cf6b7ba9982ef9d867a; Type: FK CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c."noteTarget"
    ADD CONSTRAINT "FK_52050fd9cf6b7ba9982ef9d867a" FOREIGN KEY ("noteId") REFERENCES workspace_5tvw23m2ae5qhvivd4el66s5c.note(id) ON DELETE CASCADE;


--
-- Name: taskTarget FK_541a135be77458071b4969921d8; Type: FK CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c."taskTarget"
    ADD CONSTRAINT "FK_541a135be77458071b4969921d8" FOREIGN KEY ("targetHabitLogId") REFERENCES workspace_5tvw23m2ae5qhvivd4el66s5c."_habitLog"(id) ON DELETE SET NULL;


--
-- Name: attachment FK_59071b50b641a16741369f61f1a; Type: FK CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c.attachment
    ADD CONSTRAINT "FK_59071b50b641a16741369f61f1a" FOREIGN KEY ("targetNoteId") REFERENCES workspace_5tvw23m2ae5qhvivd4el66s5c.note(id) ON DELETE SET NULL;


--
-- Name: opportunity FK_5a104112b21bbebb37fca93a548; Type: FK CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c.opportunity
    ADD CONSTRAINT "FK_5a104112b21bbebb37fca93a548" FOREIGN KEY ("companyId") REFERENCES workspace_5tvw23m2ae5qhvivd4el66s5c.company(id) ON DELETE SET NULL;


--
-- Name: noteTarget FK_5afbc6b8d586b33b1985c5ca1ff; Type: FK CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c."noteTarget"
    ADD CONSTRAINT "FK_5afbc6b8d586b33b1985c5ca1ff" FOREIGN KEY ("targetPersonId") REFERENCES workspace_5tvw23m2ae5qhvivd4el66s5c.person(id) ON DELETE CASCADE;


--
-- Name: noteTarget FK_619ca9970b718bfbc36498381ad; Type: FK CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c."noteTarget"
    ADD CONSTRAINT "FK_619ca9970b718bfbc36498381ad" FOREIGN KEY ("targetHabitLogId") REFERENCES workspace_5tvw23m2ae5qhvivd4el66s5c."_habitLog"(id) ON DELETE SET NULL;


--
-- Name: noteTarget FK_659eca453a19006d9f12e76e646; Type: FK CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c."noteTarget"
    ADD CONSTRAINT "FK_659eca453a19006d9f12e76e646" FOREIGN KEY ("targetOpportunityId") REFERENCES workspace_5tvw23m2ae5qhvivd4el66s5c.opportunity(id) ON DELETE CASCADE;


--
-- Name: messageParticipant FK_670c8b151ad702613fce89b3662; Type: FK CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c."messageParticipant"
    ADD CONSTRAINT "FK_670c8b151ad702613fce89b3662" FOREIGN KEY ("messageId") REFERENCES workspace_5tvw23m2ae5qhvivd4el66s5c.message(id) ON DELETE CASCADE;


--
-- Name: opportunity FK_67371a1e3fd5bac524f7e914bad; Type: FK CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c.opportunity
    ADD CONSTRAINT "FK_67371a1e3fd5bac524f7e914bad" FOREIGN KEY ("ownerId") REFERENCES workspace_5tvw23m2ae5qhvivd4el66s5c."workspaceMember"(id) ON DELETE SET NULL;


--
-- Name: connectedAccount FK_6b4f87f1cff07faee5635ff6a6d; Type: FK CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c."connectedAccount"
    ADD CONSTRAINT "FK_6b4f87f1cff07faee5635ff6a6d" FOREIGN KEY ("accountOwnerId") REFERENCES workspace_5tvw23m2ae5qhvivd4el66s5c."workspaceMember"(id) ON DELETE CASCADE;


--
-- Name: task FK_7384988f7eeb777e44802a0baca; Type: FK CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c.task
    ADD CONSTRAINT "FK_7384988f7eeb777e44802a0baca" FOREIGN KEY ("assigneeId") REFERENCES workspace_5tvw23m2ae5qhvivd4el66s5c."workspaceMember"(id) ON DELETE SET NULL;


--
-- Name: attachment FK_73f3acb2a2eebe7834a9918116d; Type: FK CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c.attachment
    ADD CONSTRAINT "FK_73f3acb2a2eebe7834a9918116d" FOREIGN KEY ("targetPersonId") REFERENCES workspace_5tvw23m2ae5qhvivd4el66s5c.person(id) ON DELETE CASCADE;


--
-- Name: timelineActivity FK_7460f3992bc8d73165b3b2874e6; Type: FK CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c."timelineActivity"
    ADD CONSTRAINT "FK_7460f3992bc8d73165b3b2874e6" FOREIGN KEY ("targetCompanyId") REFERENCES workspace_5tvw23m2ae5qhvivd4el66s5c.company(id) ON DELETE CASCADE;


--
-- Name: calendarEventParticipant FK_78e8a7e863f3d614d3d30034479; Type: FK CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c."calendarEventParticipant"
    ADD CONSTRAINT "FK_78e8a7e863f3d614d3d30034479" FOREIGN KEY ("personId") REFERENCES workspace_5tvw23m2ae5qhvivd4el66s5c.person(id) ON DELETE SET NULL;


--
-- Name: taskTarget FK_7b5ee65641d4f0b15cdde24aef5; Type: FK CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c."taskTarget"
    ADD CONSTRAINT "FK_7b5ee65641d4f0b15cdde24aef5" FOREIGN KEY ("targetOpportunityId") REFERENCES workspace_5tvw23m2ae5qhvivd4el66s5c.opportunity(id) ON DELETE CASCADE;


--
-- Name: taskTarget FK_7e4d4dfe6a4af120a7ece98d77d; Type: FK CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c."taskTarget"
    ADD CONSTRAINT "FK_7e4d4dfe6a4af120a7ece98d77d" FOREIGN KEY ("targetCompanyId") REFERENCES workspace_5tvw23m2ae5qhvivd4el66s5c.company(id) ON DELETE CASCADE;


--
-- Name: messageParticipant FK_840b9ccea0055abb8b3e980638c; Type: FK CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c."messageParticipant"
    ADD CONSTRAINT "FK_840b9ccea0055abb8b3e980638c" FOREIGN KEY ("workspaceMemberId") REFERENCES workspace_5tvw23m2ae5qhvivd4el66s5c."workspaceMember"(id) ON DELETE SET NULL;


--
-- Name: timelineActivity FK_875809b410c253073b5aa812c9a; Type: FK CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c."timelineActivity"
    ADD CONSTRAINT "FK_875809b410c253073b5aa812c9a" FOREIGN KEY ("targetPersonId") REFERENCES workspace_5tvw23m2ae5qhvivd4el66s5c.person(id) ON DELETE CASCADE;


--
-- Name: taskTarget FK_883db2bbdbf6cf16450fd0af300; Type: FK CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c."taskTarget"
    ADD CONSTRAINT "FK_883db2bbdbf6cf16450fd0af300" FOREIGN KEY ("targetHabitId") REFERENCES workspace_5tvw23m2ae5qhvivd4el66s5c._habit(id) ON DELETE SET NULL;


--
-- Name: messageChannelMessageAssociation FK_9b53fe617a3a4c0fa231703a64f; Type: FK CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannelMessageAssociation"
    ADD CONSTRAINT "FK_9b53fe617a3a4c0fa231703a64f" FOREIGN KEY ("messageId") REFERENCES workspace_5tvw23m2ae5qhvivd4el66s5c.message(id) ON DELETE CASCADE;


--
-- Name: attachment FK_9bc751fb8a45a0959e4533b0d30; Type: FK CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c.attachment
    ADD CONSTRAINT "FK_9bc751fb8a45a0959e4533b0d30" FOREIGN KEY ("targetHabitLogId") REFERENCES workspace_5tvw23m2ae5qhvivd4el66s5c."_habitLog"(id) ON DELETE SET NULL;


--
-- Name: timelineActivity FK_a861d35bd1cb5cc7c19a70bd382; Type: FK CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c."timelineActivity"
    ADD CONSTRAINT "FK_a861d35bd1cb5cc7c19a70bd382" FOREIGN KEY ("targetHabitLogId") REFERENCES workspace_5tvw23m2ae5qhvivd4el66s5c."_habitLog"(id) ON DELETE SET NULL;


--
-- Name: company FK_abe91dff1e48d77edca339f387c; Type: FK CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c.company
    ADD CONSTRAINT "FK_abe91dff1e48d77edca339f387c" FOREIGN KEY ("accountOwnerId") REFERENCES workspace_5tvw23m2ae5qhvivd4el66s5c."workspaceMember"(id) ON DELETE SET NULL;


--
-- Name: noteTarget FK_b10df13291b5386b984298bdf20; Type: FK CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c."noteTarget"
    ADD CONSTRAINT "FK_b10df13291b5386b984298bdf20" FOREIGN KEY ("targetCompanyId") REFERENCES workspace_5tvw23m2ae5qhvivd4el66s5c.company(id) ON DELETE CASCADE;


--
-- Name: messageChannelMessageAssociationMessageFolder FK_b5510ced6b48600c5a1ab14ec42; Type: FK CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannelMessageAssociationMessageFolder"
    ADD CONSTRAINT "FK_b5510ced6b48600c5a1ab14ec42" FOREIGN KEY ("messageChannelMessageAssociationId") REFERENCES workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannelMessageAssociation"(id) ON DELETE CASCADE;


--
-- Name: attachment FK_b7c6ea80823b826f32fcea66890; Type: FK CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c.attachment
    ADD CONSTRAINT "FK_b7c6ea80823b826f32fcea66890" FOREIGN KEY ("targetCompanyId") REFERENCES workspace_5tvw23m2ae5qhvivd4el66s5c.company(id) ON DELETE CASCADE;


--
-- Name: timelineActivity FK_b8af01591f389f596f7be54b13d; Type: FK CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c."timelineActivity"
    ADD CONSTRAINT "FK_b8af01591f389f596f7be54b13d" FOREIGN KEY ("workspaceMemberId") REFERENCES workspace_5tvw23m2ae5qhvivd4el66s5c."workspaceMember"(id) ON DELETE CASCADE;


--
-- Name: blocklist FK_bbaebad9d11e773689cb3cdf997; Type: FK CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c.blocklist
    ADD CONSTRAINT "FK_bbaebad9d11e773689cb3cdf997" FOREIGN KEY ("workspaceMemberId") REFERENCES workspace_5tvw23m2ae5qhvivd4el66s5c."workspaceMember"(id) ON DELETE SET NULL;


--
-- Name: workflowVersion FK_c3d1cd364eab2fe2a207964738c; Type: FK CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c."workflowVersion"
    ADD CONSTRAINT "FK_c3d1cd364eab2fe2a207964738c" FOREIGN KEY ("workflowId") REFERENCES workspace_5tvw23m2ae5qhvivd4el66s5c.workflow(id) ON DELETE CASCADE;


--
-- Name: calendarChannel FK_c7bc368c97a18a072413d67cf45; Type: FK CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c."calendarChannel"
    ADD CONSTRAINT "FK_c7bc368c97a18a072413d67cf45" FOREIGN KEY ("connectedAccountId") REFERENCES workspace_5tvw23m2ae5qhvivd4el66s5c."connectedAccount"(id) ON DELETE CASCADE;


--
-- Name: taskTarget FK_c95f3cce2b95309005a9d1ed824; Type: FK CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c."taskTarget"
    ADD CONSTRAINT "FK_c95f3cce2b95309005a9d1ed824" FOREIGN KEY ("taskId") REFERENCES workspace_5tvw23m2ae5qhvivd4el66s5c.task(id) ON DELETE CASCADE;


--
-- Name: messageParticipant FK_cbfaa3bb38cced64ea9576016c2; Type: FK CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c."messageParticipant"
    ADD CONSTRAINT "FK_cbfaa3bb38cced64ea9576016c2" FOREIGN KEY ("personId") REFERENCES workspace_5tvw23m2ae5qhvivd4el66s5c.person(id) ON DELETE SET NULL;


--
-- Name: calendarEventParticipant FK_cd980caeb07e091a71780e5a367; Type: FK CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c."calendarEventParticipant"
    ADD CONSTRAINT "FK_cd980caeb07e091a71780e5a367" FOREIGN KEY ("workspaceMemberId") REFERENCES workspace_5tvw23m2ae5qhvivd4el66s5c."workspaceMember"(id) ON DELETE SET NULL;


--
-- Name: opportunity FK_ce5aa294b17fe23a0b19267f1e1; Type: FK CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c.opportunity
    ADD CONSTRAINT "FK_ce5aa294b17fe23a0b19267f1e1" FOREIGN KEY ("pointOfContactId") REFERENCES workspace_5tvw23m2ae5qhvivd4el66s5c.person(id) ON DELETE SET NULL;


--
-- Name: attachment FK_d8e3323258d8fc337790047f7cf; Type: FK CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c.attachment
    ADD CONSTRAINT "FK_d8e3323258d8fc337790047f7cf" FOREIGN KEY ("targetWorkflowId") REFERENCES workspace_5tvw23m2ae5qhvivd4el66s5c.workflow(id) ON DELETE CASCADE;


--
-- Name: attachment FK_d905be15c598bb157b5e3326106; Type: FK CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c.attachment
    ADD CONSTRAINT "FK_d905be15c598bb157b5e3326106" FOREIGN KEY ("targetHabitId") REFERENCES workspace_5tvw23m2ae5qhvivd4el66s5c._habit(id) ON DELETE SET NULL;


--
-- Name: workflowRun FK_da6e20d423109a993f1d63938e6; Type: FK CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c."workflowRun"
    ADD CONSTRAINT "FK_da6e20d423109a993f1d63938e6" FOREIGN KEY ("workflowId") REFERENCES workspace_5tvw23m2ae5qhvivd4el66s5c.workflow(id) ON DELETE CASCADE;


--
-- Name: workflowAutomatedTrigger FK_e078063f0cbce9767a0f8ca431d; Type: FK CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c."workflowAutomatedTrigger"
    ADD CONSTRAINT "FK_e078063f0cbce9767a0f8ca431d" FOREIGN KEY ("workflowId") REFERENCES workspace_5tvw23m2ae5qhvivd4el66s5c.workflow(id) ON DELETE CASCADE;


--
-- Name: attachment FK_e7ae79d27ad97d13b4b7638928c; Type: FK CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c.attachment
    ADD CONSTRAINT "FK_e7ae79d27ad97d13b4b7638928c" FOREIGN KEY ("targetTaskId") REFERENCES workspace_5tvw23m2ae5qhvivd4el66s5c.task(id) ON DELETE SET NULL;


--
-- Name: messageChannelMessageAssociation FK_ed17eebc0ece37ca05951cefb30; Type: FK CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c."messageChannelMessageAssociation"
    ADD CONSTRAINT "FK_ed17eebc0ece37ca05951cefb30" FOREIGN KEY ("messageThreadId") REFERENCES workspace_5tvw23m2ae5qhvivd4el66s5c."messageThread"(id) ON DELETE CASCADE;


--
-- Name: person FK_ee066ddacfce46c9a7cb90edd1a; Type: FK CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c.person
    ADD CONSTRAINT "FK_ee066ddacfce46c9a7cb90edd1a" FOREIGN KEY ("companyId") REFERENCES workspace_5tvw23m2ae5qhvivd4el66s5c.company(id) ON DELETE SET NULL;


--
-- Name: attachment FK_f46951be10839ac85e570507b35; Type: FK CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c.attachment
    ADD CONSTRAINT "FK_f46951be10839ac85e570507b35" FOREIGN KEY ("targetOpportunityId") REFERENCES workspace_5tvw23m2ae5qhvivd4el66s5c.opportunity(id) ON DELETE CASCADE;


--
-- Name: attachment FK_fff5fb78a7df5db6586ac686c47; Type: FK CONSTRAINT; Schema: workspace_5tvw23m2ae5qhvivd4el66s5c; Owner: postgres
--

ALTER TABLE ONLY workspace_5tvw23m2ae5qhvivd4el66s5c.attachment
    ADD CONSTRAINT "FK_fff5fb78a7df5db6586ac686c47" FOREIGN KEY ("targetDashboardId") REFERENCES workspace_5tvw23m2ae5qhvivd4el66s5c.dashboard(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict YrFlPaiVqQNVcGLj0Krwyheti5V4bHsvoowY7h8GyEXFtmweaQlgYXlB3aVrnUp

