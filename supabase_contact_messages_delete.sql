-- Apply to existing Supabase projects to enable administrator message deletion.
ALTER TABLE public.contact_messages ENABLE ROW LEVEL SECURITY;

GRANT DELETE ON TABLE public.contact_messages TO authenticated;

DROP POLICY IF EXISTS "Admins can delete contact messages" ON public.contact_messages;
CREATE POLICY "Admins can delete contact messages"
  ON public.contact_messages FOR DELETE TO authenticated
  USING (public.is_admin());
