BEGIN
    INSERT INTO dashboards_versions(
        type,
        state,
        name,
        slug_name,
        title,
        description,
        pdf_url,
        embedded_url,
        purchase_url,
        demo,
        public_author,
        private_author,
        background,
        footer_text,
        css_global,
        inputs,
        is_template,
        on_delete_url,
        on_update_url,
        last_updates,
        public,
        visible,
        pages,
        tags
    )
	VALUES(
        NEW.type,
        NEW.state,
        NEW.name,
        NEW.slug_name,
        NEW.title,
        NEW.description,
        NEW.pdf_url,
        NEW.embedded_url,
        NEW.purchase_url,
        NEW.demo,
        NEW.public_author,
        NEW.private_author,
        NEW.background,
        NEW.footer_text,
        NEW.css_global,
        NEW.inputs,
        NEW.is_template,
        NEW.on_delete_url,
        NEW.on_update_url,
        NEW.last_updates,
        NEW.public,
        NEW.visible,
        NEW.pages,
        NEW.tags
    );
   	RETURN NEW;
END

CREATE TRIGGER trigger_save_dashboard_version
    AFTER INSERT OR UPDATE
    ON dashboards
    FOR EACH ROW
    EXECUTE PROCEDURE save_dashboard_version();