class TableInfo{
  static const String androidRepository = "android_repository";
  static const String androidRepositoryTableQuery = "CREATE TABLE IF NOT EXISTS $androidRepository (id TEXT PRIMARY KEY ON CONFLICT IGNORE, name TEXT, full_name TEXT, login TEXT, avatar_url TEXT, description TEXT, stargazers_count TEXT, watchers_count TEXT, forks TEXT, updated_at TEXT, deleted_at TIMESTAMP DEFAULT NULL)";
}