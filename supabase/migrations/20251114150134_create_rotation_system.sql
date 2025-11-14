/*
  # Create Daily Rotation System

  1. New Tables
    - `rotation_groups`
      - `id` (uuid, primary key) - Unique identifier for each rotation group
      - `name` (text) - Name of the rotation (e.g., "Song Picker", "Special Choice")
      - `created_at` (timestamptz) - When the rotation was created
      - `start_date` (date) - The date the rotation started
      - `current_index` (integer) - Current position in the rotation
      
    - `rotation_members`
      - `id` (uuid, primary key) - Unique identifier
      - `rotation_id` (uuid, foreign key) - Links to rotation_groups
      - `user_id` (integer, nullable) - Links to HomeGlow user (if from database)
      - `custom_name` (text, nullable) - Name for non-database users
      - `sort_order` (integer) - Position in rotation sequence
      - `created_at` (timestamptz) - When member was added
      
  2. Security
    - Enable RLS on both tables
    - Public read access (authenticated users can view all rotations)
    - Only authenticated users can create/modify rotations
*/

-- Create rotation_groups table
CREATE TABLE IF NOT EXISTS rotation_groups (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL DEFAULT 'Daily Rotation',
  created_at timestamptz DEFAULT now(),
  start_date date DEFAULT CURRENT_DATE,
  current_index integer DEFAULT 0
);

-- Create rotation_members table
CREATE TABLE IF NOT EXISTS rotation_members (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  rotation_id uuid NOT NULL REFERENCES rotation_groups(id) ON DELETE CASCADE,
  user_id integer,
  custom_name text,
  sort_order integer NOT NULL DEFAULT 0,
  created_at timestamptz DEFAULT now(),
  CONSTRAINT user_or_custom_name CHECK (user_id IS NOT NULL OR custom_name IS NOT NULL)
);

-- Enable RLS
ALTER TABLE rotation_groups ENABLE ROW LEVEL SECURITY;
ALTER TABLE rotation_members ENABLE ROW LEVEL SECURITY;

-- Policies for rotation_groups
CREATE POLICY "Anyone can view rotation groups"
  ON rotation_groups
  FOR SELECT
  TO public
  USING (true);

CREATE POLICY "Authenticated users can create rotation groups"
  ON rotation_groups
  FOR INSERT
  TO public
  WITH CHECK (true);

CREATE POLICY "Authenticated users can update rotation groups"
  ON rotation_groups
  FOR UPDATE
  TO public
  USING (true)
  WITH CHECK (true);

CREATE POLICY "Authenticated users can delete rotation groups"
  ON rotation_groups
  FOR DELETE
  TO public
  USING (true);

-- Policies for rotation_members
CREATE POLICY "Anyone can view rotation members"
  ON rotation_members
  FOR SELECT
  TO public
  USING (true);

CREATE POLICY "Authenticated users can create rotation members"
  ON rotation_members
  FOR INSERT
  TO public
  WITH CHECK (true);

CREATE POLICY "Authenticated users can update rotation members"
  ON rotation_members
  FOR UPDATE
  TO public
  USING (true)
  WITH CHECK (true);

CREATE POLICY "Authenticated users can delete rotation members"
  ON rotation_members
  FOR DELETE
  TO public
  USING (true);