return {
	settings = {
		yaml = {
			schemaStore = {
				-- You must disable built-in schemaStore support if you want to use
				-- this plugin and its advanced options like `ignore`.
				enable = false,
				-- Avoid TypeError: Cannot read properties of undefined (reading 'length')
				url = "",
			},
			-- schemas = {
			-- 	kubernetes = "*.k8s.{yml,yaml}",
			-- },
			schemas = require("schemastore").yaml.schemas(),
			-- 	extra = {
			-- 		schemas = {
			-- 			{
			-- 				description = "Kubernetes 1.22.4",
			-- 				name = "K8s",
			-- 				fileMatch = { "*.k8s.{yml,yaml}" },
			-- 				url = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.22.4-standalone-strict/all.json",
			-- 			},
			-- 			-- kubernetes = "*.yaml",
			-- 			-- ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
			-- 			-- ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
			-- 			-- ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
			-- 			-- ["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
			-- 			-- ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
			-- 			-- ["http://json.schemastore.org/ansible-playbook"] = "*play*.{yml,yaml}",
			-- 			-- ["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
			-- 			-- ["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
			-- 			-- ["https://json.schemastore.org/gitlab-ci"] = "*gitlab-ci*.{yml,yaml}",
			-- 			-- ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "*api*.{yml,yaml}",
			-- 			-- ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
			-- 			-- ["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = "*flow*.{yml,yaml}",
			-- 		},
			-- 	},
			-- }),
		},
	},
}
